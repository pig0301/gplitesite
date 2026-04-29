from coding.stock.tasks import download_daily_quotes
from coding.stock.strategy import ruleA

from libs import wechat


def update_daily_quotes():
    wechat.send_text_message(1, download_daily_quotes.delay())


def run_pick_strategy():
    wechat.send_text_message(1, ruleA.get_good_stocks.delay())