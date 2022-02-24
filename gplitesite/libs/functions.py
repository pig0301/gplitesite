from django.shortcuts import render

import settings


def render_template(template, data, request):
    data["IS_DEBUG"] = settings.DEBUG
    data["SERVER_TYPE"] = settings.SERVER_TYPE
    return render(request, template, data)

def check_login(request):
    return request.user is not None and request.user.is_authenticated