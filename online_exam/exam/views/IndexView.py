from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse
from django.views.generic import (TemplateView,ListView,
DetailView,CreateView,UpdateView,DeleteView)

def index(TemplateView):
    template_name= 'onlineExam.html'
