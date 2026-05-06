from django.utils import timezone
from django.conf import settings
from django_rq import job

from home import models as models_home
from libs import constants, wechat, dingding

from coding.spider import models as models_code
from coding.spider import views as views_code

import pandas as pd
import matplotlib.pyplot as plt
import matplotlib, os


@job('icbc_worker', timeout=constants.JOB_TIMEOUT, result_ttl=constants.RESULT_TTL)
def query_storage(mode):
    dttm = timezone.now()
    
    if mode == constants.CLEAN_MODE:
        models_code.spider_product_storage.objects.filter(event_dt__lt=dttm.date()).delete()
    
    standard_prods = views_code.get_icbc_product_details('9003867817')
    cucurbit_prods = views_code.get_icbc_product_details('9003877851')
    
    auto_save_product_storage(standard_prods, dttm)
    auto_reset_product_storage(standard_prods + cucurbit_prods, dttm)

    if mode == constants.SAVE_MODE:
        data = models_code.spider_product_storage.objects.filter(event_dt=dttm.date()).all().values('product_name', 'create_dttm', 'price', 'storage_cnt')
        
        his_data = [
            models_code.spider_product_storage_h (
                product_name = obj['product_name'],
                create_dttm = obj['create_dttm'],
                price=obj['price'],
                storage_cnt=obj['storage_cnt']
            ) for obj in data
        ]
        models_code.spider_product_storage_h.objects.bulk_create(his_data, batch_size=1000)
    
        df = pd.DataFrame.from_records(data)
        with pd.option_context('display.max_rows', None, 'display.max_columns', None, 'display.expand_frame_repr', False):
            print(df)
        
        df['create_dttm'] = pd.to_datetime(df['create_dttm'])
        df['create_dttm'] = df['create_dttm'].dt.strftime('%H:%M')
        
        df_final = df[df['product_name'].isin(['如意金条100g', '建行投资金条100g（配送）', '建行易存金'])]
        df_tmp = df[df['product_name'] == '如意金条200g'].copy()
    
        df_tmp['product_name'] = '如意金积存'
        df_tmp['price'] = df_tmp['price'] - 1
        
        df_final = pd.concat([df_final, df_tmp])
        draw_diagram(df_final, dttm.date())


def auto_save_product_storage(icbc_prods, dttm):
    (ccb_store, ccb_brands) = views_code.get_ccb_product_details()
    if ccb_store is not None:
        ccb_brands.append(ccb_store)
    
    for prod in icbc_prods + ccb_brands:
        models_code.spider_product_storage(
            event_dt=dttm.date(), product_id=prod['merchantProdId'],
            product_name=prod['name'], price=prod['skuPrice'],
            storage_cnt=int(prod['skuStorage']), create_dttm=dttm
        ).save()


def auto_reset_product_storage(icbc_prods, dttm):
    storage_warn = ""
    msg_level = models_home.message_level.objects.get(id=1)
    
    prod_strategys = {}
    for strategy in models_code.spider_product_strategy.objects.all():
        prod_strategys[strategy.product_id] = strategy
    
    for product in icbc_prods:
        storage_strategy = prod_strategys[product['merchantProdId']]
        if product['skuStorage'] <= storage_strategy.min_storage_cnt:
            if msg_level.emall_api == None or not dttm.minute in storage_strategy.adj_minutes:
                storage_warn += "\n{0}仅剩{1}件。".format(product['name'], product['skuStorage'])
            else:
                if views_code.adjust_storage(msg_level.emall_api, product, storage_strategy.adj_storage_cnt):
                    storage_warn += "\n{0}仅剩{1}件，已自动增加{2}件库存。".format(product['name'], product['skuStorage'], storage_strategy.adj_storage_cnt - product['skuStorage'])
                else:
                    storage_warn += "\n{0}仅剩{1}件，自动增加库存失败！".format(product['name'], product['skuStorage'])
    
    if msg_level and len(storage_warn) > 0:
        storage_warn = "【重要】请关注以下贵金属产品线上库存！\n" + storage_warn + "\n\n[时间]：" + str(dttm)[0:19]
        
        if msg_level.wechat_msg:
            wechat.send_text_message(msg_level.wechat_msg.id, storage_warn)
         
        if msg_level.dingding_msg:
            dingding.send_text_message(msg_level.dingding_msg.id, storage_warn)


def draw_diagram(df, tx_dt):
    matplotlib.use('Agg')

    file_dir = os.path.join(settings.BASE_DIR, 'backups/tmpimgs')
    if settings.DEBUG == False:
        file_dir = '/data/share/log/gplitesite/cron/'
        matplotlib.font_manager.fontManager.addfont('/usr/share/fonts/wqy-microhei/wqy-microhei.ttc')
    
    plt.style.use('seaborn')
    plt.rcParams['font.sans-serif'] = ['Microsoft YaHei', 'WenQuanYi Micro Hei']
    plt.rcParams['axes.unicode_minus'] = False
    
    CUSTOM_PALETTE = {
        '如意金条100g': '#EB2F28',
        '如意金积存': '#FFCE56',
        '建行投资金条100g（配送）': '#4BC0C0',
        '建行易存金': '#005A8C'
    }
    
    ax = plt.subplots(figsize=(12, 6), dpi=120)[1]
    
    for product, group in df.groupby('product_name'):
        group = group.sort_values('create_dttm')
        
        line_style = '--' if '建行' in product else '-'
        line_color = CUSTOM_PALETTE[product]
        line_width = 2
        
        ax.plot(
            group['create_dttm'],
            group['price'],
            linestyle=line_style,
            linewidth=line_width,
            color=line_color,
            label=product
        )
    

    ax.set_title('投资金条报价监测图表（{0}）'.format(tx_dt), fontsize=14, pad=20, fontweight='bold', color='#2E2E2E')
    ax.set_xlabel('监测时间 (时:分)', fontsize=12, labelpad=10, color='#555555')
    ax.set_ylabel('价格 (元)', fontsize=12, labelpad=10, color='#555555')

    ax.margins(x=0)
    ax.xaxis.set_major_locator(plt.MaxNLocator(45))

    ax.grid(True, linestyle='--', linewidth=0.5, alpha=0.7, color='#AAAAAA')
    ax.tick_params(axis='both', which='major', labelsize=10, colors='#666666')
    
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['left'].set_color('#CCCCCC')
    ax.spines['bottom'].set_color('#CCCCCC')
    
    legend = ax.legend(
        title='产品名称',
        frameon=True,
        loc='upper left',
        bbox_to_anchor=(1, 1),
        title_fontsize=11,
        fontsize=10,
        edgecolor='#EEEEEE',
        facecolor='#FAFAFA'
    )
    
    legend.get_title().set_color('#333333')
    
    plt.setp(ax.get_xticklabels(), rotation=45, ha='right', rotation_mode='anchor')
    plt.tight_layout()

    plt.savefig(os.path.join(file_dir, 'price_trend_{0}.png'.format(tx_dt)), dpi=300, bbox_inches='tight')
    plt.close()