from django.conf.urls import url
from django.contrib import admin
from django.contrib.staticfiles.views import serve
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
    url(r'^media/(?P<path>.*)$', serve,{'document_root':       settings.MEDIA_ROOT}),
    url(r'^static/(?P<path>.*)$', serve,{'document_root': settings.STATIC_ROOT}),


]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
