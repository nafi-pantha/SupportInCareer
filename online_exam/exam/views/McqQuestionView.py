import json

from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse, JsonResponse
import datetime

from exam.models import Subject
from exam.models import Test
from exam.models import McqQuestion


def index(request):
    return render(request,'exam/onlineExam.html',{})

def getAllTestList(request):
    if (request.method == "GET"):
        test_type = request.GET.get('test_type')
        subject_id = request.GET.get('subject_id')
        testList = Test.objects.values('test_id','test_name','test_totalmarks','test_totaltimes',
                                       'test_type','subject_id','test_total_questions').filter(test_type=test_type,subject_id=subject_id)
        print(testList)
        return JsonResponse({'results': list(testList)})
    else:
        return HttpResponse("Problem")

def getTestInfo(request):
    if(request.method == "GET"):
        test_type = request.GET.get('test_type')
        subject_id = request.GET.get('subject_id')
        test_id = request.GET.get('test_id')
        testInfo = Test.objects.values('test_id', 'test_name', 'test_totalmarks', 'test_totaltimes',
                                       'test_type', 'subject_id', 'test_total_questions').filter(test_type=test_type,
                                                                                                 subject_id=subject_id,
                                                                                                 test_id=test_id)
        return JsonResponse({'results': list(testInfo)})

def mcqQuesPaperSubmit(request):
    if (request.method == "POST"):
        test_id=request.POST.get('test_id')
        ret = request.POST.get('obj')
        list = json.loads(ret)
        for value in list:
            McqQuestion(mcq_question_id=value['qid'], mcq_question=value['ques'],
                        mcq_option1=value['option1'], mcq_option2=value['option2'],
                        mcq_option3=value['option3'],mcq_option4=value['option4'],
                        mcq_right_answer=value['rightAnswer'],test_id=Test.objects.get(pk=test_id),approver="Null",
                        datetime=datetime.datetime.now()).save()

        return JsonResponse({'status': '1'})
    else:
        return HttpResponse("Problem")

def isMcqQuesAvailable(request):
    if (request.method == "GET"):
        test_id = request.GET.get('test_id')
        quesList = McqQuestion.objects.values('mcq_question_id', 'mcq_question',
                        'mcq_option1', 'mcq_option2',
                        'mcq_option3','mcq_option4',
                        'mcq_right_answer').filter(test_id=test_id)
        return JsonResponse(list(quesList),safe=False)
    else:
        return HttpResponse("Problem")

def getMcqQuesData(request):
    if (request.method == "GET"):
        test_id = request.GET.get('test_id')
        quesList = McqQuestion.objects.values('mcq_question_id', 'mcq_question').filter(test_id=test_id)
        if not quesList:
            return JsonResponse({'status': 0})
        else:
            return JsonResponse({'status': 1})
    else:
        return HttpResponse("Problem")

def mcqQuesEdit(request):
    test_id=request.GET.get('test_id')
    mcq_ques_id=request.GET.get('mcq_ques_id')
    mcq_ques=request.GET.get('mcq_ques')
    mcq_option1=request.GET.get('mcq_option1')
    mcq_option2=request.GET.get('mcq_option2')
    mcq_option3=request.GET.get('mcq_option3')
    mcq_option4=request.GET.get('mcq_option4')
    mcq_ans=request.GET.get('mcq_answer')
    if(request.method=="GET"):
        McqQuestion.objects.filter(test_id=test_id,
                                   mcq_question_id=mcq_ques_id).update(mcq_question=mcq_ques,
                                                                       mcq_option1=mcq_option1,
                                                                       mcq_option2=mcq_option2,
                                                                       mcq_option3=mcq_option3,
                                                                       mcq_option4=mcq_option4,
                                                                       mcq_right_answer=mcq_ans,
                                                                       approver="Null",
                                                                       datetime=datetime.datetime.now())
        return JsonResponse({'status': 1})
    else:
        return HttpResponse("Problem")
