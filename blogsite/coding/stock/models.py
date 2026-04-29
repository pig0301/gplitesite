from django.db import models


class stock_ths_stocks(models.Model):
    stock_code = models.CharField(max_length=12, unique=True)
    stock_name = models.CharField(max_length=50)
    update_dttm = models.DateTimeField()
    
    class Meta:
        indexes = [ models.Index(fields=['stock_code']) ]