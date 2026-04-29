from django_rq import job
from django.utils import timezone
from iFinDPy import *

import django_rq, os


@job('ths_worker', timeout=600, result_ttl=86400)
def init_daily_trade_flag():
    
    return ths_login()


def ths_login():
    account = os.environ.get('THS_ACCOUNT')
    password = os.environ.get('THS_PASSWORD')

    res = THS_iFinDLogin(account, password)
    
    return res in [0, -202]