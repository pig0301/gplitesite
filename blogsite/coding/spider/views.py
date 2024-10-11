from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from bs4 import BeautifulSoup

from django.http import HttpResponse, HttpResponseRedirect
from django.db.models import OuterRef, Subquery, F
from django.utils import timezone
from django.contrib import messages

import re, json, datetime, time, requests
import hmac, hashlib, base64, codecs

from libs.functions import render_template, check_login, get_client_ip
from libs import wechat, dingding, constants

from home import models
from coding.spider import models as models_code


def query_storage(request):
    if check_login(request):
        is_auto = (get_client_ip(request) == '127.0.0.1')
        
        msg_level = models.message_level.objects.get(id=1)
        (prod_details, storage_warn) = get_product_details(['9003867817'], msg_level, is_auto)
        
        wechat_level = models.wechat_message.objects.all()
        dingding_level = models.dingding_message.objects.all()
        emall_api = models_code.spider_emall_api.objects.all()

        timestamp = timezone.now()
        event_dt = timestamp.date()

        if is_auto:
            models_code.spider_product_storage.objects.filter(event_dt__lt=event_dt).delete()
            
            for prod in prod_details:
                detail = models_code.spider_product_storage(event_dt=event_dt, product_id=prod['merchantProdId'], product_name=prod['name'],
                    price=float(prod['skuPrice'].replace(',', '')), storage_cnt=int(prod['visibleStorage']), create_dttm=timezone.now())
                detail.save()
            
            if msg_level and len(storage_warn) > 0:
                storage_warn = "【重要】请关注以下贵金属产品线上库存！\n" + storage_warn + "\n\n[时间]：" + str(timestamp)[0:19]
                
                if msg_level.wechat_msg:
                    wechat.send_text_message(msg_level.wechat_msg.id, storage_warn)
                 
                if msg_level.dingding_msg:
                    dingding.send_text_message(msg_level.dingding_msg.id, storage_warn)
        
        prod_storages = models_code.spider_product_storage.objects.filter(event_dt=event_dt, product_id=OuterRef('product_id')).order_by('id').values_list('id')
        prod_storages = models_code.spider_product_storage.objects.annotate(tag=Subquery(prod_storages[:1]))
        prod_storages = prod_storages.filter(id=F('tag')).order_by('product_id')
        
        init_storages = {}
        storage_dtls = []
        for prod in prod_storages:
            init_storages[prod.product_id] = prod.storage_cnt
            storage_dtls.append(models_code.spider_product_storage.objects.filter(event_dt=event_dt, product_id=prod.product_id).order_by('id'))
        
        for prod in prod_details:
            if prod['merchantProdId'] in init_storages.keys():
                prod['daySalesCount'] = init_storages[prod['merchantProdId']] - int(prod['visibleStorage'])
        
        return render_template("coding/spider/storage.html", {
                'msg_level': msg_level, 'wechat_level': wechat_level, 'dingding_level': dingding_level, 'emall_api': emall_api,
                'products': prod_details, 'legends': prod_storages, 'chart_datas': storage_dtls
        }, request)
    else:
        return HttpResponse("非管理员用户禁止访问！")


def query_reset(request):
    if check_login(request):
        prod_sku = request.POST.get('prod_sku').split(',')
        emall_api = models_code.spider_emall_api.objects.get(id=1)
        
        standard_storage = constants.STORAGE_WARNING[prod_sku[0]]
        product = { 'prodSkuId': prod_sku[1], 'logstorId': prod_sku[2] }
        
        if adjust_storage(emall_api, product, standard_storage[1]):
            messages.info(request, "API调用成功，产品库存已实时调整！")
        else:
            messages.warning(request, "API调用失败，请及时排查问题！")

        return HttpResponseRedirect("/coding/spider/storage/query/")
    else:
        return HttpResponse("非管理员用户禁止访问！")


def get_product_details(prod_links, msg_level, is_auto):
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

            standard_storage = constants.STORAGE_WARNING[product['merchantProdId']]
            if int(product['visibleStorage']) <= standard_storage[0]:
                if not is_auto or msg_level.emall_api == None:
                    storage_warn += "\n{0}仅剩{1}件。".format(product['name'], product['visibleStorage'])
                else:
                    if adjust_storage(msg_level.emall_api, product, standard_storage[1]):
                        storage_warn += "\n{0}仅剩{1}件，已自动增加库存至{2}件。".format(product['name'], product['visibleStorage'], standard_storage[1])
                    else:
                        storage_warn += "\n{0}仅剩{1}件，自动增加库存失败！".format(product['name'], product['visibleStorage'])

                product['is_warning'] = 1
        
        prod_details = prod_details + prods_info
    
    browser.close()
    browser.quit()
    
    return (prod_details, storage_warn)


def adjust_storage(emall_api, product, final_storage):
    url = 'https://ops.mall.icbc.com.cn/icbcrouter?'
    app_secret = emall_api.app_secret
    
    data = {'version': '1.0', 'format': 'xml' }
    
    data['app_key'] = emall_api.app_key
    data['auth_code'] = emall_api.auth_code
    
    dttm = datetime.datetime.fromtimestamp(time.time())
    data['req_sid'] = dttm.strftime('%Y%m%d%H%M%S%f')
    data['timestamp'] = dttm.strftime('%Y-%m-%d %H:%M:%S.%f')
    
    data['method'] = 'icbcb2c.sellablestorage.modify'
    data['req_data'] = '<?xml version="1.0" encoding="UTF-8"?><body><products><product><product_sku_id>{0}</product_sku_id><logstor_id>{1}</logstor_id><storage>{2}</storage></product></products></body>'.format(product['prodSkuId'], product['logstorId'], final_storage)
    
    for param in data.keys():
        url = '{0}{1}={2}&'.format(url, param, data[param])
    
    sign = 'app_key={0}&auth_code={1}&req_data={2}'.format(data['app_key'], data['auth_code'], data['req_data'])
    sign = hmac.new(bytes(app_secret, 'utf-8'), bytes(sign, 'utf-8'), digestmod=hashlib.sha256).digest()
    
    url = '{0}sign={1}'.format(url, base64.b64encode(sign).decode('utf-8')).replace('+', '%2B')
    response = requests.get(url, verify=False)
    
    response_xml = codecs.encode(response.text, 'latin-1').decode('utf-8')
    pattern = re.match('^.*<ret_code>(\d+)</ret_code>.*$', response_xml)
    
    return int(pattern.group(1)) == 0


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