import json

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from exam.models import EssayQuestion
from exam.models import UserEssayAnswer
from exam.models import Test


def essay_ques_info(request):
    if (request.method == "GET"):
        test_id = request.GET.get('test_id')
        quesInfo = EssayQuestion.objects.values('essay_question_id', 'essay_question', 'essay_question_marks').filter(test_id=test_id)
        return render(request, 'up_essayExamList.html', {'quesInfo': quesInfo})
    else:
        return HttpResponse("Problem")

def essay_ans_submit(request):
    if (request.method == "POST"):
        test_id=request.POST.get('test_id')
        user_id = request.POST.get('user_id')
        ret = request.POST.get('obj')
        list = json.loads(ret)
        print(list)
        delIfExist = UserEssayAnswer.objects.filter(user_id=user_id,test_id=test_id)
        if not delIfExist:
            for value in list:
                UserEssayAnswer(user_id=user_id, test_id=Test.objects.get(pk=test_id),
                              essay_question_id=EssayQuestion.objects.get(pk=value['ques']),
                              user_answer=value['ans']).save()
        else:
            delIfExist.delete()
            for value in list:
                UserEssayAnswer(user_id=user_id, test_id=Test.objects.get(pk=test_id),
                                essay_question_id=EssayQuestion.objects.get(pk=value['ques']),
                                user_answer=value['ans']).save()
        return JsonResponse({'status': '1'})
    else:
        return HttpResponse("Problem")
