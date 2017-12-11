from django.db import models
from django.contrib.auth.models import User

class UserEssayAnswer(models.Model):
    user = models.ForeignKey('exam.UserInfo')
    test_id = models.ForeignKey('exam.Test')
    essay_question_id=models.ForeignKey('exam.EssayQuestion')
    user_answer = models.TextField()