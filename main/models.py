from django.db import models

class About(models.Model):
    title = models.CharField(max_length=100,blank=False)
    description = models.TextField(max_length=1000,blank=False)
    image=models.ImageField(upload_to='about/',blank=False)

    def __str__(self):
        return self.title


class slide(models.Model):
    title = models.CharField(max_length=100, blank=False)
    description = models.TextField(max_length=1000, blank=False)
    image = models.ImageField(upload_to='slide/', blank=False)

    def __str__(self):
        return self.title
