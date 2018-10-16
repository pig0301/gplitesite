from django.db import models

from django.db.models.aggregates import Avg, Sum, Max, Count
from django.db.models import F


class group(models.Model):
    name = models.CharField(max_length=45)
    is_show = models.CharField(max_length=1)
    
    def __unicode__(self):
        return self.name
    
class player(models.Model):
    name = models.CharField(max_length=45)
    group = models.ForeignKey(group, related_name='group_player')

    def __unicode__(self):
        return self.name

class gym(models.Model):
    name = models.CharField(max_length=45)
    road = models.CharField(max_length=45)

    def __unicode__(self):
        return self.name + '(' + self.road + ')'

class cue(models.Model):
    name = models.CharField(max_length=45)
    material = models.CharField(max_length=45)
    owner = models.OneToOneField(player)

    def __unicode__(self):
        return self.name + '(' + self.owner.name + ')'

class campaign(models.Model):
    event_dt = models.DateField()
    gym = models.OneToOneField(gym)
    cue = models.OneToOneField(cue)
    opponent = models.OneToOneField(player)
    let_points = models.IntegerField()
    is_finished = models.CharField(max_length=1)

class frame(models.Model):
    campaign = models.ForeignKey(campaign, related_name='campaign_frame')
    cue = models.OneToOneField(cue)
    let_points = models.IntegerField()
    get_points = models.IntegerField()
    oppo_points = models.IntegerField()
    is_win = models.CharField(max_length=1)
    max_break = models.IntegerField()
    memo = models.CharField(max_length=200)


DEFAULT_CAMPAIGN_ANNOTATE = {
    'win_frames': Sum('campaign_frame__is_win'),
    'lose_frames': Sum(1 - F('campaign_frame__is_win')),
    'avg_get_points': Avg('campaign_frame__get_points'),
    'avg_oppo_points': Avg('campaign_frame__oppo_points'),
    'campaign_break': Max('campaign_frame__max_break')
}


DEFAULT_FRAME_ANNOTATE = {
    'win_frames': Sum('is_win'),
    'lose_frames': Sum(1 - F('is_win')),
    'avg_get_points': Avg('get_points'),
    'avg_oppo_points': Avg('oppo_points'),
    'frame_count': Count('id'),
    'campaign_count': Count('campaign', distinct=True),
    'maximum_break': Max('max_break')
}