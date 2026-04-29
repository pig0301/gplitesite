import pandas as pd
import talib

from django_rq import job
from django.db.models import F
from coding.stock.models import stock_ths_daily_quotes


@job('ths_worker', timeout=600, result_ttl=86400)
def pick_stocks_with_wr10():
    queryset = stock_ths_daily_quotes.objects.select_related('stock_code').annotate(
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

    def calc_wr10(group):
        group['wr10'] = talib.WILLR(
            group['high'].values, 
            group['low'].values, 
            group['close'].values, 
            timeperiod=10
        )
        return group

    df = df.groupby('code').apply(calc_wr10)
    df['wr10'] = df['wr10'].abs().round(2)

    columns = ['open', 'high', 'low', 'close']
    shifts = [1, 2]
    for s in shifts:
        for c in columns:
            df[f'{c}_l{s}'] = df.groupby('code')[c].shift(s)

    return df.groupby('code').tail(1)