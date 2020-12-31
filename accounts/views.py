from django.conf import settings
from django.contrib import messages
from django.contrib.auth import login, logout, update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm, UserModel
from django.contrib.auth.tokens import default_token_generator
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import send_mail
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.template.loader import render_to_string
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode

from .forms import *
from .models import Profile


def LoginView(request):
    if request.user.is_authenticated:
        return redirect('dashboard')
    next = request.GET.get('next')
    form = LoginForm(request.POST or None)
    if form.is_valid():
        username = form.cleaned_data.get('username')
        password = form.cleaned_data.get('password')
        user = authenticate(username=username, password=password)
        login(request, user)
        if next:
            return redirect(next)
        messages.success(request, 'You are successfully login!')
        return redirect('dashboard')
    context = {
        'form': form,
    }
    return render(request, 'auth/login.html', context)


def RegisterView(request):
    if request.user.is_authenticated:
        return redirect('/index.html')
    next = request.GET.get('next')
    form = RegistrationForm(request.POST or None)
    if form.is_valid():
        user = form.save()
        user.is_active = False
        temp = int(form.cleaned_data.get('role'))
        username = form.cleaned_data.get('username')
        password1 = form.cleaned_data.get('password1')
        password2 = form.cleaned_data.get('password2')
        user.set_password(password1)
        email = form.cleaned_data.get('email')

        user.is_active = False

        if temp == 2:
            Profile.objects.create(user=user, isTeacher=True)
        else:
            Profile.objects.create(user=user)
        user.save()
        current_site = get_current_site(request)

        record_mail = [email]
        send_mail(
            subject="Welcome to Student-Judge",
            message=str('Hello!' + username),
            from_email=getattr(settings, "EMAIL_HOST_USER"),
            recipient_list=record_mail,
            fail_silently=True,
            html_message=render_to_string('mail/mail_body.html',
                                          {
                                              'user': user.get_full_name(),
                                              'domain': current_site.domain,
                                              'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                                              'token': default_token_generator.make_token(user),
                                          })

        )
        context = {
            'username': user.get_full_name(),
            'email': email,
        }
        return render(request, 'auth/verification.html', context)
    else:
        form = RegistrationForm()
    return render(request, "auth/registration.html", {'form': form})


def logout_view(request):
    logout(request)
    return redirect('/')


@login_required
def UpdateProfile(request):
    if request.user.profile.isTeacher:
        form = CreateteacherProfileForm
    else:
        form = CreatestudentProfileForm

    profile_object = request.user.profile
    form2=UserInfoForm(initial={'first_name': request.user.first_name, 'last_name': request.user.last_name})
    if request.method == "POST":
        form2=UserInfoForm(request.POST,instance=request.user)
        form = form(request.POST, request.FILES, instance=profile_object)
        if form.is_valid() and form2.is_valid():
            form2.save()
            profile = form.save(commit=False)
            profile.save()
            messages.success(request, 'Your Profile was successfully updated!')
            return render(request, "auth/createprofile.html", {'form': form,'form2':form2})
    context = {

        'form': form(instance=profile_object),
        'form2':form2,

    }
    return render(request, "auth/createprofile.html", context)





def activate(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = UserModel._default_manager.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and default_token_generator.check_token(user, token):
        user.is_active = True
        user.save()
        context = {
            'username': user.get_full_name(),
        }
        return render(request, 'auth/verification_success.html', context)
    else:
        return HttpResponse('Activation link is invalid!')


def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            messages.success(request, 'Your password was successfully updated!')
            return redirect('profile')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'auth/change_password.html', {'form': form})
