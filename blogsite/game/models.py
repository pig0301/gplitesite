from django.db import models
from django.utils import timezone
from django.db.models.aggregates import Min, Max


class cg_mp700_produce(models.Model):
    warehouse = models.CharField(max_length=45)
    main_chef = models.CharField(max_length=45)

class cg_mp700_detail(models.Model):
    produce = models.ForeignKey(cg_mp700_produce, on_delete=models.DO_NOTHING, related_name='produce_detail')
    round = models.IntegerField()
    step = models.IntegerField()
    start_dttm = models.DateTimeField()
    end_dttm = models.DateTimeField(null=True)
    
    class Meta: 
        ordering = ['-start_dttm', '-id']
    
    def time_consume(self):
        if self.end_dttm is None:
            return timezone.now() - self.start_dttm
        else:
            return self.end_dttm - self.start_dttm

class cg_mp700_prepare(models.Model):
    warehouse = models.CharField(max_length=45)
    account = models.CharField(max_length=45)
    is_ready = models.CharField(max_length=1)
    last_ready_dttm = models.DateTimeField()
    last_used_dttm = models.DateTimeField()

class cg_mp700_status(models.Model):
    finish_rounds = models.IntegerField()
    last_reconnect_dttm = models.DateTimeField()
    last_reset_dttm = models.DateTimeField()


DEFAULT_PRODUCE_ANNOTATE = {
    'max_end_dttm': Max('produce_detail__end_dttm'),
    'min_start_dttm': Min('produce_detail__start_dttm'),
    'min_end_dttm': Min('produce_detail__end_dttm')
}