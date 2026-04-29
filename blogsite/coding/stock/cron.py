from coding.stock.tasks import download_daily_quotes


def test1():
    download_daily_quotes.delay()