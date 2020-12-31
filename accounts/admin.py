from django.contrib import admin
from .models import Profile


# Register your models here.


class Profile_Admin(admin.ModelAdmin):
    list_display = ['user', 'user_profile_image', 'specialist', 'isTeacher']
    list_filter = ['isTeacher']
    readonly_fields = ['user_profile_image']


admin.site.register(Profile, Profile_Admin)
