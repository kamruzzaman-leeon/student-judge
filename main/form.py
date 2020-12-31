from django import forms
from .models import *


class VideoForm(forms.ModelForm):
    title=forms.CharField(help_text='title of Video',widget=forms.TextInput)
    video=forms.URLField(help_text='link of video',widget=forms.URLInput)
    subject=forms.CharField(help_text='Subject Name',widget=forms.TextInput)
    chapter=forms.CharField(help_text='Insert Chapter Number/name',widget=forms.TextInput)

    class Meta:
        model = Video
        fields = '__all__'

class BlogForm(forms.ModelForm):
    title=forms.CharField(help_text='title of Blog',widget=forms.TextInput)
    blog=forms.CharField(help_text='Blog',widget=forms.Textarea)
    subject=forms.CharField(help_text='Subject Name',widget=forms.TextInput)
    chapter=forms.CharField(help_text='Insert Chapter Number/name',widget=forms.TextInput)

    class Meta:
        model = Blog
        fields = '__all__'