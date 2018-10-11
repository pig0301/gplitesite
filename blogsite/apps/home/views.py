from django.shortcuts import render
from django.http import HttpResponse

from dj_database_url import config
import os

# Create your views here.
def index(request):

    return HttpResponse(os.sys.platform)


