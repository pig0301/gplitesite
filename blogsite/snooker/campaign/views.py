from snooker import models

from libs.functions import render_template


def detail(request, campaign_id):
    campaign = models.campaign.objects.annotate(
        **models.DEFAULT_CAMPAIGN_ANNOTATE
    ).get(id=campaign_id)

    return render_template("snooker/campaign/detail.html", {'campaign': campaign}, request)