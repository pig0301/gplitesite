from django_rq import job
from django.utils import timezone
from iFinDPy import *

import django_rq, os, json
import pandas as pd
from pandas.tests.generic.test_label_or_level_utils import df


@job('ths_worker', timeout=600, result_ttl=86400)
def get_stocks_list():
    if not is_trade_day():
        return "非交易日"
    
    ths_login()
    data = THS_iwencai('全A股,股票简称', 'stock')

    if isinstance(data, dict) and 'tables' in data:
        table = data['tables'][0].get('table', {})
        codes = table.get('thscode') or table.get('股票代码')
        names = table.get('股票简称') or table.get('name')

        if not codes or not names:
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
    
    if res not in [0, -202]:
        raise Exception(f"iFind 登录失败，错误代码: {res}")