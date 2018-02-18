from django.db import transaction, IntegrityError
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.decorators import login_required
from exam.models import Subject
from exam.enums import ResponseMsg, ResponseStatusInt
from exam.views.ResponseStatusData import ResponseStatusData
import datetime


@transaction.atomic
@login_required
def subjectInsert(request):
    if (request.method == "POST"):
        subjectID = request.POST.get('subjectID')
        subjectName = request.POST.get('subjectName')
        mcqTotalTest = request.POST.get('mcqTotalTest')
        essayTotalTest = request.POST.get('essayTotalTest')

        responseData = ResponseStatusData()
        try:
            with transaction.atomic():
                if (subjectID):
                    Subject.objects.filter(subject_id=subjectID).update(subject_name=subjectName,
                                                                        mcq_total_test=mcqTotalTest,
                                                                        essay_total_test=essayTotalTest,
                                                                        approver=request.user.id,
                                                                        datetime=datetime.datetime.now())
                    return responseData.responseStatusData(ResponseStatusInt.SUCCESS, ResponseMsg.UPDATE_SUCCESS)
                else:
                    Subject.objects.create(subject_name=subjectName, mcq_total_test=mcqTotalTest,
                                           essay_total_test=essayTotalTest, approver=request.user.id,
                                           datetime=datetime.datetime.now()).save()
                    return responseData.responseStatusData(ResponseStatusInt.SUCCESS, ResponseMsg.INSERT_SUCCESS)
        except IntegrityError:
            return responseData.responseStatusData(ResponseStatusInt.FAILURE, ResponseMsg.TRANSC_FAILED)
    else:
        return HttpResponse(ResponseMsg.HTTP_ERROR_MSG)


@login_required
def subjectAvailableCheck(request):
    if (request.method == "GET"):
        subjectName = request.GET.get('subjectName')
        isSubjectAvailable = Subject.objects.filter(subject_name=subjectName)
        if (isSubjectAvailable):
            return JsonResponse(ResponseMsg.SUBJECT_USED, safe=False)
        else:
            return JsonResponse(ResponseMsg.BOOL_TRUE, safe=False)
    else:
        return HttpResponse(ResponseMsg.HTTP_ERROR_MSG)
