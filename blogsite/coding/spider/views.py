from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait

from django.http import HttpResponse
from bs4 import BeautifulSoup

import re, json, datetime

from libs.functions import render_template, check_login, get_client_ip
from libs import wechat, dingding, constants

from home import models


def query_storage(request):
    if check_login(request):
        (prod_details, storage_warn) = get_product_details(['9003867817'])
        msg_level = models.message_level.objects.get(id=1)
        
        wechat_level = models.wechat_message.objects.all()
        dingding_level = models.dingding_message.objects.all()

        if msg_level and len(storage_warn) > 0 and get_client_ip(request) == '127.0.0.1':
            storage_warn = "【重要】请关注以下贵金属产品线上库存！\n" + storage_warn + "\n\n[时间]：" + str(datetime.datetime.now())[0:19]
            
            if msg_level.wechat_msg:
                wechat.send_text_message(msg_level.wechat_msg.id, storage_warn)
            
            if msg_level.dingding_msg:
                dingding.send_text_message(msg_level.dingding_msg.id, storage_warn)
        
        return render_template("coding/spider/storage.html", {
                'products': prod_details, 'msg_level': msg_level, 'wechat_level': wechat_level, 'dingding_level': dingding_level
        }, request)
    else:
        return HttpResponse("非管理员用户禁止访问！")


def get_product_details(prod_links):
    (options, profile) = init_firefox_option()
    browser = webdriver.Firefox(executable_path="/data/firefox/geckodriver", options=options, firefox_profile=profile)
    
    storage_re = re.compile(r'\s(\d+)\s')
    prod_details = []
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
                    except Exception:
                        errTimes += 1
                
                if storage == None:
                    product['visibleStorage'] = '-1'
                else:
                    product['visibleStorage'] = storage
            except Exception:
                product['visibleStorage'] = '0'
            
            if int(product['visibleStorage']) < constants.STORAGE_WARNING[product['merchantProdId']]:
                storage_warn += "\n" + product['name'] + "仅剩" + product['visibleStorage'] + "件。"
                product['is_warning'] = 1
        
        prod_details = prod_details + prods_info
    
    browser.close()
    browser.quit()
    
    return (prod_details, storage_warn)

def init_firefox_option():
    options = webdriver.FirefoxOptions()
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    
    profile = webdriver.FirefoxProfile()
    profile.set_preference('browser.cache.disk.enable', False);
    profile.set_preference('browser.cache.memory.enable', False);
    profile.set_preference('browser.cache.offline.enable', False);
    profile.set_preference('network.http.use-cache', False);
    profile.set_preference('permissions.default.image', 2)
    profile.set_preference('permissions.default.stylesheet', 2)
    profile.set_preference('browser.migration.version', 9001)
    profile.set_preference('dom.ipc.plugins.enabled.libflashplayer.so', 'false')
    
    return (options, profile)