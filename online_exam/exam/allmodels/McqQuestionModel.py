from django.db import models
from exam.allmodels import TestModel
from django.core.validators import MaxLengthValidator, MinLengthValidator

class McqQuestion(models.Model):
    mcq_question_id = models.IntegerField(validators=[MaxLengthValidator(2),MinLengthValidator(2)],primary_key=True)
    test_id = models.ForeignKey('exam.Test')
    mcq_question = models.CharField(max_length=100)
    mcq_option1 = models.CharField(max_length=50)
    mcq_option2 = models.CharField(max_length=50)
    mcq_option3 = models.CharField(max_length=50)
    mcq_option4 = models.CharField(max_length=50)
    mcq_right_answer = models.IntegerField()
    approver = models.CharField(max_length=50)
    datetime = models.DateTimeField()
