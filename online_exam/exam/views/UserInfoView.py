from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse
import datetime
from exam.models import UserInfo


def index(request):
    return render(request,'exam/onlineExam.html',{})

def userInfoInsert(request):
    registered = False
    if(request.method=="POST"):
        userID = request.POST.get('userID')
        userName = request.POST.get('userName')
        userContact = request.POST.get('userContact')

        if(request.FILES['pic']):
            user_image = request.FILES['pic']
        else:
            print("File is not Found")    

        email = request.POST.get('email')
        pwd = request.POST.get('pwd')
        confirm_pwd = request.POST.get('confirm_pwd')
        status = request.POST.get('status')
        userType = request.POST.get('userType')

        if(pwd == confirm_pwd):
            print("inside the if condition")
            user = UserInfo.objects.create(
            user_id = userID,user_name=userName,user_contact=userContact,
            user_image=user_image,user_email=email,
            user_password=pwd,user_status=status,is_admin=userType,approver="Null",
            datetime=datetime.datetime.now()
            )

            user.save()
            registered=True
        else:
            print("No Data")

    else:
        return HttpResponse("Problem")

    return render(request,'exam/onlineExam.html',{'registered':registered})