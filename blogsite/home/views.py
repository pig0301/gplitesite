from django.shortcuts import render
import settings


def index(request):
    data = {'IS_DEBUG': settings.DEBUG}
    
    return render(request, 'index.html', data)