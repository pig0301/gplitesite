from coding.stock.tasks import download_daily_quotes


def update_daily_quotes():
    download_daily_quotes.delay()