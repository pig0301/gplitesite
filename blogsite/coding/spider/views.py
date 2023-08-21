from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait

from django.http import HttpResponse
from bs4 import BeautifulSoup

import re, json, datetime

from libs.functions import render_template, check_login, get_client_ip
from libs import wechat, dingding


def query_storage(request):
    if check_login(request):
        options = webdriver.FirefoxOptions()
        options.add_argument('--headless')
        options.add_argument('--disable-gpu')
        
        browser = webdriver.Firefox(executable_path="/data/firefox/geckodriver", options=options)
        
        prod_links = ['9003867817', '9002749021']
        
        storage_re = re.compile(r'\s(\d+)\s')
        storage_warn = ""
        
        for link_id in prod_links:
            url = 'https://mall.icbc.com.cn/products/pd_' + link_id + '.jhtml'
            browser.get(url)
            
            WebDriverWait(browser, 5).until(lambda x: x.find_element_by_id('skuSelected').is_displayed())
            soup = BeautifulSoup(browser.page_source, 'html.parser')
            
            re_results = [None, None, None, None]
            re_exps = [
                re.compile(r'var proName = (.*?);'),
                re.compile(r'var skuToPropJson = (.*?);'),
                re.compile(r'var prodSkuJson = (.*?);'),
                re.compile(r'var prodEnumMap = (.*?);')
            ]
                
            for script in soup.find_all('script'):
                for i in range(len(re_results)):
                    match_exp = re_exps[i].search(script.prettify())
                    if match_exp:
                        re_results[i] = json.loads(match_exp.group(1))
             
            (prod_name, prods_sku, prods_info, prods_spec) = re_results
             
            prods_info = sorted(prods_info, key=lambda x: x['prodSkuId'])
            
            for product in prods_info:
                product['merchantProdId'] = product['merchantProdId'].rjust(9, '0')
                product['sku_info'] = prods_sku[product['prodSkuId']][0]
                product['name'] = prod_name + prods_spec[product['sku_info']['prodEnumId']]
                product['prodUrl'] = url
                
                try:
                    specBox = browser.find_element_by_id(product['sku_info']['prodPropId'] + product['sku_info']['prodEnumId'])
                    
                    storage = None
                    errTimes = 0
                    while storage == None and errTimes < 10:
                        browser.execute_script("arguments[0].click();", specBox)
                        WebDriverWait(browser, 5).until(lambda x: x.find_element_by_id("productStorage").is_displayed())
                        
                        try:
                            storage_str = browser.find_element_by_id("productStorage").text
                            storage = storage_re.search(storage_str).group(1)
                        except Exception as e:
                            errTimes += 1
                            print(e)
                    
                    if storage == None:
                        product['visibleStorage'] = '-1'
                    else:
                        product['visibleStorage'] = storage
                except Exception as ee:
                    product['visibleStorage'] = '0'
                    print(ee)
                
                if int(product['visibleStorage']) <= 20:
                    storage_warn += "\n" + product['name'] + "仅剩" + product['visibleStorage'] + "件。"
                    product['is_warning'] = 1

        if len(storage_warn) > 0 and get_client_ip(request) == '127.0.0.1':
            storage_warn = "【重要】请关注以下贵金属产品线上库存！\n" + storage_warn + "\n\n[时间]：" + str(datetime.datetime.now())[0:19]
            
            wechat.send_text_message(2, storage_warn)
            dingding.send_text_message(1, storage_warn)
        
        return render_template("coding/spider/storage.html", { 'products': prods_info }, request)
    else:
        return HttpResponse("非管理员用户禁止访问！")