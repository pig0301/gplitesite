from django import template
import re


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