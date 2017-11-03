from django.db import models
from django.core.validators import MaxLengthValidator, MinLengthValidator
from exam.allmodels import TestModel


class EssayQuestion(models.Model):
    essay_question_id = models.IntegerField(validators=[MaxLengthValidator(2),MinLengthValidator(2)],primary_key=True)
    test_id = models.ForeignKey('exam.Test')
    essay_question = models.TextField()
    essay_question_marks = models.IntegerField()
    approver = models.CharField(max_length=50)
    datetime = models.DateTimeField()
