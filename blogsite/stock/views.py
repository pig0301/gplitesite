from libs.functions import render_template
from django.http import JsonResponse
from django.db.models import Count

from collections import defaultdict
from stock import models


def index(request):
    return render_template("stock/index.html", {}, request)


def pick_strategy_data(request):
    strategies = models.pick_strategy.objects.all().order_by('id')

    data = [
        {
            "id": item.id,
            "name": item.strategy_name
        } 
        for item in strategies
    ]

    return JsonResponse(data, safe=False)


def stock_quotes_data(request, code):
    ths_quotes = models.ths_daily_quotes.objects.filter(stock_code=code, total_volume__gt=0).order_by('trade_dt')

    chart_data = []
    for quote_obj in ths_quotes:
        chart_data.append({
            "time": quote_obj.trade_dt.strftime('%Y-%m-%d'),
            "open": float(quote_obj.open_price),
            "high": float(quote_obj.high_price),
            "low": float(quote_obj.low_price),
            "close": float(quote_obj.close_price),
        })

    return JsonResponse(chart_data, safe=False)


def strategy_dates_data(request, strategy_id):
    results = models.pick_strategy_result.objects.filter(
        strategy_id=strategy_id
    ).values('pick_date').annotate(
        stock_count=Count('stock_code')
    ).order_by('-pick_date')

    data = [
        {
            "date": item['pick_date'].strftime('%Y-%m-%d'),
            "count": item['stock_count']
        } 
        for item in results
    ]

    return JsonResponse(data, safe=False)


def strategy_result_data(request, strategy_id, pick_date):
    pick_results = models.pick_strategy_result.objects.filter(
        strategy_id=strategy_id, 
        pick_date=pick_date
    ).order_by('stock_code').select_related('stock_code')
    
    stock_codes = [item.stock_code.stock_code for item in pick_results]
    recent_dates = list(models.ths_daily_quotes.objects.filter(
        trade_dt__gte=pick_date, total_volume__gt=0
    ).values_list('trade_dt', flat=True).distinct().order_by('trade_dt')[:11])
    
    recent_quotes = models.ths_daily_quotes.objects.filter(
        stock_code__in=stock_codes, trade_dt__in=recent_dates, total_volume__gt=0
    ).values('stock_code', 'trade_dt', 'close_price')
    
    quote_map= defaultdict(dict)
    for q in recent_quotes:
        quote_map[q['stock_code']][q['trade_dt']] = float(q['close_price'])
    
    stocks_data = []
    for item in pick_results:
        code = item.stock_code.stock_code
        price_list = [quote_map.get(code, {}).get(d) for d in recent_dates]
        
        stocks_data.append({
            'code': code,
            'name': item.stock_code.stock_name,
            'price_list': price_list
        })
    
    return JsonResponse({
        'recent_dates': recent_dates,
        'stocks_data': stocks_data
    })