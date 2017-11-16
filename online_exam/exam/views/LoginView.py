from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse
import datetime
from exam.models import UserInfo
from django.contrib.auth.models import User
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages

def userLogin(request):
    if(request.method =="POST"):
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(username=username,password=password)

        if(user):
            if(user.is_active and user.is_staff):
                login(request,user)
                messages.add_message(request, messages.INFO, 'Successfully Login In Admin Panel')
                return render(request,'exam/onlineExam.html')

            elif(user.is_active==1 and user.is_staff==0):
                login(request,user)
                messages.add_message(request, messages.INFO, 'Successfully Login user Panel')
                return render(request,'exam/userPanel.html')

            else:
                messages.add_message(request, messages.INFO, 'You are not Registered')
        else:
            messages.error(request, 'Please,Sign Up or Your Account is not Active.Contact with Admin Site.')

    return render(request,'exam/login.html',{})
