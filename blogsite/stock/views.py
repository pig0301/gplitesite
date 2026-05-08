from libs.functions import render_template
from django.http import JsonResponse
from django.db.models import Count

from collections import defaultdict
from stock import models

import talib
import pandas as pd
import numpy as np


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
    
    data_list = list(ths_quotes.values('trade_dt', 'open_price', 'high_price', 'low_price', 'close_price', 'total_volume'))
    df = pd.DataFrame(data_list)
    
    close_prices = df['close_price'].astype(float).values 
    time_series = df['trade_dt'].apply(lambda x: x.strftime('%Y-%m-%d')).values

    ma5 = talib.SMA(close_prices, timeperiod=5)
    ma10 = talib.SMA(close_prices, timeperiod=10)

    candles = []
    volumes = []
    for i in range(len(df)):
        candles.append({
            "time": time_series[i],
            "open": float(df.iloc[i]['open_price']),
            "high": float(df.iloc[i]['high_price']),
            "low": float(df.iloc[i]['low_price']),
            "close": float(df.iloc[i]['close_price']),
        })
        
        volumes.append({
            "time": time_series[i],
            "value": float(df.iloc[i]['total_volume']) / 10000,
        })

    ma5_data = [
        {"time": time_series[i], "value": float(ma5[i])} 
        for i in range(len(ma5)) if not np.isnan(ma5[i])
    ]
    
    ma10_data = [
        {"time": time_series[i], "value": float(ma10[i])} 
        for i in range(len(ma10)) if not np.isnan(ma10[i])
    ]

    return JsonResponse({
        "candles": candles, "volumes": volumes,
        "ma5": ma5_data, "ma10": ma10_data
    })


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