from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.shortcuts import render, redirect

from accounts.models import Profile
from .filters import BlogFilter, VideoFilter
from .form import VideoForm, BlogForm
from .models import *


def index(request):
    aboutdata = About.objects.first()
    slidedata = slide.objects.all()
    teachercount = Profile.objects.filter(isTeacher=True).count()
    studentcount = Profile.objects.filter(isTeacher=False).count()
    videocount = Video.objects.count()
    blogcount = Blog.objects.count()
    teacherdata = Profile.objects.filter(isTeacher=True)

    context = {
        'About': aboutdata,
        'slide': slidedata,
        'teachercount': teachercount,
        'Studentcount': studentcount,
        'videocount': videocount,
        'blogcount': blogcount,
        'teacherdata': teacherdata,

    }
    return render(request, "main/index.html", context)


def about(request):
    aboutdata = About.objects.first()
    context = {
        'About': aboutdata
    }
    return render(request, "main/about.html", context)


def video(request):
    videodata = Video.objects.all()
    myvideoFilter = VideoFilter(request.GET, queryset=videodata)
    videodata = myvideoFilter.qs
    context = {
        'video': videodata,
        'myvideoFilter': myvideoFilter
    }
    return render(request, "main/video.html", context)


def blog(request):
    blogdata = Blog.objects.all()
    myFilter = BlogFilter(request.GET, queryset=blogdata)
    blogdata = myFilter.qs
    context = {
        'blog': blogdata,
        'myFilter': myFilter,
    }
    return render(request, "main/blog.html", context)


def blog_detail(request, id):
    blogs = Blog.objects.get(id=id)
    return render(request, 'main/blog_detail.html', {'blog': blogs})

@login_required
def dashboard(request):
    return render(request, 'auth/dash_Board.html')

@login_required
def VideoSection(request):
    userVideo = Video.objects.filter(author=request.user.get_full_name())
    form = VideoForm(initial={'author': request.user.get_full_name()})

    userVideo_paginator = Paginator(userVideo, 5)
    video_page_num = request.GET.get('videopage')
    videopage = userVideo_paginator.get_page(video_page_num)

    if request.method == 'POST':
        form = VideoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('teacherVideoSection')
    context = {
        'form': form,
        'videocount': userVideo_paginator.count,
        'videopage': videopage,

    }
    return render(request, 'teacherUpload/teacherVideoSection.html', context)

@login_required
def editVideo(request, id):
    video = Video.objects.filter(id=id).first()
    form = VideoForm(instance=video)
    if request.method == 'POST':
        form = VideoForm(request.POST, instance=video)
        if form.is_valid():
            form.save()
            messages.success(request, 'Your Video data was successfully updated!')
            return redirect('teacherVideoSection')
    context = {
        'form': form,
        'videoid': id,

    }
    return render(request, 'teacherUpload/edit_video.html', context)

@login_required
def deleteVideo(request, id):
    video = Video.objects.get(id=id)
    if request.method == 'POST':
        video.delete()
        messages.success(request, 'your video data was successfully Delete!')
        return redirect('teacherVideoSection')
    context = {'video': video}
    return render(request, 'teacherUpload/delete_video.html', context)

@login_required
def BlogSection(request):
    userBlog = Blog.objects.filter(author=request.user.get_full_name())
    form = BlogForm(initial={'author': request.user.get_full_name()})

    userBlog_paginator = Paginator(userBlog, 5)
    blog_page_num = request.GET.get('blogpage')
    blogpage = userBlog_paginator.get_page(blog_page_num)

    if request.method == 'POST':
        form = BlogForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('teacherBlogSection')
    context = {
        'form': form,
        'blogcount': userBlog_paginator.count,
        'blogpage': blogpage,
    }
    return render(request, 'teacherUpload/teacherBlogSection.html', context)

@login_required
def editBlog(request, id):
    blog = Blog.objects.filter(id=id).first()
    form = BlogForm(instance=blog)
    if request.method == 'POST':
        form = BlogForm(request.POST, instance=blog)
        if form.is_valid():
            form.save()
            messages.success(request, 'Your Blog data was successfully updated!')
            return redirect('teacherBlogSection')
    context = {
        'form': form,
        'blogid': id,

    }
    return render(request, 'teacherUpload/edit_blog.html', context)

@login_required
def deleteBlog(request, id):
    blog = Blog.objects.get(id=id)
    if request.method == 'POST':
        blog.delete()
        messages.success(request, 'your Blog data was successfully Delete!')
        return redirect('teacherBlogSection')
    context = {'blog': blog}
    return render(request, 'teacherUpload/delete_blog.html', context)

