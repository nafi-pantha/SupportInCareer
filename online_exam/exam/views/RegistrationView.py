from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse, JsonResponse
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.models import User
from exam.models import UserInfo
from django.contrib import messages
import datetime

def userRegistration(request):
    registered = False
    if(request.method=="POST"):
        userName = request.POST.get('userName')
        userContact = request.POST.get('userContact')

        # if(request.FILES['pic']):
        #     user_image = request.FILES['pic']
        # else:
        #     print("File is not Found")

        email = request.POST.get('email')
        pwd = request.POST.get('pwd')
        confirm_pwd = request.POST.get('password2')

        if(not(User.objects.filter(username = userName).exists())):
            if(pwd == confirm_pwd):
                print("inside in the if condition")
                user = User.objects.create_user(username=userName,email=email,password=pwd)
                user.is_active=False
                user.is_staff = False
                user.save()

                user_info = UserInfo.objects.create(user_id=user.pk,user_contact=userContact,user_image="Null",
                approver="Null",datetime=datetime.datetime.now())
                registered=True
                #messages.add_message(request, messages.INFO, 'Account Created Successfully')
                return JsonResponse({'status': '1'})
            else:
                print("No Data")
        else:
            #return HttpResponse("<h3>Username Already Exist.Please Select another one.</h3>")
            return JsonResponse({'status': '2'})
    return render(request,'exam/login.html',{'registered':registered})


def emailAvailableCheck(request):
    if (request.method == "GET"):
        email = request.GET.get('email')
        isEmailAvailable=User.objects.filter(email=email)
        if(isEmailAvailable):
            return JsonResponse("This email has already been used!", safe=False)
        else:
            return JsonResponse("true", safe=False)
    else:
        return HttpResponse("Problem")


def usernameAvailableCheck(request):
    if (request.method == "GET"):
        username = request.GET.get('userName')
        isUsernameAvailable=User.objects.filter(username=username)
        if(isUsernameAvailable):
            return JsonResponse("This username has already been used!", safe=False)
        else:
            return JsonResponse("true", safe=False)
    else:
        return HttpResponse("Problem")