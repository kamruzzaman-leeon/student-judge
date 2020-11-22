from django.db import models
from embed_video.fields import EmbedVideoField


class About(models.Model):
    title = models.CharField(max_length=100, blank=False)
    description = models.TextField(max_length=1000, blank=False)
    image = models.ImageField(upload_to='about/', blank=False)

    def __str__(self):
        return self.title


class slide(models.Model):
    title = models.CharField(max_length=100, blank=False)
    description = models.TextField(max_length=1000, blank=False)
    image = models.ImageField(upload_to='slide/', blank=False)

    def __str__(self):
        return self.title


class Video(models.Model):
    title = models.CharField(max_length=100, blank=False)
    video = EmbedVideoField()
    class_choice = (
        ('', '---'),
        ('1', '1'),
        ('2', '2'),
        ('3', '3'),
        ('4', '4'),
        ('5', '5'),
        ('6', '6'),
        ('7', '7'),
        ('8', '8'),
        ('9', '9'),
        ('10', '10'),
        ('11', '11'),
        ('12', '12'),
    )
    Class = models.CharField(max_length=10, choices=class_choice, default=None)
    subject = models.CharField(max_length=100, blank=False)
    chapter = models.CharField(max_length=100, blank=False)
    created = models.DateTimeField(auto_now=True, db_index=True)
    author = models.CharField(max_length=100)

    def __str__(self):
        return self.title


class Blog(models.Model):
    title = models.CharField(max_length=100, blank=False)
    content = models.CharField(max_length=500)
    blog = models.TextField(blank=False)
    class_choice = (
        ('', '---'),
        ('1', '1'),
        ('2', '2'),
        ('3', '3'),
        ('4', '4'),
        ('5', '5'),
        ('6', '6'),
        ('7', '7'),
        ('8', '8'),
        ('9', '9'),
        ('10', '10'),
        ('11', '11'),
        ('12', '12'),
    )
    Class = models.CharField(max_length=10, choices=class_choice, default=None)
    subject = models.CharField(max_length=100, blank=False)
    chapter = models.CharField(max_length=100, blank=False)
    created = models.DateTimeField(auto_now=True, db_index=True)
    author = models.CharField(max_length=100)

    def __str__(self):
        return self.title
