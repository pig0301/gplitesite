from django.conf.urls import url
from django.urls import path

from django.contrib import admin
admin.autodiscover()

import home.views as home

# Examples:
# url(r'^$', 'gplitesite.views.home', name='home'),
# url(r'^blog/', include('blog.urls')),

urlpatterns = [
    url(r'^$', home.index, name='index'),
    path('admin/', admin.site.urls),
]
