from snooker import models

from libs.functions import render_template
from libs import constants


def index(request):
    campaigns = models.campaign.objects.prefetch_related('campaign_frame').annotate(
        **models.DEFAULT_CAMPAIGN_ANNOTATE
    ).order_by('is_finished', '-id')[0:constants.RECENT_CAMPAIGN_COUNT]
    
    gyms = models.gym.objects.order_by('-id')
    cues = models.cue.objects.order_by('id')
    opponents = models.player.objects.filter(group__is_show='1').order_by('-id')

    return render_template("snooker/index.html", {
        'campaigns': campaigns, 'gyms': gyms, 'cues': cues, 'opponents': opponents
    }, request)