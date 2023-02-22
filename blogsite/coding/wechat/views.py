from django.http import HttpResponse
import time

from libs.functions import render_template, check_login
from libs import wechat


def mail_list(request):
    if check_login(request):
        mail_list = wechat.get_mail_list_detail()
        return render_template("coding/wechat/mail.html", { 'mail_list': mail_list }, request)
    else:
        return HttpResponse("非管理员用户禁止访问！")

def mail_parse(request):
    if check_login(request):
        mail_id = request.GET.get('id')
        content = wechat.get_mail_content(mail_id)
        text = ''
        
        for part in content.walk():
            content_type = part.get_content_type()
            content_disposition = part.get('Content-Disposition')
            
            if content_type == 'text/plain':
                text = part.get_payload(decode=True).decode()
                wechat.send_text_message(2, text)
            elif content_type.startswith('image/'):
                filename = part.get_filename()
                if filename:
                    media_id = wechat.upload_file(part.get_payload(decode=True), 'image', filename)
                    wechat.send_media_message(media_id, 'image')
                    time.sleep(0.5)
            elif content_disposition and content_disposition.startswith('attachment'):
                filename = wechat.decode_mime_words(part.get_filename())
                if filename:
                    media_id = wechat.upload_file(part.get_payload(decode=True), 'file', filename)
                    wechat.send_media_message(media_id, 'file')
                    time.sleep(0.5)
    
        return HttpResponse(text)
    else:
        return HttpResponse("非管理员用户禁止访问！")