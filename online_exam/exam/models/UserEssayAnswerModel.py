from django.db import models
from django.contrib.auth.models import User

class UserEssayAnswer(models.Model):
    user = models.ForeignKey('exam.UserInfo')
    test_id = models.ForeignKey('exam.Test')
    essay_question_id=models.ForeignKey('exam.EssayQuestion')
    user_answer = models.TextField()
    suggestions=models.TextField(null=True, blank=True)
    individual_mark=models.IntegerField(null=True, blank=True)
    datetime = models.DateTimeField(null=True)