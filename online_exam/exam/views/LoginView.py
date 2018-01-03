from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render, redirect
from exam.models import UserInfo
from django.contrib.auth import authenticate,login
from django.contrib import messages

# @login_required
def userLogin(request):
   if request.session.has_key('username'):
       userid=request.session['id']
       is_staff=request.session['is_staff']
       if(is_staff==1):
           userInfoList = UserInfo.objects.select_related().filter(user_id=userid)
           return render(request, 'exam/onlineExam.html', {'userInfoList': userInfoList})
       else:
           userInfoList = UserInfo.objects.select_related().filter(user_id=userid)
           return render(request, 'exam/userPanel.html', {'userInfoList': userInfoList})
   else:
       return render(request, 'exam/login.html', {})

def testLogin(request):
    if request.session.has_key('username'):
        return redirect('home')
    else:
        if (request.method == "POST"):
            username = request.POST.get('username')
            password = request.POST.get('password')
            user = authenticate(username=username, password=password)
            if (user):
                if (user.is_active and user.is_staff):
                    request.session['username'] = username
                    request.session['is_staff'] = 1
                    login(request, user)
                    request.session['id'] = user.id
                    # userInfoList = UserInfo.objects.select_related().filter(user_id=user.id)
                    return JsonResponse({'status': '1'})

                elif (user.is_active == 1 and user.is_staff == 0):
                    request.session['username'] = username
                    request.session['is_staff'] = 0
                    login(request, user)
                    request.session['id'] = user.id
                    # userInfoList = UserInfo.objects.select_related().filter(user_id=user.id)
                    return JsonResponse({'status': '1'})

                else:
                    # messages.add_message(request, messages.INFO, 'You are not Registered')
                    # return render(request, 'exam/login.html', {})
                    return JsonResponse({'status':'2'})

            else:
                # messages.error(request, 'Please,Sign Up or Your Account is not Active. Contact with Admin Site.')
                # return render(request, 'exam/login.html', {})
                return JsonResponse({'status': '2'})
        else:
            return render(request, 'exam/login.html', {})