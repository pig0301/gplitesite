from django.db import models


class spider_product_storage(models.Model):
    event_dt = models.DateField()
    product_id = models.CharField(max_length=45)
    product_name = models.CharField(max_length=45)
    price = models.DecimalField(max_digits=18, decimal_places=2)
    storage_cnt = models.IntegerField()
    create_dttm = models.DateTimeField()