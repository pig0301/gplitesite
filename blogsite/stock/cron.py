from django.utils import timezone

from stock.tasks import download_daily_quotes
from stock.models import pick_strategy
from stock.strategy.utils import generate_daily_summary

import importlib


def update_daily_quotes():
    download_daily_quotes.delay()


def run_pick_strategy():
    today = timezone.now().date().isoformat()
    strategy_list = pick_strategy.objects.all()

    for strategy in strategy_list:
        module = importlib.import_module(strategy.python_module)
        task_func = getattr(module, strategy.exec_function)

        task_func.delay(strategy.id, today)

    generate_daily_summary.delay(today)


def test():
    from stock.strategy import ruleB
    import pandas as pd
    
    date_series = pd.date_range(start='2026-05-27', end='2026-05-27', freq='D')
    
    for dt in date_series:
        tx_date_str = dt.strftime('%Y-%m-%d')
        
        print(f"正在提交 {tx_date_str} 的策略补数任务...")

        ruleB.get_good_stocks.delay(2, tx_date_str, ignore_trade_day=True)
    
    print("所有任务已进入队列，请观察日志 /data/wwwlogs/gplitesite/rq_ths.log[cite: 1]")


def test1():
    generate_daily_summary.delay("2026-06-04")