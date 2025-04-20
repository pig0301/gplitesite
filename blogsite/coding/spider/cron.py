import os, django

from django.utils import timezone

from home import models as models_home
from libs import constants

from coding.spider import models as models_code
from coding.spider import views as views_code

from django.conf import settings





def query_storage(mode=constants.NORMAL_MODE):
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "gplitesite.settings")
    django.setup()
    
    dttm = timezone.now()
#     msg_level = models_home.message_level.objects.get(id=1)
#     
#     if mode == constants.CLEAN_MODE:
#         models_code.spider_product_storage.objects.filter(event_dt__lt=dttm.date()).delete()
#     
#     views_code.get_product_details(['9003867817'], msg_level, dttm, True)

    print('[{0}] -> {1}'.format(dttm, mode))
    print(settings.DATABASES['default'])


def query_storage_with_clean():
    query_storage(mode=constants.CLEAN_MODE)


def query_storage_with_save():
    query_storage(mode=constants.SAVE_MODE)