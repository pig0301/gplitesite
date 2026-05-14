from django_rq import job
from django.utils import timezone
from django.db import transaction
from iFinDPy import THS_RealtimeQuotes, THS_iwencai, THS_Date_Query, THS_iFinDLogin, THS_iFinDLogout, THS_DS

from stock.models import ths_stocks, ths_daily_quotes
from libs import wechat, constants

import django_rq, os, json
import pandas as pd


THS_BATCH_SIZE = 50
DB_BATCH_SIZE = 500


@job('ths_worker', timeout=constants.JOB_TIMEOUT, result_ttl=constants.RESULT_TTL)
def download_daily_quotes():
    if not is_trade_day():
        return "非交易日"
    
    ths_login()
    stock_df = get_stocks_list()
    
    ret_stock = update_stock_info(stock_df)
    ret_quote = update_daily_quote(stock_df)
    THS_iFinDLogout()
    
    stock_summary = f"共更新 {ret_stock[0]} 条记录，成功新增 {ret_stock[1]} 条记录"
    quote_summary = f"共删除 {ret_quote[0]} 条记录，成功新增 {ret_quote[1]} 条记录"
    final_summary = f"①股票信息：{stock_summary}；\r\n②行情信息：{quote_summary}。"
    
    wechat.send_text_message(1, final_summary)

    return final_summary


def update_daily_quote(df):
    all_codes = df['code'].tolist()
    
    total_deleted = 0
    total_inserted = 0

    batch_data_list = []
    for i in range(0, len(all_codes), THS_BATCH_SIZE):
        batch = all_codes[i : i + THS_BATCH_SIZE]
        code_str = ",".join(batch)

        res = THS_RealtimeQuotes(code_str, 'open,high,low,latest,volume')

        if not isinstance(res, dict) or 'tables' not in res:
            continue

        for stock_data in res['tables']:
            current_code = stock_data.get('thscode', 'Unknown')
            times = stock_data.get('time', [])
            tables = stock_data.get('table', {})
            
            if not tables: continue

            temp_df = pd.DataFrame({
                'code': current_code,
                'time': times,
                'open': tables.get('open', []),
                'high': tables.get('high', []),
                'low': tables.get('low', []),
                'close': tables.get('latest', []),
                'volume': tables.get('volume', [])
            })
            
            batch_data_list.append(temp_df)

    if batch_data_list:
        final_batch_df = pd.concat(batch_data_list)

        final_batch_df['trade_dt'] = pd.to_datetime(final_batch_df['time']).dt.date
        target_dates = final_batch_df['trade_dt'].unique()
        current_batch_codes = final_batch_df['code'].unique().tolist()

        with transaction.atomic():
            total_deleted, _ = ths_daily_quotes.objects.filter(
                trade_dt__in=target_dates,
                stock_code__in=current_batch_codes
            ).delete()

            quote_objs = [
                ths_daily_quotes(
                    stock_code_id=row['code'],
                    trade_dt=row['trade_dt'],
                    open_price=row['open'],
                    high_price=row['high'],
                    low_price=row['low'],
                    close_price=row['close'],
                    total_volume=row['volume']
                ) for _, row in final_batch_df.iterrows()
            ]
            
            created_objs = ths_daily_quotes.objects.bulk_create(quote_objs, batch_size=DB_BATCH_SIZE)
            total_inserted = len(created_objs)

    return [total_deleted, total_inserted]


