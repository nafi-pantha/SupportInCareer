import json

from django.core import serializers
from django.db.models import F, Case, When, BooleanField, Value, Count
from django.shortcuts import render, get_object_or_404, render_to_response
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, JsonResponse
import datetime

from django.template import RequestContext, loader, Context
from django.template.loader import render_to_string
from exam.models import Subject
from exam.models import Test
from exam.models import McqQuestion
from exam.models import UserResult
from exam.models import UserMcqAnswer

from exam.models import AdminReview

@login_required
def test_info_list(request):
    if(request.method == "GET"):
        subject_id = request.GET.get('subject_id')
        test_type = request.GET.get('test_type')
        testInfo = Test.objects.select_related('test_id').values('test_id', 'test_name', 'test_totalmarks', 'test_totaltimes',
                                       'test_type', 'subject_id', 'test_total_questions').filter(test_type=test_type,
                                                                                                 subject_id=subject_id)
        return render(request, 'up_examAccordion.html', {'testInfo': testInfo})
    else:
        return HttpResponse("Problem")

@login_required
def user_test_id(request):
    if (request.method == "GET"):
        subject_id = request.GET.get('subject_id')
        test_type = request.GET.get('test_type')
        user_id = request.GET.get('user_id')
        # user_id = request.user.id
        testInfo = Test.objects.values('test_id', 'test_name', 'test_totalmarks', 'test_totaltimes',
                                       'test_type', 'subject_id', 'test_total_questions').filter(test_type=test_type,
                                                                                                 subject_id=subject_id)
        intialTestID = UserResult.objects.select_related('test_id').select_related('test_id__subject_id').values(
            'test_id').filter(user_id=user_id,
                              test_id__subject_id=subject_id,
                              test_type=test_type)

        if testInfo:
            if test_type == '1':
                questionCheck = McqQuestion.objects.filter(test_id__subject_id=subject_id)
                if questionCheck:
                    if not intialTestID:
                        examTestID = testInfo[0]['test_id']
                        test_time = testInfo[0]['test_totaltimes']
                    else:
                        failedTestIDInfo = UserResult.objects.select_related('test_id').select_related(
                            'test_id__subject_id').values(
                            'test_id', 'is_passed', 'test_id__test_totaltimes').filter(user_id=user_id,
                                                                                       test_id__subject_id=subject_id,
                                                                                       test_type=test_type,
                                                                                       is_passed=False).order_by('test_id')[:1]
                        if not failedTestIDInfo:
                            passedTestIDInfo = UserResult.objects.select_related('test_id').select_related(
                                'test_id__subject_id').values(
                                'test_id', 'is_passed').filter(user_id=user_id,
                                                               test_id__subject_id=subject_id,
                                                               test_type=test_type,
                                                               is_passed=True).order_by('-test_id')[:1]
                            nextTestID = Test.objects.values('test_id', 'test_totaltimes').filter(
                                test_id__gt=passedTestIDInfo[0]['test_id'],
                                subject_id=subject_id,
                                test_type=test_type)
                            if not nextTestID:
                                return JsonResponse({'status': 3})
                            else:
                                examTestID = nextTestID[0]['test_id']
                                test_time = nextTestID[0]['test_totaltimes']
                        else:
                            examTestID = failedTestIDInfo[0]['test_id']
                            test_time = failedTestIDInfo[0]['test_id__test_totaltimes']
                    return JsonResponse({'examTestID': examTestID, 'test_time': test_time})
                else:
                    return JsonResponse({'status': 6})
            else:
                questionCheck = McqQuestion.objects.filter(test_id__subject_id=subject_id)
                if questionCheck:
                    if not intialTestID:
                        examTestID = testInfo[0]['test_id']
                        reviewCheck = AdminReview.objects.values('test_id', 'is_reviewed').filter(test_id=examTestID, user_id=user_id)
                        print(reviewCheck)
                        if reviewCheck:
                            if not reviewCheck[0]['is_reviewed']:
                                return JsonResponse({'status': 4})
                            else:
                                examTestID = testInfo[0]['test_id']
                                test_time = testInfo[0]['test_totaltimes']
                        else:
                            examTestID = testInfo[0]['test_id']
                            test_time = testInfo[0]['test_totaltimes']
                    else:
                        failedTestIDInfo = UserResult.objects.select_related('test_id').select_related(
                            'test_id__subject_id').values(
                            'test_id', 'is_passed', 'test_id__test_totaltimes').filter(user_id=user_id,
                                                                                       test_id__subject_id=subject_id,
                                                                                       test_type=test_type,
                                                                                       is_passed=False).order_by('test_id')[:1]
                        if not failedTestIDInfo:
                            passedTestIDInfo = UserResult.objects.select_related('test_id').select_related(
                                'test_id__subject_id').values(
                                'test_id', 'is_passed').filter(user_id=user_id,
                                                               test_id__subject_id=subject_id,
                                                               test_type=test_type,
                                                               is_passed=True).order_by('-test_id')[:1]
                            nextTestID = Test.objects.values('test_id', 'test_totaltimes').filter(
                                test_id__gt=passedTestIDInfo[0]['test_id'],
                                subject_id=subject_id,
                                test_type=test_type)
                            if not nextTestID:
                                return JsonResponse({'status': 3})
                            else:
                                reviewCheck = AdminReview.objects.values('test_id', 'is_reviewed').filter(
                                    test_id=nextTestID[0]['test_id'], user_id=user_id)
                                print(reviewCheck)
                                if reviewCheck:
                                    print(reviewCheck)
                                    if not reviewCheck[0]['is_reviewed']:
                                        return JsonResponse({'status': 4})
                                    else:
                                        examTestID = nextTestID[0]['test_id']
                                        test_time = nextTestID[0]['test_totaltimes']
                                else:
                                    examTestID = nextTestID[0]['test_id']
                                    test_time = nextTestID[0]['test_totaltimes']
                        else:
                            reviewCheck = AdminReview.objects.values('test_id', 'is_reviewed').filter(test_id=failedTestIDInfo[0]['test_id'], user_id=user_id)
                            if reviewCheck:
                                if not reviewCheck[0]['is_reviewed']:
                                    print(reviewCheck)
                                    return JsonResponse({'status': 4})
                                else:
                                    examTestID = failedTestIDInfo[0]['test_id']
                                    test_time = failedTestIDInfo[0]['test_id__test_totaltimes']
                            else:
                                examTestID = failedTestIDInfo[0]['test_id']
                                test_time = failedTestIDInfo[0]['test_id__test_totaltimes']
                    return JsonResponse({'examTestID': examTestID, 'test_time': test_time})
                else:
                    return JsonResponse({'status': 6})
        else:
            return JsonResponse({'status': 5})
    else:
        return HttpResponse("Problem")

