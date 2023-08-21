from django.db import models


class wechat_message(models.Model):
    corp_id = models.CharField(max_length=30)
    corp_secret = models.CharField(max_length=100)
    agent_id = models.IntegerField()
    to_user = models.CharField(max_length=100)
    msg_type = models.CharField(max_length=30)

class dingding_message(models.Model):
    app_key = models.CharField(max_length=30)
    app_secret = models.CharField(max_length=100)
    agent_id = models.BigIntegerField()
    to_user = models.CharField(max_length=500)
    msg_type = models.CharField(max_length=30)
    
class message_level(models.Model):
    msg_info = models.CharField(max_length=100)
    wechat_msg = models.OneToOneField(wechat_message, on_delete=models.DO_NOTHING, null=True)
    dingding_msg = models.OneToOneField(dingding_message, on_delete=models.DO_NOTHING, null=True)