from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse
from django.views.generic import (TemplateView,ListView,
DetailView,CreateView,UpdateView,DeleteView)
from exam.forms import UserInfoForm,SubjectForm
from exam.models import UserInfo,Subject
# Create your views here.
def index(request):
    return  HttpResponse("<h1>Hail Yeah!!</h1>")


def userinfoview(request):
    user_form = UserInfoForm()

    if(request.method=="POST"):
        user_form = UserInfoForm(request.POST)

        if(user_form.is_valid()):
            user_form.save()
            return HttpResponse("Data Save")
        else:
            HttpResponse("Problem")

    else:
        user_form = UserInfoForm()

    return render(request,'exam/userinfoform.html',{'user_form':user_form})

def user_info_update(request,pk):
    user_pk = get_object_or_404(UserInfo,pk=pk)
    if(request.method=="POST"):
        user_form = UserInfoForm(request.POST or None,instance=user_pk)
        if(user_form.is_valid()):
            user_form.save()
            return HttpResponse("Updated")
        else:
            return HttpResponse("Problem")
    else:
        user_form = UserInfoForm(instance=user_pk)

    return render(request,'exam/user_info_update_form.html',{'user_form':user_form})

class CreateSubjectView(CreateView):
    template_name = 'subject_form.html'
    form_class = SubjectForm
    model = Subject
