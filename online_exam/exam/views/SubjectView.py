from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.decorators import login_required
import datetime
from exam.models import Subject

@login_required
def subjectInsert(request):
    print("Outside the if condition")
    if(request.method=="POST"):
        subjectID = request.POST.get('subjectID')
        subjectName = request.POST.get('subjectName')
        mcqTotalTest = request.POST.get('mcqTotalTest')
        essayTotalTest = request.POST.get('essayTotalTest')

        #isSubjectAvailable = Subject.objects.filter(subject_id=subjectID)
        if (subjectID):
            Subject.objects.filter(subject_id=subjectID).update(subject_name=subjectName,
                                                                mcq_total_test=mcqTotalTest,
                                                                essay_total_test=essayTotalTest,
                                                                approver="Null",
                                                                datetime=datetime.datetime.now())
            return JsonResponse({'status': '2'})
        else:
            sub = Subject.objects.create(
                subject_name=subjectName,
                mcq_total_test=mcqTotalTest,
                essay_total_test=essayTotalTest,
                approver="Null",
                datetime=datetime.datetime.now()
            )
            sub.save()
            return JsonResponse({'status': '1'})
    else:
        return HttpResponse("Problem")

    return render(request,'exam/onlineExam.html',{})

@login_required
def subjectAvailableCheck(request):
    if (request.method == "GET"):
        subjectName = request.GET.get('subjectName')
        isSubjectAvailable=Subject.objects.filter(subject_name=subjectName)
        if(isSubjectAvailable):
            return JsonResponse("This subject has already been used!", safe=False)
        else:
            return JsonResponse("true", safe=False)
    else:
        return HttpResponse("Problem")
