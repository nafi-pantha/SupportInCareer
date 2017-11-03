from django.db import models
from exam.allModels import UserModel,TestModel

class UserEssayAnswer(models.Model):

    user_id = models.ForeignKey('exam.UserInfo')
    test_id = models.ForeignKey('exam.Test')
    user_answer1 = models.TextField()
    user_answer2 = models.TextField()
    user_answer3 = models.TextField()
    user_answer4 = models.TextField()
    user_answer5 = models.TextField()
    user_answer6 = models.TextField()
    user_answer7 = models.TextField()
    user_answer8 = models.TextField()
    user_answer9 = models.TextField()
    user_answer10 = models.TextField()
    user_answer11 = models.TextField()
    user_answer12 = models.TextField()
    user_answer13 = models.TextField()
    user_answer14 = models.TextField()
    user_answer15 = models.TextField()
    user_answer16 = models.TextField()
