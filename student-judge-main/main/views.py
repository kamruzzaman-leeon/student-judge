from django.shortcuts import render,redirect

from .models import *

from accounts.decorators import unauthenticated_user, admin_only, students_only, teachers_only
from .filters import BlogFilter,VideoFilter

def index(request):
    aboutdata = About.objects.all()[0]
    slidedata = slide.objects.all()
    context={
        'About': aboutdata,
        'slide': slidedata,
    }
    return render(request,"main/index.html",context)


def about(request):
    aboutdata = About.objects.all()[0]
    context = {
        'About': aboutdata
    }
    return render(request,"main/about.html",context)

def video(request):
    videodata=Video.objects.all()
    myvideoFilter = VideoFilter(request.GET,queryset=videodata)
    videodata = myvideoFilter.qs
    context={
        'video':videodata,
        'myvideoFilter':myvideoFilter
    }
    return render(request,"main/video.html",context)

def blog(request):
    blogdata=Blog.objects.all()
    myFilter = BlogFilter(request.GET,queryset=blogdata)
    blogdata=myFilter.qs
    context={
     'blog':blogdata,
     'myFilter': myFilter,
    }
    return render(request,"main/blog.html",context)

def blog_detail(request,id):
    blogs = Blog.objects.get(id=id)
    return render(request,'main/blog_detail.html',{'blog':blogs})

@teachers_only
def teachers(request):
    return render(request,'main/teachers.html')

@students_only
def examination(request):
    return render(request,'main/examination.html')

@admin_only
def admin_panel(request):
    return render(request,'http://127.0.0.1:8000/admin')
