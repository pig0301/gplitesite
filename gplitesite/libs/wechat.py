from home import models
import requests, json, time

API_URL = 'https://qyapi.weixin.qq.com/cgi-bin'


def get_access_token(app_id):
    wechat = models.wechat_message.objects.get(id=app_id)
    get_token_url = f'{API_URL}/gettoken?corpid={wechat.corp_id}&corpsecret={wechat.corp_secret}'
    wechat.access_token = requests.get(url=get_token_url).json().get('access_token')
    
    return wechat

def send_text_message(app_id, content):
    wechat = get_access_token(app_id)
    
    send_msg_url = f'{API_URL}/message/send?access_token={wechat.access_token}'
    data = {
       'touser' : wechat.to_user,
       'msgtype' : "text",
       'agentid' : wechat.agent_id,
       'text' : {
           'content' : content
       },
    }
    
    requests.post(url=send_msg_url, data=json.dumps(data))

def get_mail_list():
    wechat = get_access_token(2)
    
    mail_list_url = f'{API_URL}/exmail/app/get_mail_list?access_token={wechat.access_token}'
    
#     data = {
#         'begin_time': begin_time,
#         'end_time': end_time
#     
#     }

    print(time.time())