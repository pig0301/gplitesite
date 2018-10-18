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