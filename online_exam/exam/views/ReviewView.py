import json

import datetime
from django.contrib.auth.models import User
from django.core import serializers
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render
from exam.models import AdminReview
from exam.models import UserEssayAnswer
from exam.models import UserResult
from exam.models import Test


def reviewUserList(request):
    if (request.method == "GET"):
        results = AdminReview.objects.filter(is_reviewed=False).values('user_id','user__user__username')
        return JsonResponse({'results': list(results)})
    else:
        return HttpResponse("Problem")

def getTestListReview(request):
    if (request.method == "GET"):
        user_id=request.GET.get('user_id')
        results = AdminReview.objects.filter(is_reviewed=False, user_id=user_id).values('test_id','test_id__test_name')
        print(results)
        return JsonResponse({'results': list(results)})
    else:
        return HttpResponse("Problem")

def getUserAnswerReview(request):
    if(request.method == "GET"):
        user_id = request.GET.get('user_id')
        test_id = request.GET.get('test_id')
        results = UserEssayAnswer.objects.filter(test_id=test_id, user_id=user_id)\
                                        .values('essay_question_id', 'essay_question_id__essay_question','user_answer')

        return JsonResponse({'results': list(results)})
    else:
        return HttpResponse("Problem")

def reviewSubmit(request):
    if (request.method == "POST"):
        test_id=request.POST.get('test_id')
        user_id=request.POST.get('user_id')
        total_marks=request.POST.get('total_marks')
        ret = request.POST.get('obj')
        list = json.loads(ret)
        results=Test.objects.filter(test_id=test_id).values('test_totalmarks')
        gained_percentage=((int)(total_marks)*100)/(int)(results[0]['test_totalmarks'])
        is_passed=True if gained_percentage>80 else False
        delIfExist = UserResult.objects.filter(user_id=user_id, test_id=test_id)
        userResult = UserResult.objects.create(test_type=2, gained_marks=total_marks,
                                  spend_time=15, datetime=datetime.datetime.now(), is_passed=is_passed,
                                  test_id=Test.objects.get(pk=test_id), user_id=user_id)
        for value in list:
            UserEssayAnswer.objects.filter(test_id=test_id,
                                        user_id=user_id).update(individual_mark=value['mark'],
                                                                suggestions=value['suggestions'])
        AdminReview.objects.filter(test_id=test_id,
                                    user_id=user_id).update(is_reviewed=True)

        UserResult.objects.create(test_type=2, gained_marks=total_marks,
                                  spend_time=15, datetime=datetime.datetime.now(), is_passed=is_passed,
                                  test_id=Test.objects.get(pk=test_id), user_id=user_id)
        if not delIfExist:
            userResult.save()
        else:
            delIfExist.delete()
            userResult.save()

        return JsonResponse({'status': '1'})
    else:
        return HttpResponse("Problem")