from home import models
import requests, json, time, email, re

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
    
    end_time = int(time.time())
    begin_time = end_time - 24 * 3600
    
    mail_list_url = f'{API_URL}/exmail/app/get_mail_list?access_token={wechat.access_token}'
    data = { 'begin_time': begin_time, 'end_time': end_time }

    return requests.post(mail_list_url, json=data).json()['mail_list']

def get_mail_content(mail_id):
    wechat = get_access_token(2)
    
    read_mail_url = f'{API_URL}/exmail/app/read_mail?access_token={wechat.access_token}'
    data = { 'mail_id': mail_id }
    
    return email.message_from_string(requests.post(url=read_mail_url, json=data).json()['mail_data'])

def get_mail_list_detail():
    mail_list = get_mail_list()
    
    for i in range(0, len(mail_list)):
        detail = get_mail_content(mail_list[i]['mail_id']);
        
        mail_list[i]['From'] = decode_mime_words(detail['From'])
        mail_list[i]['Subject'] = decode_mime_words(detail['Subject'])
        
        send_time = time.strptime(detail['Date'].replace(' +0800', '').replace(' (GMT+08:00)', ''), '%a, %d %b %Y %H:%M:%S')
        mail_list[i]['Date'] = time.strftime('%Y-%m-%d %H:%M:%S', send_time)
    
    return mail_list

def upload_file(media_file, media_type, filename):
    wechat = get_access_token(2)
    
    upload_url = f'{API_URL}/media/upload?access_token={wechat.access_token}'
    
    files = {'media': (filename, media_file)}
    params = {'type': media_type}
    
    r = requests.post(upload_url, files=files, params=params)
    if r.status_code == 200:
        data = r.json()
        if data.get('media_id'):
            return data['media_id']
    return None

def process_mail_text(mail_text):
    textList = []
    textBuffer = ''
    
    for text in mail_text.split('\n'):
        text = text.strip()
        
        if len(text) > 0:
            if len(textBuffer) > 0:
                textBuffer += '\n'
            
            if not re.match(r'^\uEA62.+\.\w{1,4}$', text):
                textBuffer += text
        elif len(textBuffer) > 0:
            textList.append(textBuffer)
            textBuffer = ''
    
    if len(textBuffer) > 0 and not "。任何第三方均不得查阅或使用此邮件信息。" in textBuffer:
        textList.append(textBuffer)
    
    return textList

def send_media_message(media_id, media_type):
    wechat = get_access_token(2)
    
    url = f'{API_URL}/message/send?access_token={wechat.access_token}'
    data = {
        'touser': wechat.to_user,
        'msgtype': media_type,
        'agentid': wechat.agent_id,
        media_type: {
            'media_id': media_id
        }
    }

    r = requests.post(url, json=data)
    if r.status_code == 200:
        return r.json()
    return None
    
def decode_mime_words(s):
    return u''.join(
        word.decode(encoding or 'utf8') if isinstance(word, bytes) else word
        for word, encoding in email.header.decode_header(s))