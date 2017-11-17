from django.db import models
from django.core.validators import MaxLengthValidator, MinLengthValidator

class McqQuestion(models.Model):
    mcq_question_id = models.IntegerField(validators=[MaxLengthValidator(2),MinLengthValidator(2)])
    test_id = models.ForeignKey('exam.Test')
    mcq_question = models.CharField(max_length=100)
    mcq_option1 = models.CharField(max_length=50)
    mcq_option2 = models.CharField(max_length=50)
    mcq_option3 = models.CharField(max_length=50)
    mcq_option4 = models.CharField(max_length=50)
    mcq_right_answer = models.IntegerField()
    approver = models.CharField(max_length=50,null=True,blank=True)
    datetime = models.DateTimeField()

    def __str__(self):
        return '%s' % (self.test_id)
