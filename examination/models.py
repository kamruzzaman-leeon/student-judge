from django.db import models
from django.template.defaultfilters import truncatechars


class Question(models.Model):
    title = models.CharField(max_length=100, blank=False)
    instruction = models.TextField(blank=True,null=True)
    question=models.FileField(upload_to='question/',blank=False,null=False)
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
    chapter = models.CharField(max_length=100, blank=True,null=True)
    created = models.DateTimeField(auto_now=True, db_index=True)
    author = models.CharField(max_length=100,null=True)

    @property
    def short_description(self):
        return truncatechars(self.instruction, 250)

    def __str__(self):
        return self.title