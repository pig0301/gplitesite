from django.contrib import admin
from snooker import models as snooker


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