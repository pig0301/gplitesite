from django_rq import job
from django.utils import timezone
from iFinDPy import *

import django_rq, os


@job('ths_worker', timeout=600, result_ttl=86400)
def init_daily_trade_flag():
    ths_login()
    today = timezone.now().date().isoformat()
    
    # 查询交易日
    res = THS_DateQueries('SSE', today, today, 'isTradeDay')
    
    if res.errorcode == 0:
        is_trade_day = str(res.data.iloc[0, 0])

        redis_conn = django_rq.get_connection('ths_worker')
        redis_conn.set('GLOBAL_TRADE_DAY_FLAG', is_trade_day, ex=54000)
        return f"Done: {is_trade_day}"
    else:
        raise Exception(f"iFind Query Error: {res.errormsg}")


def ths_login():
    account = os.environ.get('THS_ACCOUNT')
    password = os.environ.get('THS_PASSWORD')
    
    if not account or not password:
        raise Exception("环境变量 THS_ACCOUNT 或 THS_PASSWORD 未配置")

    res = THS_iFinDLogin(account, password)
    
    if res not in [0, -202]:
        raise Exception(f"iFind 登录失败，错误码: {res}")