@login_required
def ques_info(request):
    if (request.method == "GET"):
        test_id = request.GET.get('test_id')
        quesInfo = McqQuestion.objects.values('id','mcq_question_id', 'mcq_question', 'mcq_option1', 'mcq_option2',
                                       'mcq_option3', 'mcq_option4').filter(test_id=test_id)
        return render(request, 'up_mcqExamList.html', {'quesInfo': quesInfo})
    else:
        return HttpResponse("Problem")

@login_required
def mcq_ans_submit(request):
    if (request.method == "POST"):
        test_id=request.POST.get('test_id')
        user_id = request.POST.get('user_id')
        ret = request.POST.get('obj')
        list = json.loads(ret)
        print(list)
        delIfExist = UserMcqAnswer.objects.filter(user_id=user_id,test_id=test_id)
        if not delIfExist:
            for value in list:
                UserMcqAnswer(user_id=user_id, test_id=Test.objects.get(pk=test_id),
                              mcq_question_id=McqQuestion.objects.get(pk=value['ques']),
                              user_answer=value['ans'],datetime=datetime.datetime.now()).save()
        else:
            delIfExist.delete()
            for value in list:
                UserMcqAnswer(user_id=user_id, test_id=Test.objects.get(pk=test_id),
                              mcq_question_id=McqQuestion.objects.get(pk=value['ques']),
                              user_answer=value['ans'],datetime=datetime.datetime.now()).save()
        return JsonResponse({'status': '1'})
    else:
        return HttpResponse("Problem")

@login_required
def get_user_result(request):
    if (request.method == "GET"):
        test_id = request.GET.get('test_id')
        user_id = request.GET.get('user_id')
        usedTime = request.GET.get('usedTime')
        totalQues = Test.objects.values('test_totalmarks', 'test_totaltimes', 'test_total_questions').filter(test_type=1, test_id=test_id)
        answers = UserMcqAnswer.objects.filter(test_id=test_id, user=user_id).annotate(
            is_correct=Case(
                When(user_answer=F('mcq_question_id__mcq_right_answer'),
                then=Value(True)),
                default=Value(False),
                output_field=BooleanField())
        ).values('is_correct').filter(is_correct=True).annotate(right_answer=Count('is_correct'))

        total_marks=totalQues[0]['test_total_questions']

        if not answers:
            gained_marks = 0
        else:
            gained_marks = answers[0]['right_answer']
        gained_percentage=(gained_marks/total_marks)*(100)

        if gained_percentage >= 84.0:
            result_status=1
            next_test_id=int(test_id)+10
        else:
            result_status=0
            next_test_id = test_id
        print(result_status)

        delIfExist = UserResult.objects.filter(user_id=user_id, test_id=test_id)
        userResult = UserResult.objects.create(test_type=1, gained_marks=gained_marks, spend_time=usedTime,
                                               is_passed=result_status, datetime=datetime.datetime.now(),
                                               test_id=Test.objects.get(pk=test_id), user_id=user_id)
        testTime = Test.objects.values('test_totaltimes').filter(test_id=next_test_id)

        if not delIfExist:
            userResult.save()
        else:
            delIfExist.delete()
            userResult.save()

        if not testTime:
            result_list = []
        else:
            total_time = testTime[0]['test_totaltimes']
            result_list = []
            result_stats = {}
            result_stats['total_marks'] = total_marks
            result_stats['gained_marks'] = gained_marks
            result_stats['gained_percentage'] = gained_percentage
            result_stats['result_status'] = result_status
            result_stats['next_test_id'] = str(next_test_id)
            result_stats['test_time'] = total_time
            result_list.append(result_stats)

        print(result_list)
        return JsonResponse({'result_list': result_list})
    else:
        return HttpResponse("Problem")
