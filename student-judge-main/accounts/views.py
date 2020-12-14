

# Create your views here.
from multiprocessing import connection

from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render,redirect
from django.contrib.auth.models import User,Group
from .decorators import unauthenticated_user, admin_only, students_only, teachers_only


def userprofile(request):
    return render(request, "user_profile.html")


def logoutUser(request):
    logout(request)
    return redirect('index')


@unauthenticated_user
def loginPage(request):
    if request.method=='POST':
        username=request.POST.get('username')
        password=request.POST.get('password')
        user=authenticate(request,username=username,password=password)
        if user is not None:
            login(request,user)
            return redirect('index')
        else:
            messages.success(request,"Invalid username or password")
            return redirect('login_url')

    return  render(request,'registration/login.html')


@unauthenticated_user
def register(request):
    if request.method=="POST":
        first_name=request.POST['first_name']
        last_name=request.POST['last_name']
        username=request.POST['username']
        password1=request.POST['password1']
        password2=request.POST['password2']
        email=request.POST['email']

        if password2==password1:
            if len(password2)<8 or len(password2)>150:
                messages.success(request,"Password length must be between 8 and 150")
                return redirect("register_url")

            elif User.objects.filter(username=username).exists():
                messages.success(request,"Username already taken")
                return redirect("register_url")

            elif User.objects.filter(email=email).exists():
                messages.success(request,"Email already taken")
                return redirect("register_url")

            else:
                user=User.objects.create_user(username=username, password=password1,email=email,first_name=first_name,last_name=last_name)
                user.save()
                group= Group.objects.get(name='students')
                user.groups.add(group)
                messages.success(request,"Account Created!!!")
                return redirect("register_url")
        else:
            messages.success(request,"Password not matching...")
            return redirect("register_url")
    else:
        return render(request,"registration/register.html")

