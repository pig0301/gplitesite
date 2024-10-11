from django.http import HttpResponseRedirect
from django.contrib import auth
from django.contrib import messages
from django.http import HttpResponse

from libs.functions import render_template, check_login

from home import models
from coding.spider import models as models_code


def index(request):
    return render_template('index.html', {}, request)

def floor24(request):
    return HttpResponseRedirect("https://gplite.notion.site/2024-c467147ca09c4776a2c15a23ca09ab3e?pvs=4")

def login(request):
    username = request.POST['user']
    password = request.POST['password']
    redirect_url = request.GET['r']

    user = auth.authenticate(username=username, password=password)

    if username == "" or password == "":
        messages.warning(request, "Login failed. User name and password can not be blank.")
    elif user is not None:
        auth.login(request, user)
    else:
        messages.error(request, "Login failed. User name or password is wrong!", extra_tags="danger")

    return HttpResponseRedirect(redirect_url)

def logout(request):
    redirect_url = request.GET['r']

    auth.logout(request)
    messages.info(request, "Logout successfully!")

    return HttpResponseRedirect(redirect_url)

def message_level_update(request):
    if check_login(request):
        wechat_msg = int(request.POST['wechat_msg'])
        dingding_msg = int(request.POST['dingding_msg'])
        emall_api = int(request.POST['emall_api'])
        
        msg_id = int(request.POST['msg_id'])
        callbackurl = request.POST['callbackurl']
        
        msg_level = models.message_level.objects.get(id=msg_id)
        
        if msg_level:
            if wechat_msg == 0:
                msg_level.wechat_msg = None
            else:
                msg_level.wechat_msg = models.wechat_message.objects.get(id=wechat_msg)
            
            if dingding_msg == 0:
                msg_level.dingding_msg = None
            else:
                msg_level.dingding_msg = models.dingding_message.objects.get(id=dingding_msg)

            if emall_api == 0:
                msg_level.emall_api = None
            else:
                msg_level.emall_api = models_code.spider_emall_api.objects.get(id=emall_api)
            
            msg_level.save()
        
        return HttpResponseRedirect(callbackurl)
    else:
        return HttpResponse("非管理员用户禁止访问！")