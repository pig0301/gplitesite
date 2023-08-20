from home import models
import requests, json

API_URL = 'https://oapi.dingtalk.com'


def get_access_token(app_id):
    try:
        dingding = models.dingding_message.objects.get(id=app_id)
        get_token_url = f'{API_URL}/gettoken?appkey={dingding.app_key}&appsecret={dingding.app_secret}'
        dingding.access_token = requests.get(url=get_token_url).json().get('access_token')
    except Exception as e:
        print(e)
    
    return dingding

def send_text_message(app_id, content):
    dingding = get_access_token(app_id)
    
    send_msg_url = f'{API_URL}/topapi/message/corpconversation/asyncsend_v2?access_token={dingding.access_token}'
    data = {
       'userid_list' : dingding.to_user,
       'agent_id' : dingding.agent_id,
       'msg' : {
           'msgtype' : 'text',
           'text' : {
               'content' : content
            }
       }
    }
    
    requests.post(url=send_msg_url, data=json.dumps(data))