from django import forms
from django.contrib.auth import authenticate, get_user_model
from .models import *

User = get_user_model()


class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)

    def clean(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')

        if username and password:
            user = authenticate(username=username, password=password)
            if not user:
                FaultUser = User.objects.filter(username=username)
                if not FaultUser:
                    raise forms.ValidationError('USER DOES NOT EXIST!')
                if not FaultUser.first().check_password(password):
                    raise forms.ValidationError('INCORRECT PASSWORD')
                if not FaultUser.first().is_active:
                    raise forms.ValidationError('User access denied.Please wait until approval')
        return super(LoginForm, self).clean()


class RegistrationForm(forms.ModelForm):
    first_name = forms.CharField(label='First name')
    last_name = forms.CharField(label='last name')
    email = forms.EmailField(label='Email')
    password1 = forms.CharField(widget=forms.PasswordInput)
    password2 = forms.CharField(widget=forms.PasswordInput,
                                help_text="Enter the same password as above,for verification.")
    role_choice = (
        ('1', 'Student'),
        ('2', 'Teacher'),
    )
    role = forms.ChoiceField(choices=role_choice)

    class Meta:
        model = User
        fields = [
            'first_name',
            'last_name',
            'username',
            'email',
            'password1',
            'password2'
        ]

    def clean(self):
        email = self.cleaned_data.get('email')
        username = self.cleaned_data.get('username')
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("password1 and password2 mismatch!")
        username_qs = User.objects.filter(username=username)
        if username_qs.exists():
            raise forms.ValidationError("UserName has already been registered")
        email_qs = User.objects.filter(email=email)
        if email_qs.exists():
            raise forms.ValidationError(
                "Email has already been registered")
        return super(RegistrationForm, self).clean()


class CreatestudentProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['ProfilePicture', 'Institute', 'Class', 'Address', 'ContactNumber']


class CreateteacherProfileForm(forms.ModelForm):

    class Meta:
        model = Profile
        fields = ['ProfilePicture', 'Address', 'ContactNumber', 'specialist', 'quota']



class UserInfoForm(forms.ModelForm):
    class Meta:
        model=User
        fields=['first_name','last_name']

