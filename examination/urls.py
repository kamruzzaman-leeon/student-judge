from django.urls import path
from . import views

urlpatterns = [
     path('create_question',views.createQuestion, name='create_question'),
     path('edit_question/<int:id>', views.editQuestion, name='edit_question'),
     path('delete_question/<str:id>', views.deleteQuestion, name='delete_question'),
]