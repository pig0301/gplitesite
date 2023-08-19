import requests, re, json, datetime, sys
from bs4 import BeautifulSoup

from libs.wechat import send_text_message
sys.path.append("../..")
from home import models


def query_goldbar_storage():
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
    
    print("Time：", datetime.datetime.now())
    print("-" * 30)
    
    storage_warn = ""
    
    for product in products:
        sku_name = sku_map[product['enumId']]
        storage = product['allStorage']
        
        print(sku_name + ": " + product['allStorage'])
        
        if int(storage) < 600:
            storage_warn += "\n“如意金条" + sku_name + "”库存仅剩" + storage + "件。"

    print("-" * 30 + "\n")
    
    if len(storage_warn) > 0:
        print(models.wechat_message.objects.count())