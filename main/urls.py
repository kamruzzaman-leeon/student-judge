from django.urls import path
from . import views

urlpatterns = [

    path('', views.index, name='index'),

    path('about', views.about, name='about'),
    path('dashboard',views.dashboard, name='dashboard'),

    path('blog', views.blog, name='blog'),
    path('blog_detail/<int:id>', views.blog_detail, name='blog_detail'),
    path('teacherBlogSection',views.BlogSection,name='teacherBlogSection'),
    path('edit_blog/<int:id>', views.editBlog, name='edit_blog'),
    path('delete_blog/<str:id>', views.deleteBlog, name='delete_blog'),

    path('video', views.video, name='video'),
    path('teacherVideoSection',views.VideoSection,name='teacherVideoSection'),
    path('edit_video/<int:id>', views.editVideo, name='edit_video'),
    path('delete_video/<str:id>', views.deleteVideo, name='delete_video'),

]
