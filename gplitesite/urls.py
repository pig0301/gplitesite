from django.conf.urls import url
from django.urls import path, include

from django.views.static import serve
from django.contrib import admin

admin.autodiscover()

from django.contrib.auth.decorators import login_required

from home import views as home
from game import views as game
from stock import views as stock

from snooker import views as snooker
from snooker.campaign import views as snooker_campaign

from coding.wechat import views as coding_wechat
from coding.spider import views as coding_spider

import settings


def lgn(url_link, view_func, *args, **kwargs):
    return url(url_link, login_required(view_func), *args, **kwargs)


urlpatterns = [
    url(r'^$', home.index),

    url(r'^login/$', home.login),
    url(r'^logout/$', home.logout),
    url(r'^24f/$', home.floor24),
    url(r'^MP_verify_q1pMB1P5nm5yu8tT.txt$', home.WXSDK),

    lgn(r'^message_level/update/$', home.message_level_update),
    
    lgn(r'^coding/wechat/mail/list/', coding_wechat.mail_list),
    lgn(r'^coding/wechat/mail/parse/', coding_wechat.mail_parse),
    lgn(r'^coding/spider/storage/query/', coding_spider.query_storage),
    lgn(r'^coding/spider/storage/reset/', coding_spider.query_reset),
    lgn(r'^coding/spider/storage/strategy/$', coding_spider.strategy_index),
    lgn(r'^coding/spider/storage/strategy/update/', coding_spider.strategy_update),

    url(r'^snooker/$', snooker.index),
    url(r'^snooker/campaign/$', snooker_campaign.index),
    url(r'^snooker/campaign/(\d+)/$', snooker_campaign.detail),

    lgn(r'^snooker/campaign/add_confirm/$', snooker_campaign.add_confirm),
    lgn(r'^snooker/campaign/finish/(\d+)/$', snooker_campaign.finish),
    lgn(r'^snooker/campaign/delete/(\d+)/$', snooker_campaign.delete),
    lgn(r'^snooker/campaign/add_frame_confirm/(\d+)/$', snooker_campaign.add_frame_confirm),
    lgn(r'^snooker/campaign/delete_last_frame/(\d+)/$', snooker_campaign.delete_last_frame),

    url(r'^game/$', game.index),
    url(r'^game/produce/start/$', game.produce_start),
    url(r'^game/produce/finish/(\d+)/$', game.produce_finish),
    url(r'^game/produce/error/add/(\d+)/$', game.produce_error_add),

    lgn(r'^game/produce/clear/$', game.produce_clear),

    url(r'^game/produce/detail/add/(\d+)/$', game.produce_detail_add),
    url(r'^game/produce/detail/latest/$', game.produce_detail_latest),
    url(r'^game/produce/status/reconnect/$', game.produce_status_reconnect),
    url(r'^game/produce/status/(\w+)/$', game.produce_status_change),

    lgn(r'^game/produce/prepare/$', game.produce_prepare),
    lgn(r'^game/produce/prepare/update/$', game.produce_prepare_update),

    url(r'^game/produce/prepare/update/auto/$', game.produce_prepare_auto_update),
    url(r'^game/produce/prepare/status/$', game.produce_get_prepare_status),
    
    lgn(r'^stock/$', stock.index),
    lgn(r'^stock/api/quotes/(\d{6}\.\w{2})/$', stock.stock_quotes_data),
    lgn(r'^stock/api/strategy/$', stock.pick_strategy_data),
    lgn(r'^stock/api/strategy/dates/(\d+)/$', stock.strategy_dates_data),
    lgn(r'^stock/api/strategy/result/(\d+)/(\d{4}-\d{2}-\d{2})/$', stock.strategy_result_data),

    path('admin/', admin.site.urls),
    path('django-rq/', include('django_rq.urls')),
    path('accounts/', include('django.contrib.auth.urls')),
    
    url(r'^media/(?P<path>.*)$', serve, {"document_root": settings.MEDIA_ROOT}),
]