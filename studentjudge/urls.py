from django.contrib import admin
from django.urls import path,include

from django.conf.urls.static import static
from django.conf import settings

admin.site.site_header='Student Judge'
admin.site.site_title= 'Admin Panel'
admin.site.index_title='Student Judge administration'
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',include('main.urls')),
    path('',include('accounts.urls')),
    path('', include('examination.urls')),



]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
