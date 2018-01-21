from django.http import JsonResponse
from exam.models import UserResult

from exam.models import UserEssayAnswer


def getResult(request):
    if(request.method=="GET"):
        current_user = request.user
        test_type = request.GET.get('test_type')
        resultList = UserResult.objects.values('test_id','test_id__subject_id__subject_name', 'test_id__test_name', 'test_type',
                        'test_id__test_totalmarks', 'gained_marks',
                        'is_passed','datetime').filter(user_id=current_user.id, test_type=test_type)
        print(resultList)
        if (resultList):
            return JsonResponse(list(resultList), safe=False)
    else:
        return JsonResponse({'status': 2})

def getEssayResultDetails(request):
    if(request.method=="GET"):
        current_user = request.user
        test_id = request.GET.get('test_id')
        resultList = UserEssayAnswer.objects.values('essay_question_id','essay_question_id__essay_question',
                                                    'user_answer', 'individual_mark', 'suggestions',
                                                    'essay_question_id__essay_question_marks')\
                                                    .filter(user_id=current_user.id, test_id=test_id)
        print(resultList)
        if (resultList):
            return JsonResponse(list(resultList), safe=False)
    else:
        return JsonResponse({'status': 2})