import pandas as pd
import talib, json

from django_rq import job
from django.db import transaction
from django.db.models import F
from libs import wechat, constants

from stock.models import ths_stocks, ths_daily_quotes, pick_strategy, pick_strategy_result
from stock.tasks import is_trade_day


@job('ths_worker', timeout=constants.JOB_TIMEOUT, result_ttl=constants.RESULT_TTL)
def get_good_stocks(strategy_id, tx_date, ignore_trade_day=False):
    if not ignore_trade_day and not is_trade_day():
        return "非交易日"
    
    strategy_obj = pick_strategy.objects.get(id=strategy_id)
    
    df = pick_stocks_with_wr10(tx_date)
    max_date = pd.to_datetime(df['time'].max()).strftime('%Y-%m-%d')
    
    if max_date != tx_date:
        raise Exception(f"策略运行失败：无当日行情数据（最近行情数据为：{max_date}）")
    
    selected = []
    for _, row in df.iterrows():
        normal_good = is_good_stock(row)
        abnormal_good = is_good_stock(row, is_abnormal=True)

        if not normal_good and not abnormal_good:
            continue
        elif normal_good:
            if row['close'] > row['close_l1']:
                row['type'] = '强势'
            else:
                row['type'] = '普通'
        elif abnormal_good:
            row['type'] = '变异'

        selected.append(row)

    df_ret = pd.DataFrame(selected)    
    ret_summary = f"{tx_date} | {strategy_obj.strategy_name} | 今日无信号。"

    if not df_ret.empty:
        header = f"{tx_date} | {strategy_obj.strategy_name} | 共{len(df_ret)}只："
        formatted_lines = [header, "-" * 20]
        
        results_to_create = []
        for _, row in df_ret.iterrows():
            stock_instance = ths_stocks.objects.get(stock_code=row['code'])
            addition_info = { 'type': row['type'], 'wr10': float(row['wr10']) }
            
            results_to_create.append(pick_strategy_result(
                strategy=strategy_obj, pick_date=tx_date, stock_code=stock_instance, addition_info=json.dumps(addition_info, ensure_ascii=False)
            ))

            formatted_lines.append(f"{row['code']} {row['name']}【{row['type']}】")
        
        ret_summary = "\r\n".join(formatted_lines)
        with transaction.atomic():
            pick_strategy_result.objects.filter(strategy=strategy_obj, pick_date=tx_date).delete()
            pick_strategy_result.objects.bulk_create(results_to_create)
 
    wechat.send_text_message(1, ret_summary)
    
    return ret_summary


def pick_stocks_with_wr10(tx_date):
    recent_dates = ths_daily_quotes.objects.filter(trade_dt__lte=tx_date).values_list('trade_dt', flat=True).distinct().order_by('-trade_dt')[:15]
    min_date = list(recent_dates)[-1]
    
    queryset = ths_daily_quotes.objects.filter(
        trade_dt__range=(min_date, tx_date)
    ).select_related('stock_code').annotate(
        name=F('stock_code__stock_name')
    ).values(
        'trade_dt', 'stock_code', 'name', 'open_price', 'high_price', 'low_price', 'close_price'
    ).order_by('stock_code', 'trade_dt')

    df = pd.DataFrame(list(queryset))
    df.rename(columns={
        'trade_dt': 'time',
        'stock_code': 'code',
        'open_price': 'open',
        'high_price': 'high',
        'low_price': 'low',
        'close_price': 'close'
    }, inplace=True)

    for col in ['open', 'high', 'low', 'close']:
        df[col] = df[col].astype(float)

    df['wr10'] = 0.0
    for _, group in df.groupby('code'):
        idx = group.index
        df.loc[idx, 'wr10'] = talib.WILLR(
            group['high'].values, 
            group['low'].values, 
            group['close'].values, 
            timeperiod=10
        )
    
    df['wr10'] = df['wr10'].abs().round(2)
    
    column_order = ['time', 'code', 'name', 'wr10', 'open', 'high', 'low', 'close']
    df = df[column_order]

    columns = ['open', 'high', 'low', 'close']
    shifts = [1, 2]
    for s in shifts:
        for c in columns:
            df[f'{c}_l{s}'] = df.groupby('code')[c].shift(s)

    return df.groupby('code').tail(1)


def is_good_stock(row, is_abnormal=False):
    open_l0 = row['open']
    high_l0 = row['high']
    low_l0 = row['low']
    close_l0 = row['close']

    open_l1 = row['open_l1']
    high_l1 = row['high_l1']
    low_l1 = row['low_l1']
    close_l1 = row['close_l1']
    
    wr10 = row['wr10']

    if is_abnormal:
        open_l1 = row['open_l2']
        high_l1 = max(row['high_l1'], row['high_l2'])
        low_l1 = min(row['low_l1'], row['low_l2'])

    isFirstX = (high_l0 > low_l0 and abs(open_l0 - close_l0) / (high_l0 - low_l0) <= 0.25)
    isLastX = (high_l1 > low_l1 and abs(open_l1 - close_l1) / (high_l1 - low_l1) <= 0.25)

    isPrice_Rule1 = (high_l0 < high_l1 and low_l0 < low_l1)
    isPrice_Rule2 = (low_l0 < open_l1 < high_l0 and low_l0 < close_l1 < high_l0)
    isPrice_Rule3 = (low_l1 < open_l0 < high_l1 and low_l1 < close_l0 < high_l1)

    isPriceOK = (isPrice_Rule1 and isPrice_Rule2 and isPrice_Rule3)
    
    isWr10 = (wr10 <= 20)

    return isFirstX and isLastX and isPriceOK and isWr10