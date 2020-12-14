from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

urlpatterns = [

    path('', views.index, name='index'),

    path('about', views.about, name='about'),
    path('video', views.video, name='video'),
    path('teachers', views.teachers, name='teachers'),
    path('examination', views.examination, name='examination'),
    path('admin', views.examination, name='admin_panel'),

    path('blog', views.blog, name='blog'),
    path('blog_detail/<int:id>', views.blog_detail, name='blog_detail'),
]
