from django import template
import re

from datetime import timedelta
from libs import constants


register = template.Library()

@register.filter
def default_title(url):
    pattern = re.compile(r'^/([^/]+)')
    match = pattern.match(url)

    if match is None:
        return 'Home'
    else:
        return match.group(1).capitalize()
    
@register.filter
def ml_step_desc(step):
    return constants.ML_STEP_DESC_DICT[step]
    
@register.filter
def time_delta(delta):
    return timedelta(delta.days, delta.seconds, 0)

@register.filter
def time_diff(time1, time2):
    if time1 is not None and time2 is not None:
        return time_delta(time1 - time2)
    else:
        return ""

@register.filter
def date_diff(time1, time2):
    if time1 is not None and time2 is not None:
        return (time1.date() - time2.date()).days
    else:
        return 0

@register.filter
def show_guest(word, is_login):
    if len(word) >= 3 and not is_login:
        return word[0] + '.' * 3 + word[-1]
    else:
        return word

@register.filter
def price_diff(icbc_price, oth_price):
    diff = oth_price - icbc_price
    if diff > 0:
        return '↑{0:.2f}'.format(diff)
    elif diff < 0:
        return '↓{0:.2f}'.format(-diff)
    else:
        return '~0.00'

@register.filter
def subtract(value, arg):
    return value - arg