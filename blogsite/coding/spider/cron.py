import requests, re, json, datetime
from bs4 import BeautifulSoup


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
    
    for product in products:
        sku_name = sku_map[product['enumId']]
        print(sku_name + ": " + product['allStorage'])
        
    print("-" * 30 + "\n")