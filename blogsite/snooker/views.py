from django.shortcuts import render
from django.http import JsonResponse
from django.db.models import Count, Avg, Max, Q

from snooker import models
from libs import constants


def index(request):
    campaigns = models.campaign.objects.prefetch_related('campaign_frame').annotate(
        **models.DEFAULT_CAMPAIGN_ANNOTATE
    ).order_by('is_finished', '-id')[0:constants.RECENT_CAMPAIGN_COUNT]
    
    gyms = models.gym.objects.order_by('-id')
    cues = models.cue.objects.order_by('id')
    opponents = models.player.objects.filter(group__is_show='1').order_by('-id')

    return render(request, "snooker/index.html", {
        'campaigns': campaigns, 'gyms': gyms, 'cues': cues, 'opponents': opponents
    })


def analytics(request):
    is_ajax = request.headers.get('x-requested-with') == 'XMLHttpRequest' or request.GET.get('ajax') == '1'

    if is_ajax:
        start_date = request.GET.get('start_date', '')
        end_date = request.GET.get('end_date', '')

        base_qs = models.frame.objects.all()
        if start_date:
            base_qs = base_qs.filter(campaign__event_dt__gte=start_date)
        if end_date:
            base_qs = base_qs.filter(campaign__event_dt__lte=end_date)

        overall = base_qs.aggregate(
            total_frames=Count('id'),
            win_frames=Count('id', filter=Q(is_win='1')),
            avg_get=Avg('get_points'),
            avg_oppo=Avg('oppo_points'),
            highest_break=Max('max_break'),
            break_30_plus=Count('id', filter=Q(max_break__gte=30, max_break__lt=40)),
            break_40_plus=Count('id', filter=Q(max_break__gte=40, max_break__lt=50)),
            break_50_plus=Count('id', filter=Q(max_break__gte=50)),
        )

        total_f = overall['total_frames'] or 0
        win_f = overall['win_frames'] or 0
        win_rate = round((win_f / total_f * 100), 1) if total_f > 0 else 0

        overall_data = {
            'total_frames': total_f,
            'win_frames': win_f,
            'win_rate': win_rate,
            'avg_get': round(overall['avg_get'] or 0, 1),
            'avg_oppo': round(overall['avg_oppo'] or 0, 1),
            'highest_break': overall['highest_break'] or 0,
            'break_30_plus': overall['break_30_plus'] or 0,
            'break_40_plus': overall['break_40_plus'] or 0,
            'break_50_plus': overall['break_50_plus'] or 0,
        }

        opponent_stats = list(
            base_qs.values('opponent__id', 'opponent__name', 'opponent__group__name')
            .annotate(
                total_frames=Count('id'),
                win_frames=Count('id', filter=Q(is_win='1')),
                avg_get=Avg('get_points'),
                avg_oppo=Avg('oppo_points'),
                highest_break=Max('max_break'),
            )
        )
        for item in opponent_stats:
            t = item['total_frames']
            w = item['win_frames']
            item['win_rate'] = round((w / t * 100), 1) if t > 0 else 0
            item['diff_points'] = round((item['avg_get'] or 0) - (item['avg_oppo'] or 0), 1)
            item['highest_break'] = item['highest_break'] or 0
        opponent_stats.sort(key=lambda x: x['total_frames'], reverse=True)

        cue_stats = list(
            base_qs.values('cue__id', 'cue__name', 'cue__material')
            .annotate(
                total_frames=Count('id'),
                win_frames=Count('id', filter=Q(is_win='1')),
                avg_get=Avg('get_points'),
                highest_break=Max('max_break'),
                break_30_plus=Count('id', filter=Q(max_break__gte=30)),
            )
        )
        for item in cue_stats:
            t = item['total_frames']
            w = item['win_frames']
            item['win_rate'] = round((w / t * 100), 1) if t > 0 else 0
        cue_stats.sort(key=lambda x: x['total_frames'], reverse=True)

        gym_stats = list(
            base_qs.values('campaign__gym__id', 'campaign__gym__name', 'campaign__gym__road')
            .annotate(
                total_frames=Count('id'),
                win_frames=Count('id', filter=Q(is_win='1')),
                avg_get=Avg('get_points'),
                avg_oppo=Avg('oppo_points'),
                highest_break=Max('max_break'),
            )
        )
        for item in gym_stats:
            t = item['total_frames']
            w = item['win_frames']
            item['win_rate'] = round((w / t * 100), 1) if t > 0 else 0
            item['diff_points'] = round((item['avg_get'] or 0) - (item['avg_oppo'] or 0), 1)
        gym_stats.sort(key=lambda x: x['total_frames'], reverse=True)

        return JsonResponse({
            'overall': overall_data,
            'opponent_stats': opponent_stats,
            'cue_stats': cue_stats,
            'gym_stats': gym_stats,
        })

    return render(request, 'snooker/analytics.html')