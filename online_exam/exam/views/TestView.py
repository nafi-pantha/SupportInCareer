from django.contrib.auth.decorators import login_required
from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.decorators import login_required
import datetime

from exam.models import Subject
from exam.models import Test
from exam.models import SCFU_TotalTime


@login_required(login_url='user_login')
def getAllSubjectList(request):
    if (request.method == "GET"):
        subjectList = Subject.objects.values('subject_id','subject_name','mcq_total_test','essay_total_test')
        total_timeList = SCFU_TotalTime.objects.values('test_time')
        return JsonResponse({'results': list(subjectList), 'total_timeList':list(total_timeList)})
    else:
        return HttpResponse("Problem")

@login_required
def testInfoInsert(request):
    registered = False
    if(request.method=="POST"):
        subject_id = request.POST.get('subjectList')
        test_type = request.POST.get('testTypeList')
        test_id = request.POST.get('testIDList')
        test_name = request.POST.get('testName')
        test_total_questions = request.POST.get('testTotalQues')
        total_marks = request.POST.get('totalMarks')
        total_time = request.POST.get('totalTime')
        mode = request.POST.get('mode')

        if(test_id and mode == '1'):
            Test.objects.filter(test_id=test_id).update(test_name=test_name, test_totaltimes=total_time)
            return JsonResponse({'status': 1})
        elif(subject_id and test_type and test_id and test_name and test_total_questions and total_marks and total_time):
            test = Test.objects.create(
                subject_id=Subject.objects.get(pk=subject_id), test_type=test_type, test_id=test_id,
                test_name=test_name,
                test_total_questions=test_total_questions, test_totalmarks=total_marks, test_totaltimes=total_time,
                approver="Null",
                datetime=datetime.datetime.now()
            )
            test.save()
            registered = True
            return JsonResponse({'status': 2})
        else:
            print("No Data")
            return JsonResponse({'status': 3})

    else:
        return HttpResponse("Problem")

    return render(request,'exam/onlineExam.html',{'registered':registered})

@login_required
def testAvailableCheck(request):
    if (request.method == "GET"):
        test_id = request.GET.get('test_id')
        testAvailableList=Test.objects.values('test_id','test_name','test_totalmarks','test_type','test_total_questions','subject_id', 'test_totaltimes').filter(test_id=test_id)
        if(testAvailableList):
            return JsonResponse({'results': list(testAvailableList)})
        else:
            return JsonResponse({'results': '2'})
    else:
        return HttpResponse("Problem")

@login_required
def testNameCheck(request):
    if (request.method == "GET"):
        test_id = request.GET.get('test_id')
        testName = request.GET.get('testName')
        isTestAvailable=Test.objects.filter(test_name=testName).exclude(test_id=test_id)
        if(isTestAvailable):
            return JsonResponse("This name has already been used!", safe=False)
        else:
            return JsonResponse("true", safe=False)
    else:
        return HttpResponse("Problem")
