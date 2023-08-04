from django.shortcuts import render
import settings


def render_template(template, data, request):
    data["IS_DEBUG"] = settings.DEBUG
    data["SERVER_TYPE"] = settings.SERVER_TYPE
    return render(request, template, data)

def check_login(request):
    return request.user is not None and request.user.is_authenticated

def check_java_client(request):
    if settings.DEBUG:
        return True

    if 'HTTP_X_FORWARDED_FOR' in request.META:
        ip = request.META['HTTP_X_FORWARDED_FOR']
    else:
        ip = request.META['REMOTE_ADDR']

    user_agent = request.META['HTTP_USER_AGENT']

    return user_agent == 'Java/1.8/GPLite.com' and ip == '116.230.242.74'