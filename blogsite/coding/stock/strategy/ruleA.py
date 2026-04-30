import pandas as pd
import talib

from django_rq import job
from django.db.models import F
from coding.stock.models import stock_ths_daily_quotes
from libs import wechat


@job('ths_worker', timeout=600, result_ttl=54000)
def get_good_stocks():
    df = pick_stocks_with_wr10()
    selected = []

    for _, row in df.iterrows():
        normal_good = is_good_stock(row)
        abnormal_good = is_good_stock(row, is_abnormal=True)

        if not normal_good and not abnormal_good:
            continue
        elif normal_good:
            if row['close'] > row['close_l1']:
                row['type'] = '强势'
        elif abnormal_good:
            row['type'] = '变异'

        selected.append(row)

    df_ret = pd.DataFrame(selected)
    df_ret['type'] = df_ret['type'].fillna('普通')
    
    ret_summary = "今日无【双叉十字斩】信号。"

    if not df_ret.empty:
        formatted_lines = df_ret.apply(
            lambda x: f"{x['code']} {x['name']}【{x['type']}】", axis=1
        ).tolist()
        
        header = f"{df['time'].iloc[0]} | 双叉| 共 {len(df_ret)}只："
        formatted_lines.insert(0, header)
        formatted_lines.insert(1, "-" * 20)
        
        ret_summary = "\r\n".join(formatted_lines)
 
    wechat.send_text_message(1, ret_summary)
    
    return ret_summary


def pick_stocks_with_wr10():
    recent_dates = stock_ths_daily_quotes.objects.values_list('trade_dt', flat=True).distinct().order_by('-trade_dt')[:15]
    min_date = list(recent_dates)[-1]
    
    queryset = stock_ths_daily_quotes.objects.filter(
        trade_dt__gte=min_date
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