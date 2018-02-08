import json

from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.decorators import login_required
import datetime

from exam.models import Subject
from exam.models import Test
from exam.models import EssayQuestion
from exam.models import EssaySummary

@login_required
def essayQuesPaperSubmit(request):
    if (request.method == "POST"):
        test_id=request.POST.get('test_id')
        essay_total_marks=request.POST.get('essay_total_marks')
        ret = request.POST.get('obj')
        essay_summary = request.POST.get('essay_summary')
        list = json.loads(ret)
        for value in list:
            EssayQuestion(essay_question_id=value['qid'], essay_question=value['ques'],
                        essay_question_marks=value['mark'],
                        test_id=Test.objects.get(pk=test_id),approver="Null",
                        datetime=datetime.datetime.now()).save()
        EssaySummary.objects.create(test_id=Test.objects.get(pk=test_id), essay_summary_details=essay_summary,
                                              approver="Null", datetime=datetime.datetime.now()).save()
        Test.objects.filter(test_id=test_id).update(test_totalmarks=essay_total_marks)
        return JsonResponse({'status': 1})
    else:
        return HttpResponse("Problem")

@login_required
def isEssayQuesAvailable(request):
    if (request.method == "GET"):
        test_id = request.GET.get('test_id')
        quesList = EssayQuestion.objects.values('essay_question_id', 'essay_question',
                        'essay_question_marks').filter(test_id=test_id)
        print(quesList)
        return JsonResponse(list(quesList),safe=False)
    else:
        return HttpResponse("Problem")

@login_required
def getEssayQuesData(request):
    if (request.method == "GET"):
        test_id = request.GET.get('test_id')
        quesList = EssayQuestion.objects.values('essay_question_id', 'essay_question').filter(test_id=test_id)
        essaySummary = EssaySummary.objects.values('essay_summary_details').filter(test_id=test_id)
        if not quesList:
            return JsonResponse({'status': 0})
        else:
            return JsonResponse({'status': 1, 'results':list(essaySummary)})
    else:
        return HttpResponse("Problem")

@login_required
def essayQuesEdit(request):
    test_id=request.GET.get('test_id')
    essay_ques_id=request.GET.get('essay_ques_id')
    essay_ques=request.GET.get('essay_ques')
    essay_question_marks=request.GET.get('essay_question_marks')
    print(test_id,essay_ques_id,essay_ques,essay_question_marks)
    if(request.method=="GET"):
        EssayQuestion.objects.filter(test_id=test_id,
                                   essay_question_id=essay_ques_id).update(essay_question=essay_ques,
                                                                       essay_question_marks=essay_question_marks,
                                                                       approver="Null",
                                                                       datetime=datetime.datetime.now())
        return JsonResponse({'status': 1})
    else:
        return HttpResponse("Problem")

@login_required
def essaySummaryEdit(request):
    test_id=request.GET.get('test_id')
    essay_summary=request.GET.get('essay_summary')
    if(request.method=="GET"):
        EssaySummary.objects.filter(test_id=test_id).update(essay_summary_details=essay_summary)
        return JsonResponse({'status': 1})
    else:
        return HttpResponse("Problem")
