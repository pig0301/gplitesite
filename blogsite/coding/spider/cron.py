from libs import constants
from coding.spider.tasks import query_storage


def query_storage_as_normal():
    query_storage.delay(constants.NORMAL_MODE)


def query_storage_with_clean():
    query_storage.delay(constants.CLEAN_MODE)


def query_storage_with_save():
    query_storage.delay(constants.SAVE_MODE)