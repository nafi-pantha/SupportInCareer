from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse
from exam.forms import SubjectForm

def subjectInsert(request):
    subject_form =SubjectForm()

    if(request.method=="POST"):
        subject_form = SubjectForm(request.POST)

        if(subject_form.is_valid()):
            subject = subject_form.save(commit=False)
            subject.save()
        else:
            return HttpResponse("Form Problem")

    else:
        print("Error")
        subject_form = SubjectForm()

    return render(request,'exam/onlineExam.html',{'subject_form':subject_form})
