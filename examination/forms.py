from django import forms
from .models import Question

class QuestionForm(forms.ModelForm):
    title=forms.CharField(help_text='title of Question')
    subject=forms.CharField(help_text='Subject Name')
    chapter=forms.CharField(help_text='Insert Chapter Number/name',)
    question=forms.FileField(label='Exam Question')

    class Meta:
        model = Question
        fields = [
            'title','subject','instruction','question','Class','chapter','author']