from django.db import models
from django.core.validators import MaxLengthValidator, MinLengthValidator



class EssayQuestion(models.Model):
    essay_question_id = models.IntegerField(validators=[MaxLengthValidator(2),MinLengthValidator(2)])
    test_id = models.ForeignKey('exam.Test')
    essay_question = models.TextField(null=True,blank=True)
    essay_question_marks = models.IntegerField(null=True,blank=True)
    approver = models.CharField(max_length=50,null=True,blank=True)
    datetime = models.DateTimeField()
