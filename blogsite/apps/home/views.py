from django.shortcuts import render
from django.http import HttpResponse

from dj_database_url import config

# Create your views here.
def index(request):

    return HttpResponse("\n".join(['%s:%s' % item for item in config().items()]))


