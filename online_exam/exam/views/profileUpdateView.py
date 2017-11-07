from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse
from exam.models import UserInfo

def profileUpdate(request,pk):
    obj = get_object_or_404(UserInfo,pk=pk)

    return render(request,'exam/onlineExam.html',{'obj':obj})
