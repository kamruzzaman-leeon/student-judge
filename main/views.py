from django.shortcuts import render,redirect
from django.contrib import messages

from .models import *
from .forms import CreateUserForm

from django.contrib.auth import authenticate,login,logout

from django.contrib.auth.decorators import login_required

from .filters import BlogFilter,VideoFilter

def registerPage(request):
    if request.user.is_authenticated:
        return redirect('index')
    else:
        form =CreateUserForm()


        if request.method =='POST':
            form=CreateUserForm(request.POST)
            if form.is_valid():
                form.save()
                user = form.cleaned_data.get('username')
                messages.success(request,'Account was created for ' + user)

                return redirect('login')

        context={'form':form}
        return render(request,'main/register.html',context)


def loginPage(request):
    if request.user.is_authenticated:
        return redirect('login')
    else:
        if request.method =='POST':
            username=request.POST.get('username')
            password=request.POST.get('password')

            user =  authenticate(request, username=username,password=password)

            if user is not None:
                login(request, user)
                return redirect('index')
            else:
                messages.info(request,'Username OR Password is incorrect')

        context={}
        return render(request,'main/login.html',context)

def logoutUser(request):
    logout(request)
    return redirect('login')

@login_required(login_url='login')
def index(request):
    aboutdata = About.objects.all()[0]
    slidedata = slide.objects.all()
    context={
        'About': aboutdata,
        'slide': slidedata,

    }
    return render(request,"main/index.html",context)


@login_required(login_url='login')
def about(request):
    aboutdata = About.objects.all()[0]
    context = {
        'About': aboutdata
    }
    return render(request,"main/about.html",context)


# @login_required(login_url='login')
def video(request):
    videodata=Video.objects.all()
    myvideoFilter = VideoFilter(request.GET,queryset=videodata)
    videodata = myvideoFilter.qs
    context={
        'video':videodata,
        'myvideoFilter':myvideoFilter
    }
    return render(request,"main/video.html",context)


# @login_required(login_url='login')
def blog(request):
    blogdata=Blog.objects.all()
    myFilter = BlogFilter(request.GET,queryset=blogdata)
    blogdata=myFilter.qs
    context={
     'blog':blogdata,
     'myFilter': myFilter,
    }
    return render(request,"main/blog.html",context)


#@login_required(login_url='login')
def blog_detail(request,id):
    blogs = Blog.objects.get(id=id)
    return render(request,'main/blog_detail.html',{'blog':blogs})