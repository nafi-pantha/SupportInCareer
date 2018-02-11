from django.db import connection
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from exam.models import UserResult

from exam.models import UserEssayAnswer

@login_required
def getResult(request):
    if(request.method=="GET"):
        current_user = request.user
        #test_type = request.GET.get('test_type')
        resultList = UserResult.objects.values('test_id','test_id__subject_id__subject_name', 'test_id__test_name', 'test_type',
                        'test_id__test_totalmarks', 'gained_marks',
                        'is_passed','datetime').filter(user_id=current_user.id)#, test_type=test_type)
        print(resultList)
        if (resultList):
            return JsonResponse(list(resultList), safe=False)
        else:
            return JsonResponse({"sEcho": 1, "iTotalRecords": "0","iTotalDisplayRecords": "0","aaData": []})
    else:
        return JsonResponse({'status': 2})

@login_required
def getEssayResultDetails(request):
    if(request.method=="GET"):
        test_id = request.GET.get('test_id')
        user_id=request.user.id

        cursor = connection.cursor()
        cursor.execute(
            """SELECT A.id, A.essay_question_id_id, B.essay_question_id, B.essay_question, A.user_answer, \
                A.individual_mark, A.suggestions, B.essay_question_marks \
                FROM exam_useressayanswer A \
                INNER JOIN exam_essayquestion B on B.id = A.essay_question_id_id \
                AND B.test_id_id=A.test_id_id WHERE user_id=%s and B.test_id_id=%s""", [user_id, test_id])
        rows = cursor.fetchall()
        result = []
        keys = ('id', 'ques_id', 'ques_sl_no', 'ques', 'user_answer', 'gained_marks', 'suggestions', 'actual_marks')
        for row in rows:
            result.append(dict(zip(keys, row)))
        print(result)
        return JsonResponse(list(result), safe=False)
    else:
        return JsonResponse({'status': 2})
