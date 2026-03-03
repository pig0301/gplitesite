from django.contrib import admin
from snooker import models as snooker
from coding.spider import models as code


class SnookerGroupAdmin(admin.ModelAdmin):
    list_display = ('name', 'is_show')

class SnookerPlayerAdmin(admin.ModelAdmin):
    list_display = ('name', 'group')

class SnookerGymAdmin(admin.ModelAdmin):
    list_display = ('name', 'road')

class SnookerCueAdmin(admin.ModelAdmin):
    list_display = ('name', 'material', 'owner')

admin.site.register(snooker.group, SnookerGroupAdmin)
admin.site.register(snooker.player, SnookerPlayerAdmin)  
admin.site.register(snooker.gym, SnookerGymAdmin)
admin.site.register(snooker.cue, SnookerCueAdmin)


class CodingStrategyAdmin(admin.ModelAdmin):
    list_display = ('product_id', 'product_name', 'min_storage_cnt', 'adj_storage_cnt', 'adj_minutes')
    readonly_fields = ('product_id', 'product_name', 'spec')

admin.site.register(code.spider_product_strategy, CodingStrategyAdmin)