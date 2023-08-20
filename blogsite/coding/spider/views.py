from django.http import HttpResponse
from bs4 import BeautifulSoup

import requests, re, json, datetime

from libs.functions import render_template, check_login, get_client_ip
from libs import wechat, dingding


def query_storage(request):
    if check_login(request):
        link_id = "9003867817"
        spec_map = {
            '050100001': 5, '050100002': 10, '050100003': 20,
            '000010050': 50, '000010100': 100, '000010200': 200
        }
        
        url = 'https://mall.icbc.com.cn/products/pd_' + link_id + '.jhtml'
        response = requests.get(url)
        html = response.content
        
        soup = BeautifulSoup(html, 'html.parser')
        pattern = re.compile(r'var prodSkuJson = (.*?);')
        
        script = soup.find(id='prodSkuDiv').find('script')
        products = json.loads(pattern.search(script.prettify()).group(1))
        products = sorted(products, key=lambda x: spec_map[x['merchantProdId'].rjust(9, '0')])
        
        storage_warn = ""
        
        for product in products:
            product['merchantProdId'] = product['merchantProdId'].rjust(9, '0')
            product['spec'] = spec_map[product['merchantProdId']]
            
            product['name'] = "“如意金条”" + str(product['spec']) + "g"
            product['prodUrl'] = url
            storage = product['totalStorage']
            
            if int(storage) <= 20:
                storage_warn += "\n" + product['name'] + "仅剩" + storage + "件。"
                product['is_warning'] = 1
        
        if len(storage_warn) > 0 and get_client_ip(request) == '127.0.0.1':
            storage_warn = "【重要】请关注以下规格如意金条线上库存！\n" + storage_warn + "\n\n[时间]：" + str(datetime.datetime.now())[0:19]
            
            wechat.send_text_message(2, storage_warn)
            dingding.send_text_message(1, storage_warn)
        
        return render_template("coding/spider/storage.html", { 'products': products }, request)
    else:
        return HttpResponse("非管理员用户禁止访问！")