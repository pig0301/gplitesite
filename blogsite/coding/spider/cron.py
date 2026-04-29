from libs import constants
from coding.spider.tasks import query_storage

import django_rq


icbc_queue = django_rq.get_queue('icbc_worker')


def query_storage_as_normal():
    icbc_queue.enqueue(query_storage, constants.NORMAL_MODE, result_ttl=86400)


def query_storage_with_clean():
    icbc_queue.enqueue(query_storage, constants.CLEAN_MODE, result_ttl=86400)


def query_storage_with_save():
    icbc_queue.enqueue(query_storage, constants.SAVE_MODE, result_ttl=86400)