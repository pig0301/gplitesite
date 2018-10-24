from django.core.paginator import Paginator
from snooker import models

from libs.functions import render_template
from libs import constants


def detail(request, campaign_id):
    campaign = models.campaign.objects.prefetch_related('campaign_frame').annotate(
        **models.DEFAULT_CAMPAIGN_ANNOTATE).get(id=campaign_id)

    return render_template("snooker/campaign/detail.html", {'campaign': campaign}, request)

def index(request):
    finished_campaigns = models.campaign.objects.prefetch_related('campaign_frame').annotate(
        **models.DEFAULT_CAMPAIGN_ANNOTATE).filter(is_finished='1').order_by('-id')
    
    unfinished_campaigns = models.campaign.objects.prefetch_related('campaign_frame').annotate(
        **models.DEFAULT_CAMPAIGN_ANNOTATE).filter(is_finished='0').order_by('-id')
        
    paginator = Paginator(finished_campaigns, constants.CAMPAIGN_LIST_COUNT_PER_PAGE)
    
    page = request.GET.get('p', '1')
    if not page.isdigit() or int(page) < 1 or int(page) > paginator.num_pages:
        page = 1
    else:
        page = int(page)
    
    return render_template("snooker/campaign/index.html", {
        'finished_campaigns': paginator.get_page(page), 'unfinished_campaigns': unfinished_campaigns
    }, request)