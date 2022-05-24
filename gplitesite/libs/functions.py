from django.shortcuts import render
from home import models

import settings
import requests, json


def render_template(template, data, request):
    data["IS_DEBUG"] = settings.DEBUG
    data["SERVER_TYPE"] = settings.SERVER_TYPE
    return render(request, template, data)

def check_login(request):
    return request.user is not None and request.user.is_authenticated

def check_java_client(request):
    return request.META['HTTP_USER_AGENT'] == 'Java/1.8/GPLite.com' or settings.DEBUG

def send_wechat_message(message_id, content):
    wechat = models.wechat_message.objects.get(id=message_id)

    get_token_url = 'https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid={}&corpsecret={}'
    send_msg_url = "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token={}"
     
    access_token = requests.get(url=get_token_url.format(wechat.corp_id, wechat.corp_secret)).json().get('access_token')
    
    data = {
       "touser" : wechat.to_user,
       "msgtype" : "text",
       "agentid" : wechat.agent_id,
       "text" : {
           "content" : content
       },
       "safe":0
    }
    
    requests.post(url=send_msg_url.format(access_token), data=json.dumps(data))