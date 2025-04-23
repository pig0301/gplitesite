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
        dttm = timezone.now()
        
        msg_params = {
            'msg_level': models.message_level.objects.get(id=1),
            'wechat_level': models.wechat_message.objects.all(),
            'dingding_level': models.dingding_message.objects.all(),
            'emall_api': models_code.spider_emall_api.objects.all()
        }

        (prod_details, ccb_details) = get_product_details(['9003867817'], msg_params['msg_level'], dttm, is_auto)

        prod_storages = models_code.spider_product_storage.objects.filter(event_dt=dttm.date(), product_id=OuterRef('product_id')).order_by('id').values_list('id')
        prod_storages = models_code.spider_product_storage.objects.annotate(tag=Subquery(prod_storages[:1]))
        prod_storages = prod_storages.filter(id=F('tag')).order_by('product_id')
        
        init_storages = {}
        storage_dtls = []
        for prod in prod_storages:
            init_storages[prod.product_id] = prod.storage_cnt
            storage_dtls.append(models_code.spider_product_storage.objects.filter(event_dt=dttm.date(), product_id=prod.product_id).order_by('id'))
        
        for prod in prod_details:
            if prod['merchantProdId'] in init_storages.keys():
                prod['daySalesCount'] = init_storages[prod['merchantProdId']] - int(prod['skuStorage'])
        
        store_prod = prod_details[0].copy()
        store_prod['merchantProdId'] = '080020000501'
        store_prod['name'] = '如意金积存'
        store_prod['skuPrice'] -= 3
        prod_details.append(store_prod)
        
        if len(ccb_details) > 0:
            prod_details[3]['ccbPrice'] = ccb_details[0]['skuPrice']
            prod_details[3]['ccbProdUrl'] = ccb_details[0]['prodUrl']
            
            prod_details[4]['ccbPrice'] = ccb_details[1]['skuPrice']
            prod_details[4]['ccbProdUrl'] = ccb_details[1]['prodUrl']
            if len(ccb_details) > 2:
                prod_details[-1]['ccbPrice'] = ccb_details[2]['skuPrice']
                prod_details[-1]['ccbProdUrl'] = ccb_details[2]['prodUrl']

        return render_template("coding/spider/storage.html", {
                'msg_params': msg_params, 'legends': prod_storages,
                'products': prod_details, 'chart_datas': storage_dtls
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


def get_product_details(prod_links, msg_level, dttm, is_auto):
    prod_details = []
    storage_warn = ""

    for link_id in prod_links:
        url = "https://m.mall.icbc.com.cn/products/queryProdSkuAjax.jhtml?productId={0}&isProdDraft=&isBranch=0".format(link_id)
        prods_info = json.loads(json.loads(requests.get(url).content)['prodSkuJson'])
        prods_info = sorted(prods_info, key=lambda x: x['prodSkuId'])

        for product in prods_info:
            product['merchantProdId'] = product['merchantProdId'].rjust(9, '0')
            standard_storage = constants.STORAGE_WARNING[product['merchantProdId']]
            
            product['name'] = standard_storage[2]
            product['prodUrl'] = 'https://m.mall.icbc.com.cn/products/pd_{0}.jhtml'.format(link_id)
            
            product['skuStorage'] = int(product['skuStorage'])
            product['standard_storage'] = standard_storage[1]
            product['skuPrice'] = round(float(product['skuPrice'].replace(',', '')) / standard_storage[3], 2)

            if product['skuStorage'] <= standard_storage[0]:
                if not is_auto or msg_level.emall_api == None:
                    storage_warn += "\n{0}仅剩{1}件。".format(product['name'], product['skuStorage'])
                else:
                    if adjust_storage(msg_level.emall_api, product, standard_storage[1]):
                        storage_warn += "\n{0}仅剩{1}件，已自动增加{2}件库存。".format(product['name'], product['skuStorage'], standard_storage[1] - product['skuStorage'])
                    else:
                        storage_warn += "\n{0}仅剩{1}件，自动增加库存失败！".format(product['name'], product['skuStorage'])
            
                product['is_warning'] = 1
        
        prod_details = prod_details + prods_info
    
    try:
        ccb_details = get_ccb_product_details()
    except  Exception as e:
        print(f"CCB Price Fetch Failed: {e}")
        ccb_details = []
    
    if is_auto:
        for prod in prod_details + ccb_details:
            detail = models_code.spider_product_storage(event_dt=dttm.date(), product_id=prod['merchantProdId'], product_name=prod['name'],
                price=prod['skuPrice'], storage_cnt=int(prod['skuStorage']), create_dttm=dttm)
            detail.save()
        
        if msg_level and len(storage_warn) > 0:
            storage_warn = "【重要】请关注以下贵金属产品线上库存！\n" + storage_warn + "\n\n[时间]：" + str(dttm)[0:19]
            
            if msg_level.wechat_msg:
                wechat.send_text_message(msg_level.wechat_msg.id, storage_warn)
             
            if msg_level.dingding_msg:
                dingding.send_text_message(msg_level.dingding_msg.id, storage_warn)

    return (prod_details, ccb_details)


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


def get_ccb_product_details():
    ccb_brand_prods = ['261100101', '261100102']
    ccb_store_prod = '291000001'
    
    ccb_details = []
    
    for brand_prod in ccb_brand_prods:
        url_sign = "https://gold.ccb.com/tran/WCCMainPlatV5?CCB_IBSVersion=V5&SERVLET_NAME=WCCMainPlatV5&TXCODE=100119"
        url_brand = "https://gold.ccb.com/tran/WCCMainPlatV5?CCB_IBSVersion=V5&TXCODE=NGJS09&PM_PD_ID={0}&Hdl_InsID=110000000&Org_Inst_Rgon_Cd=SH&Txn_Itt_Chnl_TpCd=0006&AlSal_Ind=1"
        url_shop = 'https://gold.ccb.com/chn/home/gold_new/cpjs/swgjs/flsx/cpxq/index.shtml?PM_PD_ID={0}&Hdl_InsID=110000000&Org_Inst_Rgon_Cd=SH'
        
        headers = { "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36" }
        
        response = requests.get(url_sign, headers=headers)
        cookies = response.cookies
        
        response = requests.get(url_brand.format(brand_prod), headers=headers, cookies=cookies)
        prod_json = json.loads(response.content)['GRP'][0]
        
        ccb_details.append({ 'merchantProdId': prod_json['PM_PD_ID'], 'name': '建行' + prod_json['ASPD_Nm'], 'skuPrice': round(float(prod_json['Br_Sell_Prc']), 2), 'skuStorage': 0, 'prodUrl': url_shop.format(brand_prod) })
    
    url_store = 'https://tool.ccb.com/webtran/static/trendchart/getAccountData.gsp?dateType=timeSharing&sec_code={0}_BUY'
    url_price = 'https://tool.ccb.com/webtran/static/trendchart/ccbgold.html?priceType=BUY'
    
    response = requests.get(url_store.format(ccb_store_prod))
    prod_json = json.loads(response.content)
    
    if prod_json['new_pri'] is not None:
        ccb_details.append({ 'merchantProdId': ccb_store_prod, 'name': '建行易存金', 'skuPrice': round(float(prod_json['new_pri']), 2), 'skuStorage': 0, 'prodUrl': url_price })
    
    return ccb_details