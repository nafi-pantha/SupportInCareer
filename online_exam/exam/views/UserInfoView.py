import json

from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import check_password
from django.core import serializers
from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, JsonResponse
import datetime
from django.contrib.auth.models import User
from exam.models import UserInfo

from exam.forms import UserInfoForm


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

@login_required
def getUserList(request):
    r = []
    for user in User.objects.all().exclude(username='nafi'):
        r.append({
            'id': user.id,
            'username': user.username,
            'user_contact': user.userinfo.user_contact,
            'email': user.email,
            'is_active': user.is_active,
            'is_staff': user.is_staff
        })
    return JsonResponse(r, safe=False)

@login_required
def userUpdate(request):
    if(request.method=="GET"):
        user_id = request.GET.get('user_id')
        is_staff = request.GET.get('is_staff')
        is_active = request.GET.get('is_active')
        User.objects.filter(id=user_id).update(is_staff=is_staff, is_active=is_active)
        return JsonResponse({'status': 1})
    else:
        return JsonResponse({'status': 2})

@login_required
def getPicUpdate(request):
    if request.method == 'POST':
        picture_form = UserInfoForm(request.POST, instance=request.user.userinfo)
        user = request.user
        if(picture_form.is_valid()):
            profile = picture_form.save(commit=False)
            profile.user = user
            if('user_image' in request.FILES):
                profile.user_image = request.FILES['user_image']
                img = UserInfo.objects.all()
                profile.save()
                return JsonResponse({'status': 1})
        return redirect('home')

@login_required
def getPicForm(request):
    if request.method == 'GET':
        picture_form = UserInfoForm(instance=request.user.userinfo)
        return render(request, 'exam/picture_update.html', {'picture_form': picture_form})

@login_required
def getOldPassCheck(request):
    if (request.method == "POST"):
        user = request.user
        oldPass = request.POST.get('oldPass')
        isPassOK=check_password(oldPass, user.password)
        if(not isPassOK):
            return JsonResponse("Password mismatch!", safe=False)
        else:
            return JsonResponse("true", safe=False)
    else:
        return HttpResponse("Problem")

@login_required
def getPassChange(request):
    if(request.method=="POST"):
        oldPass = request.POST.get('oldPass')
        newPass = request.POST.get('newPass')
        if(oldPass==newPass):
            return JsonResponse({'status': 2})
        else:
            passChange = User.objects.get(id=request.user.id)
            passChange.set_password(newPass)
            passChange.save()
            return JsonResponse({'status': 1})
    else:
        return HttpResponse("Problem")

@login_required
def getProfileUpdate(request):
    if(request.method=="POST"):
        first_name = request.POST.get('profileFirstName')
        last_name = request.POST.get('profileLastName')
        user_contact = request.POST.get('profileUserContact')
        print(first_name)
        print(last_name)
        print(user_contact)
        User.objects.filter(id=request.user.id).update(first_name=first_name, last_name=last_name)
        UserInfo.objects.filter(user_id=request.user.id).update(user_contact=user_contact)
        #User.objects.filter(userinfo__user_id=request.user.id).update(first_name=first_name, last_name=last_name, user_contact=user_contact)
        return JsonResponse({'status': 1})
    else:
        return JsonResponse({'status': 2})
