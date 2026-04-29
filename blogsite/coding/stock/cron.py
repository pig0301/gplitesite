from coding.stock.tasks import get_stocks_list


def test1():
    get_stocks_list.delay()