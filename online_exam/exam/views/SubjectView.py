from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse
import datetime
from exam.models import Subject


def subjectInsert(request):
    print("Outside the if condition")
    if(request.method=="POST"):
        print("Inside the if condition")
        subjectID = request.POST.get('subjectID')
        subjectName = request.POST.get('subjectName')
        mcqTotalQues = request.POST.get('mcqTotalQues')
        essayTotalQues = request.POST.get('essayTotalQues')

        sub = Subject.objects.create(
        subject_id = subjectID,subject_name=subjectName,
        mcq_total_test = mcqTotalQues,
        essay_total_test = essayTotalQues,
        approver = "Null",
        datetime = datetime.datetime.now()
        )
        sub.save()
    else:
        return HttpResponse("Problem")

    return render(request,'exam/onlineExam.html',{})
