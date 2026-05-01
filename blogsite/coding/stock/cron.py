from django.utils import timezone

from coding.stock.tasks import download_daily_quotes
from coding.stock.models import stock_pick_strategy

import importlib


def update_daily_quotes():
    download_daily_quotes.delay()


def run_pick_strategy():
    today = timezone.now().date().isoformat()
    strategy_list = stock_pick_strategy.objects.all()
    
    for strategy in strategy_list:
        module = importlib.import_module(strategy.python_module)
        task_func = getattr(module, strategy.exec_function)

        task_func.delay(strategy.id, today)


def test():
    from coding.stock.strategy import ruleA
    
    ruleA.get_good_stocks.delay(1, '2026-04-30', ignore_trade_day=True)