def update_stock_indicators(df):
    all_codes = df['code'].tolist()
    tx_dt = timezone.now().date().isoformat()
    
    total_deleted = 0
    total_inserted = 0

    indicator_params = [
        {
            'name': 'ths_ma_stock',
            'params': [20, 30, 49, 60, 120, 250],
            'formula': '$,100,100',
            'outcome': 'ma$'
        },
        {
            'name': 'ths_macd_stock',
            'params': [100, 101, 102],
            'param_names': { 100: 'diff', 101: 'dea', 102: 'bar' },
            'formula': '26,12,9,$,100,100',
            'outcome': 'macd_$'
        },
    ]

    batch_indicator_list = []
    for i in range(0, len(all_codes), THS_BATCH_SIZE):
        batch = all_codes[i: i + THS_BATCH_SIZE]
        code_str = ",".join(batch)

        batch_indicator_df = None
        for idt in indicator_params:
            indicator_name = idt['name']

            for p in idt['params']:
                indicator_formula = idt['formula'].replace('$', str(p))
                indicator_outcome = idt['outcome'].replace('$', idt['param_names'][p] if 'param_names' in idt else str(p))

                res_ma = THS_DS(code_str, indicator_name, indicator_formula, '', tx_dt, tx_dt)
                # res_ma = THS_BD(code_str, indicator_name, f'{tx_dt},{indicator_formula}')
                
                if res_ma.errorcode == 0:
                    temp_df = res_ma.data[['thscode', indicator_name]].rename(
                        columns={indicator_name: indicator_outcome}
                    )

                    if batch_indicator_df is None:
                        batch_indicator_df = temp_df
                    else:
                        batch_indicator_df = pd.merge(batch_indicator_df, temp_df, on=['thscode'], how='outer')
        
        if batch_indicator_df is not None and not batch_indicator_df.empty:
            batch_indicator_list.append(batch_indicator_df)
    
    


    return batch_indicator_list


def update_stock_info(df):
    current_time = timezone.now()
    all_codes = df['code'].tolist()

    existing_stocks = ths_stocks.objects.filter(stock_code__in=all_codes)
    existing_map = {s.stock_code: s for s in existing_stocks}
    
    to_update = []
    to_create = []

    for _, row in df.iterrows():
        code = row['code']
        name = row['name']
        
        if code in existing_map:
            obj = existing_map[code]
            obj.stock_name = name
            obj.update_dttm = current_time
            to_update.append(obj)
        else:
            to_create.append(ths_stocks(
                stock_code=code,
                stock_name=name,
                update_dttm=current_time
            ))

    with transaction.atomic():
        if to_update:
            ths_stocks.objects.bulk_update(to_update, ['stock_name', 'update_dttm'], batch_size=DB_BATCH_SIZE)
        if to_create:
            ths_stocks.objects.bulk_create(to_create, batch_size=DB_BATCH_SIZE)
            
    return [len(to_update), len(to_create)]


def get_stocks_list():
    data = THS_iwencai('全A股,股票简称', 'stock')

    if isinstance(data, dict) and 'tables' in data:
        table = data['tables'][0].get('table', {})
        codes = table.get('thscode') or table.get('股票代码')
        names = table.get('股票简称') or table.get('name')

        if codes and names:
            df = pd.DataFrame({ 'code': codes, 'name': names })
            df = df[df['code'].str.contains(r'\.(SZ|SH|BJ)$', na=False, regex=True)]
            
            return df

    raise Exception(f"iFind 未查询到任何A股信息！")


def is_trade_day():
    today = timezone.now().date().isoformat()
    
    redis_conn = django_rq.get_connection('ths_worker')
    flag = redis_conn.get('GLOBAL_TRADE_DAY_FLAG')
    
    if flag:
        info = json.loads(flag.decode('utf-8'))
        if info.get('date') == today:
            return info.get('is_trade_day')

    ths_login()
    res = THS_Date_Query('SSE', 'mode:1,dateType:0,period:D,dateFormat:0', today, today)
    THS_iFinDLogout()
    
    if res.errorcode == 0:
        is_trade_day = (today in res.data)
        flag = { 'date': today, 'is_trade_day': is_trade_day }
        
        redis_conn.set('GLOBAL_TRADE_DAY_FLAG', json.dumps(flag), ex=54000)
        return is_trade_day
    else:
        raise Exception(f"iFind 交易日查询失败，错误信息: {res.errormsg}")


def ths_login():
    account = os.environ.get('THS_ACCOUNT')
    password = os.environ.get('THS_PASSWORD')
    
    if not account or not password:
        raise Exception("环境变量 THS_ACCOUNT 或 THS_PASSWORD 未配置")

    res = THS_iFinDLogin(account, password)
    
    if res not in [0, -201]:
        raise Exception(f"iFind 登录失败，错误代码: {res}")