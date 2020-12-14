from django.contrib import admin

from .models import *

from embed_video.admin import AdminVideoMixin


class MyModelAdmin(AdminVideoMixin, admin.ModelAdmin):
    pass


admin.site.register(Video, MyModelAdmin)

admin.site.register(About)
admin.site.register(slide)
admin.site.register(Blog)