from django.db import models

from django.db.models.aggregates import Avg, Sum, Max, Count

from django.db.models import IntegerField
from django.db.models.functions import Cast


class group(models.Model):
    name = models.CharField(max_length=45)
    is_show = models.CharField(max_length=1)
    
    def __str__(self):
        return self.name
    
class player(models.Model):
    name = models.CharField(max_length=45)
    group = models.ForeignKey(group, on_delete=models.DO_NOTHING, related_name='group_player')

    def __str__(self):
        return self.name

class gym(models.Model):
    name = models.CharField(max_length=45)
    road = models.CharField(max_length=45)

    def __str__(self):
        return self.name + '(' + self.road + ')'

class cue(models.Model):
    name = models.CharField(max_length=45)
    material = models.CharField(max_length=45)
    owner = models.OneToOneField(player, on_delete=models.DO_NOTHING)

    def __str__(self):
        return self.name + '(' + self.owner.name + ')'

class campaign(models.Model):
    event_dt = models.DateField()
    gym = models.OneToOneField(gym, on_delete=models.DO_NOTHING)
    cue = models.OneToOneField(cue, on_delete=models.DO_NOTHING)
    opponent = models.OneToOneField(player, on_delete=models.DO_NOTHING)
    let_points = models.IntegerField()
    is_finished = models.CharField(max_length=1)

class frame(models.Model):
    campaign = models.ForeignKey(campaign, on_delete=models.DO_NOTHING, related_name='campaign_frame')
    cue = models.OneToOneField(cue, on_delete=models.DO_NOTHING)
    let_points = models.IntegerField()
    get_points = models.IntegerField()
    oppo_points = models.IntegerField()
    is_win = models.CharField(max_length=1)
    max_break = models.IntegerField()
    memo = models.CharField(max_length=200)


DEFAULT_CAMPAIGN_ANNOTATE = {
    'win_frames': Sum(Cast('campaign_frame__is_win', IntegerField())),
    'lose_frames': Sum(1 - Cast('campaign_frame__is_win', IntegerField())),
    'avg_get_points': Avg('campaign_frame__get_points'),
    'avg_oppo_points': Avg('campaign_frame__oppo_points'),
    'campaign_break': Max('campaign_frame__max_break')
}


DEFAULT_FRAME_ANNOTATE = {
    'win_frames': Sum(Cast('is_win', IntegerField())),
    'lose_frames': Sum(1 - Cast('is_win', IntegerField())),
    'avg_get_points': Avg('get_points'),
    'avg_oppo_points': Avg('oppo_points'),
    'frame_count': Count('id'),
    'campaign_count': Count('campaign', distinct=True),
    'maximum_break': Max('max_break')
}