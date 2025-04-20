from django.utils import timezone

from home import models as models_home
from libs import constants

import argparse

from coding.spider import models as models_code
from coding.spider import views as views_code


def query_storage(*args):
    parser = argparse.ArgumentParser()
    parser.add_argument('--mode', type=int, help='Mode Parameter')
    parsed_args = parser.parse_args(args)

    dttm = timezone.now()
#     msg_level = models_home.message_level.objects.get(id=1)
#     
#     if parsed_args.mode == constants.CLEAN_MODE:
#         models_code.spider_product_storage.objects.filter(event_dt__lt=dttm.date()).delete()
#     
#     views_code.get_product_details(['9003867817'], msg_level, dttm, True)

    print('{0}: {1}'.format(dttm, parsed_args.mode))