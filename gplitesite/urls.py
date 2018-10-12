from django.conf.urls import url
from django.urls import path

from django.contrib import admin
admin.autodiscover()

import home.views as home


urlpatterns = [
    url(r'^$', home.index, name='index'),
    path('admin/', admin.site.urls),
]
