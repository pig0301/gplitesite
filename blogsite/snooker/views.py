from snooker import models

from libs.functions import render_template
from libs import constants


def index(request):
    campaigns = models.campaign.objects.prefetch_related('campaign_frame').annotate(
        **models.DEFAULT_CAMPAIGN_ANNOTATE
    ).filter(is_finished='1').order_by('-id')[0:constants.RECENT_CAMPAIGN_COUNT]

    return render_template("snooker/index.html", {'campaigns': campaigns}, request)