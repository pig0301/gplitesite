from coding.stock.tasks import download_daily_quotes
from coding.stock.strategy.ruleA import pick_stocks_with_wr10


def update_daily_quotes():
    download_daily_quotes.delay()


def run_pick_strategy():
    pick_stocks_with_wr10.delay()