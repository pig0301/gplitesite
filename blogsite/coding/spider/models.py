from django.db import models


class spider_product_storage(models.Model):
    event_dt = models.DateField()
    product_id = models.CharField(max_length=45)
    product_name = models.CharField(max_length=45)
    price = models.DecimalField(max_digits=18, decimal_places=2)
    storage_cnt = models.IntegerField()
    create_dttm = models.DateTimeField()


class spider_emall_api(models.Model):
    app_key = models.CharField(max_length=10)
    app_secret = models.CharField(max_length=50)
    auth_code = models.CharField(max_length=100)
    msg_type = models.CharField(max_length=30)