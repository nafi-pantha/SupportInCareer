from django.db import models
from exam.allmodels import UserModel,TestModel

class McqAnswer(models.Model):

    user_id = models.ForeignKey('exam.UserInfo')
    test_id = models.ForeignKey('exam.Test')
    user_answer1 = models.IntegerField()
    user_answer2 = models.IntegerField()
    user_answer3 = models.IntegerField()
    user_answer4 = models.IntegerField()
    user_answer5 = models.IntegerField()
    user_answer6 = models.IntegerField()
    user_answer7 = models.IntegerField()
    user_answer8 = models.IntegerField()
    user_answer9 = models.IntegerField()
    user_answer10 = models.IntegerField()
    user_answer11 = models.IntegerField()
    user_answer12 = models.IntegerField()
    user_answer13 = models.IntegerField()
    user_answer14 = models.IntegerField()
    user_answer15 = models.IntegerField()
    user_answer16 = models.IntegerField()
    user_answer17 = models.IntegerField()
    user_answer18 = models.IntegerField()
    user_answer19 = models.IntegerField()
    user_answer20 = models.IntegerField()
    user_answer21 = models.IntegerField()
    user_answer22 = models.IntegerField()
    user_answer23 = models.IntegerField()
    user_answer24 = models.IntegerField()
    user_answer25 = models.IntegerField()
    user_answer26 = models.IntegerField()
    user_answer27 = models.IntegerField()
    user_answer28 = models.IntegerField()
    user_answer29 = models.IntegerField()
    user_answer30 = models.IntegerField()
    user_answer31 = models.IntegerField()
    user_answer32 = models.IntegerField()
    user_answer33 = models.IntegerField()
    user_answer34 = models.IntegerField()
    user_answer35 = models.IntegerField()
    user_answer36 = models.IntegerField()
    user_answer37 = models.IntegerField()
    user_answer38 = models.IntegerField()
    user_answer39 = models.IntegerField()
    user_answer40 = models.IntegerField()
    user_answer41 = models.IntegerField()
    user_answer42 = models.IntegerField()
    user_answer43 = models.IntegerField()
    user_answer44 = models.IntegerField()
    user_answer45 = models.IntegerField()
    user_answer46 = models.IntegerField()
    user_answer47 = models.IntegerField()
    user_answer48 = models.IntegerField()
    user_answer49 = models.IntegerField()
    user_answer50 = models.IntegerField()
