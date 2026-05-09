from django.http import HttpResponse, HttpResponseRedirect
from django.db.models import OuterRef, Subquery, F
from django.utils import timezone
from django.contrib import messages
from django.shortcuts import render

import re, json, datetime, time, requests
import hmac, hashlib, base64, codecs

from home import models
from coding.spider import models as models_code


def query_storage(request):
    dttm = timezone.now()
    
    msg_params = {
        'emall_api': models_code.spider_emall_api.objects.all(),
        'msg_level': models.message_level.objects.get(id=1),
        'wechat_level': models.wechat_message.objects.all(),
        'dingding_level': models.dingding_message.objects.all()
    }
    
    icbc_prods = get_icbc_product_details('9003867817')
    (ccb_store, ccb_brands) = get_ccb_product_details()

    prod_storages = models_code.spider_product_storage.objects.filter(event_dt=dttm.date(), product_id=OuterRef('product_id')).order_by('id').values_list('id')
    prod_storages = models_code.spider_product_storage.objects.annotate(tag=Subquery(prod_storages[:1]))
    prod_storages = prod_storages.filter(id=F('tag')).order_by('product_id')
    
    init_storages = {}
    storage_dtls = []
    for prod in prod_storages:
        init_storages[prod.product_id] = prod.storage_cnt
        storage_dtls.append(models_code.spider_product_storage.objects.filter(event_dt=dttm.date(), product_id=prod.product_id).order_by('id'))
    
    for prod in icbc_prods:
        if prod['merchantProdId'] in init_storages.keys():
            prod['daySalesCount'] = init_storages[prod['merchantProdId']] - int(prod['skuStorage'])

    for i in range(0, len(ccb_brands)):
        icbc_prods[i + 3]['ccbPrice'] = ccb_brands[i]['skuPrice']
        icbc_prods[i + 3]['ccbProdUrl'] = ccb_brands[i]['prodUrl']
    
    icbc_store = icbc_prods[0].copy()
    icbc_store['merchantProdId'] = '080020000501'
    icbc_store['name'] = '如意金积存'
    icbc_store['skuPrice'] -= 3
    if ccb_store is not None:
        icbc_store['ccbPrice'] = ccb_store['skuPrice']
        icbc_store['ccbProdUrl'] = ccb_store['prodUrl']

    icbc_prods.append(icbc_store)
    icbc_prods = icbc_prods + get_icbc_product_details('9003877851')

    return render(request, "coding/spider/storage.html", {
            'msg_params': msg_params, 'legends': prod_storages,
            'products': icbc_prods, 'chart_datas': storage_dtls
    })


def query_reset(request):
    prod_sku = request.POST.get('prod_sku').split(',')
    emall_api = models_code.spider_emall_api.objects.get(id=1)
    prod_strategy = models_code.spider_product_strategy.objects.filter(product_id=prod_sku[0])
    
    if prod_strategy.exists():
        product = { 'prodSkuId': prod_sku[1], 'logstorId': prod_sku[2] }
        
        if adjust_storage(emall_api, product, prod_strategy.first().adj_storage_cnt):
            messages.info(request, "API调用成功，产品库存已实时调整！")
        else:
            messages.warning(request, "API调用失败，请及时排查问题！")

    return HttpResponseRedirect("/coding/spider/storage/query/")


def strategy_index(request):
    prod_strategys = models_code.spider_product_strategy.objects.all().order_by('id')
    strategies_list = list(prod_strategys.values('id', 'product_id', 'product_name', 'min_storage_cnt', 'adj_storage_cnt', 'adj_minutes'))
    return render(request, "coding/spider/strategy.html", {
        'prod_strategys_json': json.dumps(strategies_list),
        'minute_steps': [0, 10, 20, 30, 40, 50]
    })


