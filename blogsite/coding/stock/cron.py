from coding.stock.tasks import download_daily_quotes
from coding.stock.models import stock_pick_strategy

import importlib


def update_daily_quotes():
    download_daily_quotes.delay()


def run_pick_strategy():
    strategy_list = stock_pick_strategy.objects.all()
    
    for strategy in strategy_list:
        module = importlib.import_module(strategy.python_module)
        task_func = getattr(module, strategy.exec_function)

        task_func.delay()