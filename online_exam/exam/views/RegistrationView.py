from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse, JsonResponse
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.forms import PasswordResetForm
from django.contrib.auth.models import User
from exam.models import UserInfo
from django.contrib import messages
import datetime
# email verification

from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_bytes, force_text
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.template.loader import render_to_string
from exam.tokens import account_activation_token
from django.core.mail import EmailMessage
from django.core.exceptions import ValidationError

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
                current_site = get_current_site(request)
                mail_subject = 'Activate your blog account.'
                message = render_to_string('acc_active_email.html', {
                    'user': user,
                    'domain': current_site.domain,
                    'uid':urlsafe_base64_encode(force_bytes(user.pk)),
                    'token':account_activation_token.make_token(user),
                })
                to_email = email
                email = EmailMessage(
                            mail_subject, message, to=[to_email]
                )
                email.send()
                registered=True
                #messages.add_message(request, messages.INFO, 'Account Created Successfully')
                return JsonResponse({'status': '1'})
            else:
                print("No Data")
        else:
            #return HttpResponse("<h3>Username Already Exist.Please Select another one.</h3>")
            return JsonResponse({'status': '2'})
    return render(request,'exam/login.html',{'registered':registered})

def activate(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        return HttpResponse('Thank you for your email confirmation. Now you can login your account.')
    else:
        return HttpResponse('Activation link is invalid!')


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

class EmailValidationOnForgotPassword(PasswordResetForm):
    def clean_email(self):
        email = self.cleaned_data['email']
        if not User.objects.filter(email__iexact=email, is_active=True).exists():
            raise ValidationError("There is no user registered with the specified email address!")

        return email
