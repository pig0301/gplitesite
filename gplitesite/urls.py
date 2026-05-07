from django.conf.urls import url
from django.urls import path, include

from django.views.static import serve
from django.contrib import admin
admin.autodiscover()

from home import views as home
from game import views as game
from stock import views as stock

from snooker import views as snooker
from snooker.campaign import views as snooker_campaign

from coding.wechat import views as coding_wechat
from coding.spider import views as coding_spider

import settings


urlpatterns = [
    url(r'^$', home.index),

    url(r'^login/$', home.login),
    url(r'^logout/$', home.logout),
    url(r'^message_level/update/$', home.message_level_update),
    url(r'^24f/$', home.floor24),
    
    url(r'^coding/wechat/mail/list/', coding_wechat.mail_list),
    url(r'^coding/wechat/mail/parse/', coding_wechat.mail_parse),
    url(r'^coding/spider/storage/query/', coding_spider.query_storage),
    url(r'^coding/spider/storage/reset/', coding_spider.query_reset),
    url(r'^coding/spider/storage/strategy/$', coding_spider.strategy_index),
    url(r'^coding/spider/storage/strategy/update/', coding_spider.strategy_update),

    url(r'^snooker/$', snooker.index),
    url(r'^snooker/campaign/$', snooker_campaign.index),
    url(r'^snooker/campaign/(\d+)/$', snooker_campaign.detail),
    url(r'^snooker/campaign/add_confirm/$', snooker_campaign.add_confirm),
    url(r'^snooker/campaign/finish/(\d+)/$', snooker_campaign.finish),
    url(r'^snooker/campaign/delete/(\d+)/$', snooker_campaign.delete),

    url(r'^snooker/campaign/add_frame_confirm/(\d+)/$', snooker_campaign.add_frame_confirm),
    url(r'^snooker/campaign/delete_last_frame/(\d+)/$', snooker_campaign.delete_last_frame),

    url(r'^game/$', game.index),
    url(r'^game/produce/start/$', game.produce_start),
    url(r'^game/produce/clear/$', game.produce_clear),
    url(r'^game/produce/finish/(\d+)/$', game.produce_finish),
    url(r'^game/produce/error/add/(\d+)/$', game.produce_error_add),

    url(r'^game/produce/detail/add/(\d+)/$', game.produce_detail_add),
    url(r'^game/produce/detail/latest/$', game.produce_detail_latest),
    url(r'^game/produce/status/reconnect/$', game.produce_status_reconnect),
    url(r'^game/produce/status/(\w+)/$', game.produce_status_change),

    url(r'^game/produce/prepare/$', game.produce_prepare),
    url(r'^game/produce/prepare/update/$', game.produce_prepare_update),
    url(r'^game/produce/prepare/update/auto/$', game.produce_prepare_auto_update),
    url(r'^game/produce/prepare/status/$', game.produce_get_prepare_status),
    
    url(r'^stock/$', stock.index),
    url(r'^stock/quotes/(\d{6}\.\w{2})/$', stock.stock_quotes_data),
    url(r'^stock/strategy/dates/(\d+)/$', stock.strategy_dates_data),
    url(r'^stock/strategy/result/(\d+)/(\d{4}-\d{2}-\d{2})/$', stock.strategy_result_data),

    path('admin/', admin.site.urls),
    path('django-rq/', include('django_rq.urls')),
    url(r'^media/(?P<path>.*)$', serve, {"document_root": settings.MEDIA_ROOT}),
]
