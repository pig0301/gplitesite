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
    
    def time_consume(self):
        if self.end_dttm is None:
            return timezone.now() - self.start_dttm
        else:
            return self.end_dttm - self.start_dttm


DEFAULT_PRODUCE_ANNOTATE = {
    'max_end_dttm': Max('produce_detail__end_dttm'),
    'min_start_dttm': Min('produce_detail__start_dttm'),
    'min_end_dttm': Min('produce_detail__end_dttm')
}