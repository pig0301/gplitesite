from libs.functions import render_template
from django.http import HttpResponse

from libs import wechat

import time


def mail_list(request):
    wechat.get_mail_list()
    return HttpResponse(str(time.time()))