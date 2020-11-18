from django.shortcuts import render
from .models import About, slide

def index(request):
    aboutdata = About.objects.all()[0]
    slidedata = slide.objects.all()
    context={
        'About': aboutdata,
        'slide': slidedata,

    }
    return render(request,"main/index.html",context)

def about(request):
    aboutdata = About.objects.all()[0]
    context = {
        'About': aboutdata
    }
    return render(request,"main/about.html",context)
