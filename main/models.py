from django.db import models
from django.template.defaultfilters import truncatechars
from django.utils.safestring import mark_safe
from embed_video.fields import EmbedVideoField



class About(models.Model):
    title = models.CharField(max_length=100, blank=False)
    description = models.TextField()
    image = models.ImageField(upload_to='about/', blank=False)
    Active = models.BooleanField(default=False)


    @property
    def short_description(self):
        return truncatechars(self.description, 30)

    def admin_about_image(self):
        return mark_safe('<img src="{}" width="100"/>'.format(self.image.url))

    admin_about_image.short_descripton = 'Image'
    admin_about_image.allow_tags = True

    def __str__(self):
        return self.title


class slide(models.Model):
    title = models.CharField(max_length=100, blank=False)
    description = models.TextField()
    image = models.ImageField(upload_to='slide/', blank=False)
    Active = models.BooleanField(default=False)

    @property
    def short_description(self):
        return truncatechars(self.description, 30)

    def adminslide(self):
        return mark_safe('<img src="{}" width="100"/>'.format(self.image.url))

    adminslide.short_descripton = 'Image'
    adminslide.allow_tags = True

    def __str__(self):
        return self.title


class Video(models.Model):

    title = models.CharField(max_length=100, blank=False)
    video = EmbedVideoField()
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
    subject = models.CharField(max_length=100, blank=False)
    chapter = models.CharField(max_length=100, blank=False,null=True)
    created = models.DateTimeField(auto_now=True, db_index=True)
    author = models.CharField(max_length=100,null=True)

    def __str__(self):
        return self.title



class Blog(models.Model):
    title = models.CharField(max_length=100, blank=False)
    blog = models.TextField(blank=False)
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
    subject = models.CharField(max_length=100, blank=False)
    chapter = models.CharField(max_length=100, blank=False,null=True)
    created = models.DateTimeField(auto_now=True, db_index=True)
    author = models.CharField(max_length=100,null=True)

    @property
    def short_description(self):
        return truncatechars(self.blog, 250)

    def __str__(self):
        return self.title
