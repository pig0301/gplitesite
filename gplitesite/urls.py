from django.conf.urls import include, url
from django.urls import path

from django.contrib import admin
admin.autodiscover()

import blogsite.views

import blogsite.apps.home.views as home

# Examples:
# url(r'^$', 'gplitesite.views.home', name='home'),
# url(r'^blog/', include('blog.urls')),

urlpatterns = [
    url(r'^$', home.index, name='index'),
    url(r'^db', blogsite.views.db, name='db'),
    path('admin/', admin.site.urls),
]
