from django.http import HttpResponse
from django.shortcuts import render
import time

from libs import wechat


def mail_list(request):
    mail_list = wechat.get_mail_list_detail()
    return render(request, "coding/wechat/mail.html", { 'mail_list': mail_list })


def mail_parse(request):
    mail_id = request.GET.get('id')
    content = wechat.get_mail_content(mail_id)
    text = ''
    
    for part in content.walk():
        content_type = part.get_content_type()
        content_disposition = part.get('Content-Disposition')
        
        if content_type == 'text/plain':
            text = part.get_payload(decode=True).decode()
            for s in wechat.process_mail_text(text):
                wechat.send_text_message(2, s)
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