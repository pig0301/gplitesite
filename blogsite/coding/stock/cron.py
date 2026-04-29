from coding.stock.tasks import init_daily_trade_flag


def test1():
    init_daily_trade_flag.delay()