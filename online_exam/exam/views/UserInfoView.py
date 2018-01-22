import json

from django.contrib.auth.decorators import login_required
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

def getUserList(request):
    r = []
    for user in User.objects.all():
        r.append({
            'id': user.id,
            'username': user.username,
            'user_contact': user.userinfo.user_contact,
            'email': user.email,
            'is_active': user.is_active,
            'is_staff': user.is_staff
        })
    return JsonResponse(r, safe=False)

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