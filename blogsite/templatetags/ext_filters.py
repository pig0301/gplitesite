from django import template
import re

from datetime import timedelta


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
    if step == 1:
        return "开箱"
    elif step == 2:
        return "整理"
    elif step == 3:
        return "制作"
    else:
        return ""
    
@register.filter
def time_delta(delta):
    return timedelta(delta.days, delta.seconds, 0)

@register.filter
def time_diff(time1, time2):
    if time1 is not None and time2 is not None:
        return time_delta(time1 - time2)
    else:
        return ""