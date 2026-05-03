from libs.functions import render_template
from django.http import JsonResponse

from stock.models import ths_daily_quotes


def index(request):
    return render_template("stock/index.html", {}, request)


def stock_quotes_data(request, code):
    ths_quotes = ths_daily_quotes.objects.filter(stock_code=code).order_by('trade_dt')

    chart_data = []
    for quote_obj in ths_quotes:
        chart_data.append({
            "time": quote_obj.trade_dt.strftime('%Y-%m-%d'), # 日期格式必须为字符串或秒数
            "open": float(quote_obj.open_price),               # 必须转为 float
            "high": float(quote_obj.high_price),
            "low": float(quote_obj.low_price),
            "close": float(quote_obj.close_price),
        })

    return JsonResponse(chart_data, safe=False)