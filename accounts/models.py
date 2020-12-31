from django.db import models
from django.contrib.auth.models import User

# Create your models here.
from django.utils.safestring import mark_safe


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    ProfilePicture = models.ImageField(upload_to='user/', default='profilePicture/default.jpg', null=True)
    Institute = models.CharField(max_length=100, blank=True)
    isTeacher = models.BooleanField(default=False)

    class_choice = (
        ('1', '1'),
        ('2', '2'),
        ('3', '3'),
        ('4', '4'),
        ('5', '5'),
        ('6', '6'),
        ('7', '7'),
        ('J.S.C', 'J.S.C'),
        ('S.S.C', 'S.S.C'),
        ('H.S.C 1st', 'H.S.C 1st'),
        ('H.S.C 2nd', 'H.S.C 2nd'),
    )
    Class = models.CharField(max_length=10, choices=class_choice, blank=True, null=True,default='-----')
    Address = models.TextField(max_length=200, blank=True, null=True)
    ContactNumber = models.CharField(max_length=11, blank=True, null=True)
    specialist = models.CharField(max_length=50, blank=True, null=True)
    quota = models.TextField(max_length=500, blank=True, null=True)

    @property
    def user_profile_image(self):
        return mark_safe('<img src="{}" width="100"/>'.format(self.ProfilePicture.url))

    def __str__(self):
        return str(self.user.first_name + " " + self.user.last_name)