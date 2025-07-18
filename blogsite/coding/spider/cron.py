from django.utils import timezone
from django.conf import settings

from home import models as models_home
from libs import constants

from coding.spider import models as models_code
from coding.spider import views as views_code

import pandas as pd
import matplotlib.pyplot as plt
import matplotlib, os


def query_storage(mode=constants.NORMAL_MODE):
    dttm = timezone.now()
    msg_level = models_home.message_level.objects.get(id=1)
    
    if mode == constants.CLEAN_MODE:
        models_code.spider_product_storage.objects.filter(event_dt__lt=dttm.date()).delete()
    
    views_code.get_product_details(['9003867817'], msg_level, dttm, True)

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
        
        df_final = df[df['product_name'].isin(['如意金条100g', '建行投资金条(100克)', '建行易存金'])]
        df_tmp = df[df['product_name'] == '如意金条200g'].copy()
    
        df_tmp['product_name'] = '如意金积存'
        df_tmp['price'] = df_tmp['price'] - 1
        
        df_final = pd.concat([df_final, df_tmp])
        draw_diagram(df_final, dttm.date())


def query_storage_with_clean():
    query_storage(mode=constants.CLEAN_MODE)


def query_storage_with_save():
    query_storage(mode=constants.SAVE_MODE)


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
        '建行投资金条(100克)': '#4BC0C0',
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