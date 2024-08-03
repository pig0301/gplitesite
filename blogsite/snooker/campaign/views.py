from django.core.paginator import Paginator
from django.http import HttpResponse, HttpResponseRedirect
from snooker import models

from libs.functions import render_template, check_login
from libs import constants


def detail(request, campaign_id):
    campaign = models.campaign.objects.prefetch_related('campaign_frame').annotate(
        **models.DEFAULT_CAMPAIGN_ANNOTATE).get(id=campaign_id)

    return render_template("snooker/campaign/detail.html", {'campaign': campaign}, request)

def index(request):
    campaigns = models.campaign.objects.prefetch_related('campaign_frame').annotate(
        **models.DEFAULT_CAMPAIGN_ANNOTATE).order_by('is_finished', '-id')
        
    paginator = Paginator(campaigns, constants.CAMPAIGN_LIST_COUNT_PER_PAGE)
    
    page = request.GET.get('p', '1')
    if not page.isdigit() or int(page) < 1 or int(page) > paginator.num_pages:
        page = 1
    else:
        page = int(page)
    
    return render_template("snooker/campaign/index.html", {
        'campaigns': paginator.get_page(page)
    }, request)

def add_confirm(request):
    if check_login(request):
        event_dt = request.POST.get('event_dt')
        gym = models.gym.objects.get(id=int(request.POST.get('gym_id')))
        cue = models.cue.objects.get(id=int(request.POST.get('cue_id')))
        opponent = models.player.objects.get(id=int(request.POST.get('opponent_id')))
        let_points = int(request.POST.get('let_points'))
        
        campaign = models.campaign(event_dt=event_dt, gym=gym, cue=cue, opponent=opponent, let_points=let_points, is_finished='0')
        campaign.save()

        return HttpResponseRedirect("/snooker/campaign/{0}/".format(campaign.id))
    else:
        return HttpResponse("非管理员用户禁止访问！")

def finish(request, campaign_id):
    if check_login(request):
        campaign = models.campaign.objects.get(id=campaign_id)
        campaign.is_finished = '1'
        campaign.save()

        return HttpResponseRedirect("/snooker/campaign/{0}/".format(campaign.id))
    else:
        return HttpResponse("非管理员用户禁止访问！")

def delete(request, campaign_id):
    if check_login(request):
        campaign = models.campaign.objects.get(id=campaign_id)
        campaign.delete()

        return HttpResponseRedirect("/snooker/")
    else:
        return HttpResponse("非管理员用户禁止访问！")