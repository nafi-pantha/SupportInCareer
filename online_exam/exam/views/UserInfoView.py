from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse
import datetime
from django.contrib.auth.models import User
from exam.models import UserInfo


def userInfoInsert(request):
    registered = False
    if(request.method=="POST"):
        userName = request.POST.get('userName')
        userContact = request.POST.get('userContact')

        if(request.FILES['pic']):
            user_image = request.FILES['pic']
        else:
            print("File is not Found")

        email = request.POST.get('email')
        pwd = request.POST.get('pwd')
        confirm_pwd = request.POST.get('confirm_pwd')

        if(pwd == confirm_pwd):
            print("inside in the if condition")
            user = User.objects.create_user(username=userName,email=email,password=pwd)
            user.is_active = False
            user.is_staff=False
            user.save()

            user_info = UserInfo.objects.create(user_id=user.pk,user_contact=userContact,
            user_image=user_image,
            approver="Null",datetime=datetime.datetime.now())

            registered=True
        else:
            print("No Data")

    else:
        return HttpResponse("Problem")

    return render(request,'exam/onlineExam.html',{'registered':registered})
