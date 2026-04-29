from django_rq import job
from django.utils import timezone


@job('ths_worker', timeout=600, result_ttl=86400)
def init_daily_trade_flag():
    today = timezone.now().date().isoformat()
    
    return today