def strategy_update(request):
    if request.method == "POST":
        data = json.loads(request.body)
        for item in data:
            obj = models_code.spider_product_strategy.objects.get(id=item['id'])
            obj.min_storage_cnt = item['min_storage_cnt']
            obj.adj_storage_cnt = item['adj_storage_cnt']
            obj.adj_minutes = item['adj_minutes']
            obj.save()
        
        messages.info(request, "产品策略保存成功，库存调整将按新策略执行！")
    
    return HttpResponse("success")


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


def get_icbc_product_details(prod_link):
    url = f"https://m.mall.icbc.com.cn/products/queryProdSkuAjax.jhtml?productId={prod_link}&isProdDraft=&isBranch=0"
    prods_info = json.loads(json.loads(requests.get(url).content)['prodSkuJson'])
    prods_info = sorted(prods_info, key=lambda x: x['prodSkuId'])
    
    prod_strategys = {}
    for strategy in models_code.spider_product_strategy.objects.all():
        prod_strategys[strategy.product_id] = strategy

    for product in prods_info:
        storage_strategy = prod_strategys[product['merchantProdId'].rjust(9, '0')]
        
        product['merchantProdId'] = storage_strategy.product_id
        product['name'] = storage_strategy.product_name
        product['prodUrl'] = f'https://m.mall.icbc.com.cn/products/pd_{prod_link}.jhtml'
        
        product['skuStorage'] = int(product['skuStorage'])
        product['standard_storage'] = storage_strategy.adj_storage_cnt
        product['skuPrice'] = round(float(product['skuPrice'].replace(',', '')) / storage_strategy.spec, 2)
        
        if product['skuStorage'] <= storage_strategy.min_storage_cnt:
            product['is_warning'] = 1
    
    return prods_info


def get_ccb_product_details():
    ccb_brand_prods = ['261100121', '261100122']
    ccb_store_prod = '291000001'
    
    ccb_store = None
    ccb_brands = []
    
    url_store = 'https://tool.ccb.com/webtran/static/trendchart/getAccountData.gsp?dateType=timeSharing&sec_code={0}_BUY'
    url_price = 'https://tool.ccb.com/webtran/static/trendchart/ccbgold.html?priceType=BUY'
    
    try:
        response = requests.get(url_store.format(ccb_store_prod))
        prod_json = json.loads(response.content)
        
        if prod_json['new_pri'] is not None:
            ccb_store = { 'merchantProdId': ccb_store_prod, 'name': '建行易存金', 'skuPrice': round(float(prod_json['new_pri']), 2), 'skuStorage': 0, 'prodUrl': url_price }
    except Exception as e:
        print(f"CCB Price Fetch Failed: {e}")
    
    for brand_prod in ccb_brand_prods:
        url_sign = "https://gold.ccb.com/tran/WCCMainPlatV5?CCB_IBSVersion=V5&SERVLET_NAME=WCCMainPlatV5&TXCODE=100119"
        url_brand = "https://gold.ccb.com/tran/WCCMainPlatV5?CCB_IBSVersion=V5&TXCODE=NGJS09&PM_PD_ID={0}&Hdl_InsID=110000000&Org_Inst_Rgon_Cd=SH&Txn_Itt_Chnl_TpCd=0006&AlSal_Ind=1"
        url_shop = 'https://gold.ccb.com/chn/home/gold_new/cpjs/swgjs/flsx/cpxq/index.shtml?PM_PD_ID={0}&Hdl_InsID=110000000&Org_Inst_Rgon_Cd=SH'
        
        headers = { "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36" }
        
        response = requests.get(url_sign, headers=headers)
        cookies = response.cookies
        
        try:
            response = requests.get(url_brand.format(brand_prod), headers=headers, cookies=cookies)
            prod_json = json.loads(response.content)['GRP'][0]
            
            ccb_brands.append({ 'merchantProdId': prod_json['PM_PD_ID'], 'name': '建行' + prod_json['ASPD_Nm'], 'skuPrice': round(float(prod_json['Br_Sell_Prc']), 2), 'skuStorage': 0, 'prodUrl': url_shop.format(brand_prod) })
        except Exception as e:
            print(f"CCB Price Fetch Failed: {e}")
    
    return (ccb_store, ccb_brands)