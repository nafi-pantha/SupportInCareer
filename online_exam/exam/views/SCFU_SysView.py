from django.http import JsonResponse, HttpResponse
from exam.models import SCFU_UserStatus
from exam.models import SCFU_UserType

from exam.models import SCFU_McqTotalTest, SCFU_EssayTotalTest
from exam.models import SCFU_TestType
from exam.models import SCFU_TestTotalQuesNo


def getUserStatus(request):
    if (request.method == "GET"):
        statusList = SCFU_UserStatus.objects.values('status_id','status_name')
        return JsonResponse({'results': list(statusList)})
    else:
        return HttpResponse("Problem")

def getUserType(request):
    if (request.method == "GET"):
        typeList = SCFU_UserType.objects.values('type_id','type_name')
        return JsonResponse({'results': list(typeList)})
    else:
        return HttpResponse("Problem")

def getTotalQuesNo(request):
    if (request.method == "GET"):
        mcqTotalTestList = SCFU_McqTotalTest.objects.values('mcq_total_test')
        essayTotalTestList = SCFU_EssayTotalTest.objects.values('essay_total_test')
        return JsonResponse({'mcqResults': list(mcqTotalTestList),'essayResults': list(essayTotalTestList)})
    else:
        return HttpResponse("Problem")

def getTestType(request):
    if (request.method == "GET"):
        testTypeList = SCFU_TestType.objects.values('test_type_id', 'test_type_name')
        testQuesNoList= SCFU_TestTotalQuesNo.objects.values('test_ques_no')
        return JsonResponse({'results': list(testTypeList), 'quesNoResult': list(testQuesNoList)})
    else:
        return HttpResponse("Problem")