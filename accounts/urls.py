from . import views
from django.contrib.auth import views as auth_views
from django.urls import path

urlpatterns = [

    path('logout', views.logout_view, name='logout'),
    path('registration', views.RegisterView, name='registration'),
    path('login', views.LoginView, name='login'),
    path('profile', views.UpdateProfile, name='profile'),
    path('activate/<uidb64>/<token>', views.activate, name='activate'),

    path('reset_password/', auth_views.PasswordResetView.as_view(template_name='reset-password/password_reset.html'),
         name='reset_password'),

    path('reset_password_sent/',
         auth_views.PasswordResetDoneView.as_view(template_name="reset-password/password_reset_sent.html"),
         name='password_reset_done'),

    path('reset/<uidb64>/<token>/',
         auth_views.PasswordResetConfirmView.as_view(template_name="reset-password/password_reset_form.html"),
         name='password_reset_confirm'),

    path('reset_password_complete/',
         auth_views.PasswordResetCompleteView.as_view(template_name="reset-password/password_reset_done.html"),
         name='password_reset_complete'),

    path('change_password', views.change_password, name='change_password'),

]
