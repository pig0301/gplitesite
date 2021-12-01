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
    url(r'^game/reconnect/$', game.net_reconnect),
    url(r'^game/produce/start/$', game.produce_start),
    url(r'^game/produce/finish/(\d+)/$', game.produce_finish),
    url(r'^game/produce/detail/add/(\d+)/$', game.produce_detail_add),

    path('admin/', admin.site.urls),
    url(r'^media/(?P<path>.*)$', serve, {"document_root": settings.MEDIA_ROOT}),
]
