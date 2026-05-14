from django.db import models
import json


class ths_stocks(models.Model):
    stock_code = models.CharField(max_length=12, unique=True)
    stock_name = models.CharField(max_length=50)
    update_dttm = models.DateTimeField()


class ths_daily_quotes(models.Model):
    stock_code = models.ForeignKey(
        ths_stocks, 
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


class ths_stock_indicators(models.Model):
    stock_code = models.ForeignKey(
        ths_stocks, 
        to_field='stock_code', 
        on_delete=models.DO_NOTHING,
        db_column='stock_code',
        related_name='stock_indicators'
    )

    trade_dt = models.DateField()
    ma20 = models.DecimalField(max_digits=12, decimal_places=4)
    ma30 = models.DecimalField(max_digits=12, decimal_places=4)
    ma49 = models.DecimalField(max_digits=12, decimal_places=4)
    ma60 = models.DecimalField(max_digits=12, decimal_places=4)
    ma120 = models.DecimalField(max_digits=12, decimal_places=4)
    ma250 = models.DecimalField(max_digits=12, decimal_places=4)
    macd_diff = models.DecimalField(max_digits=12, decimal_places=4)
    macd_dea = models.DecimalField(max_digits=12, decimal_places=4)
    macd_bar = models.DecimalField(max_digits=12, decimal_places=4)
    
    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['stock_code', 'trade_dt'], name='unique_stock_indicators')
        ]

        indexes = [
            models.Index(fields=['stock_code', '-trade_dt']),
            models.Index(fields=['trade_dt']),
        ]


class pick_strategy(models.Model):
    strategy_name = models.CharField(max_length=50)
    python_module = models.CharField(max_length=50)
    exec_function = models.CharField(max_length=50)


class pick_strategy_result(models.Model):
    strategy = models.ForeignKey(pick_strategy, on_delete=models.DO_NOTHING, related_name='strategy_result')
    pick_date = models.DateField()
    stock_code = models.ForeignKey(
        ths_stocks, 
        to_field='stock_code', 
        on_delete=models.DO_NOTHING,
        db_column='stock_code',
        related_name='strategy_stock_code'
    )
    
    addition_info = models.TextField()
    
    @property
    def info_dict(self):
        if self.addition_info:
            try:
                return json.loads(self.addition_info)
            except ValueError:
                return {}
        return {}

    @info_dict.setter
    def info_dict(self, value):
        self.addition_info = json.dumps(value, ensure_ascii=False)