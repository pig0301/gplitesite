from django.db import models


class stock_ths_stocks(models.Model):
    stock_code = models.CharField(max_length=12, unique=True)
    stock_name = models.CharField(max_length=50)
    update_dttm = models.DateTimeField()


class stock_ths_daily_quotes(models.Model):
    stock_code = models.ForeignKey(
        stock_ths_stocks, 
        to_field='stock_code', 
        on_delete=models.DO_NOTHING,
        db_column='stock_code',
        related_name='daily_quotes'
    )

    trade_dt = models.DateField()
    open_price = models.DecimalField(max_digits=12, decimal_places=4)
    high_price = models.DecimalField(max_digits=12, decimal_places=4)
    low_price = models.DecimalField(max_digits=12, decimal_places=4)
    close_price = models.DecimalField(max_digits=12, decimal_places=4)
    total_volume = models.DecimalField(max_digits=20, decimal_places=4)
    
    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['stock_code', 'trade_dt'], name='unique_stock_quote')
        ]

        indexes = [
            models.Index(fields=['stock_code', '-trade_dt']),
            models.Index(fields=['trade_dt']),
        ]