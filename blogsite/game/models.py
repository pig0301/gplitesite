from django.db import models
from django.utils import timezone

from datetime import timedelta


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
            diff = timezone.now() - self.start_dttm
        else:
            diff = self.end_dttm - self.start_dttm
        
        return timedelta(diff.days, diff.seconds, 0)