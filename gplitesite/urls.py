from django.conf.urls import url
from django.urls import path

from django.views.static import serve
from django.contrib import admin
admin.autodiscover()

import home.views as home
import snooker.views as snooker

import settings


urlpatterns = [
    url(r'^$', home.index, name='index'),

    url(r'^login/$', home.login),
    url(r'^logout/$', home.logout),
    
    url(r'^snooker/$', snooker.index),

    path('admin/', admin.site.urls),
    url(r'^media/(?P<path>.*)$', serve, {"document_root": settings.MEDIA_ROOT}),
]
