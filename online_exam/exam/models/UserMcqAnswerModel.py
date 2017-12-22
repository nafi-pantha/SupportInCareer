from django.db import models
from django.contrib.auth.models import User

class UserMcqAnswer(models.Model):
    user = models.ForeignKey('exam.UserInfo')
    test_id = models.ForeignKey('exam.Test')
    mcq_question_id=models.ForeignKey('exam.McqQuestion')
    user_answer = models.IntegerField()
    datetime = models.DateTimeField(null=True)