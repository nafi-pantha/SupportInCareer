import json

import datetime
from itertools import chain

from django.contrib.auth.models import User
from django.core import serializers
from django.db import connection
from django.forms import model_to_dict
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render
from exam.models import AdminReview
from exam.models import UserEssayAnswer
from exam.models import UserResult
from exam.models import Test

from exam.models import EssayQuestion


def reviewUserList(request):
    if (request.method == "GET"):
        results = AdminReview.objects.filter(is_reviewed=False).values('user_id', 'user__user__username').distinct()
        return JsonResponse({'results': list(results)})
    else:
        return HttpResponse("Problem")


def getTestListReview(request):
    if (request.method == "GET"):
        user_id = request.GET.get('user_id')
        results = AdminReview.objects.filter(is_reviewed=False, user_id=user_id).values('test_id', 'test_id__test_name')
        print(results)
        return JsonResponse({'results': list(results)})
    else:
        return HttpResponse("Problem")


def getUserAnswerReview(request):
    if (request.method == "GET"):
        user_id = request.GET.get('user_id')
        test_id = request.GET.get('test_id')

        cursor = connection.cursor()
        cursor.execute(
            """SELECT A.id, A.essay_question_id_id, B.essay_question, A.user_answer, B.essay_question_marks \
              FROM exam_useressayanswer A \
              INNER JOIN exam_essayquestion B on B.essay_question_id= A.essay_question_id_id \
              AND B.test_id_id=A.test_id_id WHERE user_id=%s and B.test_id_id=%s""", [user_id, test_id])
        rows = cursor.fetchall()
        result = []
        keys = ('id', 'ques_id', 'ques', 'user_answer')
        for row in rows:
            result.append(dict(zip(keys, row)))
        return JsonResponse({'results': list(result)})
    else:
        return HttpResponse("Problem")

def getRatingMarks(request):
    if (request.method == "GET"):
        test_id = request.GET.get('test_id')
        results = EssayQuestion.objects.filter(test_id=test_id).values_list('essay_question_marks')
        resArr=[]
        print(results.count())
        for row in results:
            resArr.append(row)
        print(resArr)
        return JsonResponse(list(results), safe=False)
    else:
        return HttpResponse("Problem")

def reviewSubmit(request):
    if (request.method == "POST"):
        test_id = request.POST.get('test_id')
        user_id = request.POST.get('user_id')
        total_marks = request.POST.get('total_marks')
        ret = request.POST.get('obj')
        list = json.loads(ret)
        results = Test.objects.filter(test_id=test_id).values('test_totalmarks')
        gained_percentage = ((int)(total_marks) * 100) / (int)(results[0]['test_totalmarks'])
        is_passed = True if gained_percentage > 80 else False
        delIfExist = UserResult.objects.filter(user_id=user_id, test_id=test_id)
        userResult = UserResult.objects.create(test_type=2, gained_marks=total_marks,
                                               spend_time=15, datetime=datetime.datetime.now(), is_passed=is_passed,
                                               test_id=Test.objects.get(pk=test_id), user_id=user_id)
        print(list)
        for value in list:
            print(value['suggestions'])
            UserEssayAnswer.objects.filter(user_id=user_id, test_id=test_id, essay_question_id=value['quesid']) \
                .update(individual_mark=value['mark'], suggestions=value['suggestions'])
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
