from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.shortcuts import render, redirect

from .models import Question
from .forms import QuestionForm


@login_required
def createQuestion(request):
    question = Question.objects.filter(author= request.user.get_full_name())


    Question_painatior = Paginator(question,5)
    question_page_num = request.GET.get('questionpage')
    questionpage = Question_painatior.get_page(question_page_num)

    if request.method == 'POST':
        form = QuestionForm(request.POST,request.FILES)
        print(request.POST,request.FILES)
        if form.is_valid():
            form.save()
            return redirect('create_question')
    form = QuestionForm(initial={'author': request.user.get_full_name()})
    context = {
        'form': form,
        'questioncount': Question_painatior.count,
        'questionpage': questionpage,
    }
    return render(request, 'teacherUpload/create_question.html', context)


@login_required
def editQuestion(request, id):
    question = Question.objects.filter(id=id).first()
    form = QuestionForm(instance=question)
    if request.method == 'POST':
        form = QuestionForm(request.POST,request.FILES, instance=question)
        if form.is_valid():
            form.save()
            messages.success(request, 'Your Question was successfully updated!')
            return redirect('create_question')
    context = {
        'form': form,
        'questionid': id,
    }
    return render(request, 'teacherUpload/edit_question.html', context)


@login_required
def deleteQuestion(request, id):
    question = Question.objects.get(id=id)
    if request.method == 'POST':
        question.delete()
        messages.success(request, 'your question was successfully Delete!')
        return redirect('create_question')
    context = {'question': question}
    return render(request, 'teacherUpload/delete_question.html', context)
