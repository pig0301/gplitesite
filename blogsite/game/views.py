from django.core.paginator import Paginator
from django.http import HttpResponse, HttpResponseRedirect
from django.utils import timezone

from libs.functions import render_template, check_login, check_java_client
from libs import constants
from game import models


def index(request):
    produces = models.cg_mp700_produce.objects.prefetch_related('produce_detail').annotate(
        **models.DEFAULT_PRODUCE_ANNOTATE).order_by("-id")

    paginator = Paginator(produces, constants.PRODUCE_LIST_COUNT_PER_PAGE)

    page = request.GET.get('p', '1')
    if not page.isdigit() or int(page) < 1 or int(page) > paginator.num_pages:
        page = 1
    else:
        page = int(page)
    
    status = models.cg_mp700_status.objects.get(id=1)

    return render_template("game/index.html", {'produces': paginator.get_page(page), 'status': status}, request)

def produce_start(request):
    if check_java_client(request):
        warehouse = request.GET['w']
        main_chef = request.GET['c']
        round1 = request.GET['r']
    
        produce = None
        detail = None
        details = models.cg_mp700_detail.objects.prefetch_related('produce').order_by("-id")
    
        if details.count() > 0:
            detail = details.first()
            produce = detail.produce
        
        if produce is None or detail.end_dttm is not None or produce.warehouse != warehouse or produce.main_chef != main_chef or int(round1) < detail.round or int(round1) - detail.round > 1:
            produce = models.cg_mp700_produce(warehouse=warehouse, main_chef=main_chef)
            produce.save()
        
        models.cg_mp700_detail.objects.filter(end_dttm=None).update(end_dttm=timezone.now())
        models.cg_mp700_prepare.objects.filter(warehouse=warehouse, is_ready='1').update(is_ready='0', last_used_dttm=timezone.now())
        
        status = models.cg_mp700_status.objects.get(id=1)
        status.current_errors = 0
        status.save()
    
        return HttpResponse(produce.id)
    else:
        return HttpResponse("非授权终端访问！")

def produce_finish(request, produce_id):
    if check_java_client(request):
        lastStep = finish_last_step(produce_id)
        
        status = models.cg_mp700_status.objects.get(id=1)
        status.finish_rounds = status.finish_rounds + 1
        status.save()
        
        return HttpResponse(lastStep.id)
    else:
        return HttpResponse("非授权终端访问！")

def produce_clear(request):
    if check_login(request):
        max_id = models.cg_mp700_produce.objects.order_by('-id').first().id - constants.PRODUCE_LIST_COUNT_PER_PAGE
        
        models.cg_mp700_detail.objects.filter(produce__id__lte=max_id).delete()
        models.cg_mp700_produce.objects.filter(id__lte=max_id).delete()
        
        return HttpResponseRedirect("/game/")
    else:
        return HttpResponse("非管理员用户禁止访问！")

def produce_detail_add(request, produce_id):
    if check_java_client(request):
        round1 = request.GET['r']
        step = request.GET['s']
       
        finish_last_step(produce_id)
       
        detail = models.cg_mp700_detail(produce_id=produce_id, round=round1, step=step, start_dttm=timezone.now())
        detail.save()
       
        return HttpResponse(detail.id)
    else:
        return HttpResponse("非授权终端访问！")

def produce_prepare(request):
    if check_login(request):
        prepares = list(models.cg_mp700_prepare.objects.order_by('id'))
        status = models.cg_mp700_status.objects.get(id=1)
        current = models.cg_mp700_detail.objects.prefetch_related('produce').order_by("-id").first().produce.warehouse

        i = 0
        while i < 9 and prepares[-1].warehouse != current:
            prepares.append(prepares[0])
            del prepares[0]
            i = i + 1

        return render_template("game/produce/prepare.html", {'prepares': prepares, 'status': status}, request)
    else:
        return HttpResponse("非管理员用户禁止访问！")

def produce_status_reconnect(request):
    if check_java_client(request):
        status = models.cg_mp700_status.objects.get(id=1)
        status.last_reconnect_dttm=timezone.now()
        status.save()
    
        return HttpResponse("success")
    else:
        return HttpResponse("非授权终端访问！")

def produce_status_reset(request):
    if check_login(request):
        status = models.cg_mp700_status.objects.get(id=1)
        status.finish_rounds = 0
        status.last_reset_dttm=timezone.now()
        status.save()
        
        return HttpResponseRedirect("/game/produce/prepare/")
    else:
        return HttpResponse("非管理员用户禁止访问！")

def produce_status_add_error(request):
    if check_java_client(request):
        status = models.cg_mp700_status.objects.get(id=1)
        status.current_errors = status.current_errors + 1
        status.save()
    
        return HttpResponse("success")
    else:
        return HttpResponse("非授权终端访问！")

def produce_prepare_update(request):
    if check_login(request):
        ids = request.POST.getlist('prepareIDs')
        models.cg_mp700_prepare.objects.filter(id__in=ids, is_ready='0').update(is_ready='1', last_ready_dttm=timezone.now())
        
        return HttpResponseRedirect("/game/produce/prepare/")
    else:
        return HttpResponse("非管理员用户禁止访问！")

def finish_last_step(produce_id):
    produce = models.cg_mp700_produce.objects.prefetch_related('produce_detail').get(id=produce_id)
    lastStep = produce.produce_detail.first()
   
    if lastStep is not None and lastStep.end_dttm is None:
        lastStep.end_dttm = timezone.now()
        lastStep.save()
   
    return lastStep