from django.conf.urls import url
from django.urls import path

from django.views.static import serve
from django.contrib import admin
admin.autodiscover()

from home import views as home
from snooker import views as snooker
from snooker.campaign import views as snooker_campaign
from game import views as game

import settings


urlpatterns = [
    url(r'^$', home.index),

    url(r'^login/$', home.login),
    url(r'^logout/$', home.logout),
    
    url(r'^snooker/$', snooker.index),
    url(r'^snooker/campaign/$', snooker_campaign.index),
    url(r'^snooker/campaign/(\d+)/$', snooker_campaign.detail),
    
    url(r'^game/$', game.index),
    url(r'^game/produce/start/$', game.produce_start),
    url(r'^game/produce/clear/$', game.produce_clear),
    url(r'^game/produce/finish/(\d+)/$', game.produce_finish),
    url(r'^game/produce/error/add/(\d+)/$', game.produce_error_add),
    url(r'^game/produce/detail/add/(\d+)/$', game.produce_detail_add),
    url(r'^game/produce/prepare/$', game.produce_prepare),
    url(r'^game/produce/prepare/update/$', game.produce_prepare_update),
    url(r'^game/produce/status/reconnect/$', game.produce_status_reconnect),
    url(r'^game/produce/status/(\w+)/$', game.produce_status_change),

    path('admin/', admin.site.urls),
    url(r'^media/(?P<path>.*)$', serve, {"document_root": settings.MEDIA_ROOT}),
]
