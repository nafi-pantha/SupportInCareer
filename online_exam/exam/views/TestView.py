from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse, JsonResponse

from exam.models import Subject


def index(request):

    return render(request,'exam/onlineExam.html',{})

def getAllSubjectList(request):
    if (request.method == "GET"):
        subjectList = Subject.objects.values('subject_id','subject_name','mcq_total_test','essay_total_test')
        return JsonResponse({'results': list(subjectList)})
    else:
        return HttpResponse("Problem")