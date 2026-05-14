import pandas as pd
import talib, json

from django_rq import job
from django.db import transaction
from django.db.models import F
from libs import wechat, constants

from stock.models import ths_daily_quotes, pick_strategy, pick_strategy_result, ths_stock_indicators
from stock.tasks import is_trade_day


@job('ths_worker', timeout=constants.JOB_TIMEOUT, result_ttl=constants.RESULT_TTL)
def get_good_stocks(strategy_id, tx_date, ignore_trade_day=False):
    if not ignore_trade_day and not is_trade_day():
        return "非交易日"
    
    strategy_obj = pick_strategy.objects.get(id=strategy_id)
    
    df = pick_stocks_with_macd(tx_date)
    max_date = pd.to_datetime(df['time'].max()).strftime('%Y-%m-%d')
    
    if max_date != tx_date:
        raise Exception(f"策略运行失败：无当日行情数据（最近行情数据为：{max_date}）")
    
    selected = []
    for _, row in df.iterrows():
        if is_good_stock(row):
            selected.append(row)

    df_ret = pd.DataFrame(selected)    
    ret_summary = f"{tx_date} | {strategy_obj.strategy_name} | 今日无信号。"

    if not df_ret.empty:
        header = f"{tx_date} | {strategy_obj.strategy_name} | 共{len(df_ret)}只："
        formatted_lines = [header, "-" * 20]
        
        results_to_create = []
        for _, row in df_ret.iterrows():
            addition_info = { 'macd': float(row['macd']) }
            
            results_to_create.append(pick_strategy_result(
                strategy=strategy_obj,
                pick_date=tx_date,
                stock_code_id=row['code'],
                addition_info=json.dumps(addition_info, ensure_ascii=False)
            ))

            formatted_lines.append(f"{row['code']} {row['name']}【{row['macd']}】")
        
        ret_summary = "\r\n".join(formatted_lines)
        with transaction.atomic():
            pick_strategy_result.objects.filter(strategy=strategy_obj, pick_date=tx_date).delete()
            pick_strategy_result.objects.bulk_create(results_to_create)
 
    wechat.send_text_message(1, ret_summary)
    
    return ret_summary


def pick_stocks_with_macd(tx_date):
    recent_dates = ths_daily_quotes.objects.filter(trade_dt__lte=tx_date).values_list('trade_dt', flat=True).distinct().order_by('-trade_dt')[:15]
    min_date = list(recent_dates)[-1]
    
    quote_rs = ths_daily_quotes.objects.filter(
        trade_dt__range=(min_date, tx_date)
    ).select_related('stock_code').annotate(
        name=F('stock_code__stock_name')
    ).values(
        'trade_dt', 'stock_code', 'name', 'close_price'
    ).order_by('stock_code', 'trade_dt')

    df = pd.DataFrame(list(quote_rs))
    df.rename(columns={
        'trade_dt': 'time',
        'stock_code': 'code',
        'close_price': 'close'
    }, inplace=True)

    df['close'] = df['close'].astype(float).values 
    df['ma5'] = 0.0
    df['ma10'] = 0.0
    
    for _, group in df.groupby('code'):
        idx = group.index
        df.loc[idx, 'ma5'] = talib.SMA(group['close'].values, timeperiod=5)
        df.loc[idx, 'ma10'] = talib.SMA(group['close'].values, timeperiod=10)
    
    df_last = df.groupby('code').tail(1)
    
    indicator_rs= ths_stock_indicators.objects.filter(
        trade_dt=tx_date
    ).values(
        'stock_code', 'ma20', 'ma30', 'ma49', 'ma60', 'ma120', 'ma250', 'macd_bar'
    )
    
    df_indicators = pd.DataFrame(list(indicator_rs))
    df_indicators.rename(columns={ 'stock_code': 'code', 'macd_bar':'macd' }, inplace=True)
    
    for col in ['ma20', 'ma30', 'ma49', 'ma60', 'ma120', 'ma250', 'macd']:
        df_indicators[col] = df_indicators[col].astype(float)
    
    df_indicators['macd'] = df_indicators['macd'].round(2)
    
    df_final = pd.merge(df_last, df_indicators, on='code', how='left')

    return df_final


def is_good_stock(row):
    isPrice_Rule1 = (row['ma5'] > row['ma10'] > row['ma30'] > row['ma49'] > row['ma60'] > row['ma120'] > row['ma250'])
    isPrice_Rule2 = (row['ma5'] > row['ma10'] * 1.05 and row['ma10'] > row['ma20'] * 1.05)
    isPrice_Rule3 = (row['macd_bar'] > -0.3)

    return isPrice_Rule1 and isPrice_Rule2 and isPrice_Rule3