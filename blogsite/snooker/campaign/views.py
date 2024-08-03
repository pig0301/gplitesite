from django.core.paginator import Paginator
from django.http import HttpResponse, HttpResponseRedirect
from snooker import models

from libs.functions import render_template, check_login
from libs import constants


def detail(request, campaign_id):
    campaign = models.campaign.objects.prefetch_related('campaign_frame').annotate(
        **models.DEFAULT_CAMPAIGN_ANNOTATE).get(id=campaign_id)
    cues = models.cue.objects.order_by('id')

    return render_template("snooker/campaign/detail.html", {'campaign': campaign, 'cues': cues}, request)

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

def add_frame_confirm(request, campaign_id):
    if check_login(request):
        get_points = int(request.POST.get('get_points'))
        oppo_points = int(request.POST.get('oppo_points'))
        cue = models.cue.objects.get(id=int(request.POST.get('cue_id')))
        campaign = models.campaign.objects.get(id=campaign_id)
        let_points = int(request.POST.get('let_points'))
        max_break = request.POST.get('max_break')
        memo = request.POST.get('memo')
        is_win = '1' if get_points > oppo_points else '0'
        
        frame = models.frame(get_points=get_points, oppo_points=oppo_points, cue=cue, campaign=campaign, let_points=let_points, is_win=is_win, max_break=None, memo=None)
        
        if len(max_break.strip()) > 0:
            frame.max_break = int(max_break.strip())
        
        if len(memo.strip()) > 0:
            frame.memo = memo.strip()
        
        frame.save()

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
        
        frames = models.frame.objects.filter(campaign__id=campaign_id)
        frames.delete()

        return HttpResponseRedirect("/snooker/")
    else:
        return HttpResponse("非管理员用户禁止访问！")

def delete_last_frame(request, campaign_id):
    if check_login(request):
        frames = models.frame.objects.filter(campaign__id=campaign_id).order_by("-id")
        if frames.count() > 0:
            frames.first().delete()

        return HttpResponseRedirect("/snooker/campaign/{0}/".format(campaign_id))
    else:
        return HttpResponse("非管理员用户禁止访问！")