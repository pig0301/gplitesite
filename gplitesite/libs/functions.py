from django.shortcuts import render
import settings


def render_template(template, data, request):
    data["IS_DEBUG"] = settings.DEBUG
    data["SERVER_TYPE"] = settings.SERVER_TYPE
    return render(request, template, data)

def check_login(request):
    return (request.user is not None and request.user.is_authenticated) or get_client_ip(request) == '127.0.0.1'

def check_java_client(request):
    if settings.DEBUG:
        return True

    user_agent = request.META['HTTP_USER_AGENT']

    return user_agent == 'Java/1.8/GPLite.com' and get_client_ip(request) == '116.230.242.74'

def get_client_ip(request):
    if 'HTTP_X_FORWARDED_FOR' in request.META:
        return request.META['HTTP_X_FORWARDED_FOR']
    else:
        return request.META['REMOTE_ADDR']