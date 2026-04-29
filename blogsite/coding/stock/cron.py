from coding.stock.tasks import download_daily_quotes
from coding.stock.strategy import ruleA


def update_daily_quotes():
    download_daily_quotes.delay()


def run_pick_strategy():
    ruleA.get_good_stocks.delay()