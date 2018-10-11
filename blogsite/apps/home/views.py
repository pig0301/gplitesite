from django.shortcuts import render
from django.http import HttpResponse

import sys

# Create your views here.
def index(request):
    return HttpResponse('\n'.join(sys.path))