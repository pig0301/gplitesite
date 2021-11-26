from django.http import HttpResponse
from django.utils import timezone
from libs.functions import render_template

from game import models

def index(request):
    produces = models.cg_mp700_produce.objects.prefetch_related('produce_detail').order_by("-id")
    return render_template("game/index.html", {'produces': produces}, request)

def produce_start(request):
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

    return HttpResponse(produce.id)

def produce_finish(request, produce_id):
    lastStep = finish_last_step(produce_id)
   
    return HttpResponse(lastStep.id)

def produce_detail_add(request, produce_id):
    round1 = request.GET['r']
    step = request.GET['s']
   
    finish_last_step(produce_id)
   
    detail = models.cg_mp700_detail(produce_id=produce_id, round=round1, step=step, start_dttm=timezone.now())
    detail.save()
   
    return HttpResponse(detail.id)

def finish_last_step(produce_id):
    produce = models.cg_mp700_produce.objects.prefetch_related('produce_detail').get(id=produce_id)
    lastStep = produce.produce_detail.last()
   
    if lastStep is not None and lastStep.end_dttm is None:
        lastStep.end_dttm = timezone.now()
        lastStep.save()
   
    return lastStep