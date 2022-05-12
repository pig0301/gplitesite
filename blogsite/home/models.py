from django.db import models


class wechat_message(models.Model):
    corp_id = models.CharField(max_length=30)
    corp_secret = models.CharField(max_length=100)
    agent_id = models.IntegerField()
    to_user = models.CharField(max_length=100)