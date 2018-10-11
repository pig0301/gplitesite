from django.shortcuts import render
from django.http import HttpResponse

import settings

# Create your views here.
def index(request):
    return HttpResponse(settings.IS_LOCAL_ENV)