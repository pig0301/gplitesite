from django.http import HttpResponse
from bs4 import BeautifulSoup

import requests, re, json

from libs.functions import render_template, check_login
from libs import wechat


def query_storage(request):

    link_id = "9003867817"
    sku_map = {
        '0000029061': '5g', '0000029062': '10g', '0000029063': '20g',
        '0000034663': '50g', '0000034664': '100g', '0000034665': '200g'
    }
    
    url = 'https://mall.icbc.com.cn/products/pd_' + link_id + '.jhtml'
    response = requests.get(url)
    html = response.content
    
    soup = BeautifulSoup(html, 'html.parser')
    pattern = re.compile(r'var initSkuPropEnumJson = (.*?);')
    
    script = soup.find(id='prodSkuDiv').find('script')
    products = json.loads(pattern.search(script.prettify()).group(1))
    
    storage_warn = ""
    
    for product in products:
        sku_name = sku_map[product['enumId']]
        storage = product['allStorage']
        
        if int(storage) < 600:
            storage_warn += "\n“如意金条" + sku_name + "”仅剩" + storage + "件。"
    
    if len(storage_warn) > 0 and 1 == 0:
        wechat.send_text_message(2, "【重要】请关注如下规格如意金条线上库存！\n" + storage_warn)
        
    if 'HTTP_X_FORWARDED_FOR' in request.META:
        ip = request.META['HTTP_X_FORWARDED_FOR']
    else:
        ip = request.META['REMOTE_ADDR']
    
    return HttpResponse(ip + '<br>' + request.META['HTTP_USER_AGENT'])
