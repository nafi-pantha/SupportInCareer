from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse
from exam.allViews import UserInfoView

# Create your views here.
def index(request):
    return render(request,'exam/onlineExam.html',{})
