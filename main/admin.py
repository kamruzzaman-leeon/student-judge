from django.contrib import admin

from .models import *
from embed_video.admin import AdminVideoMixin


class MyModelAdmin(AdminVideoMixin, admin.ModelAdmin):
    list_display = ["title","video", "Class", "subject", "chapter", "author","created"]
    list_filter = ['author','Class','subject']




admin.site.register(Video, MyModelAdmin)


class BlogAdmin(admin.ModelAdmin):
    list_display = ["title",'short_description',"Class","subject","chapter","author","created"]
    list_filter = ['author','Class','subject']

class SlideAdmin(admin.ModelAdmin):
    list_display = ["title","description","adminslide",'Active']
    readonly_fields = ['adminslide']

class AboutAdmin(admin.ModelAdmin):
    fields = ['title', 'description', 'image','admin_about_image','Active']
    list_display = ['title','short_description','admin_about_image','Active']
    readonly_fields = ['admin_about_image']


admin.site.register(About,AboutAdmin)
admin.site.register(slide,SlideAdmin)
admin.site.register(Blog,BlogAdmin)