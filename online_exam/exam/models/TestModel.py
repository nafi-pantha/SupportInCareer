from django.db import models
from django.core.validators import MaxLengthValidator,MinLengthValidator

class Test(models.Model):
    test_id = models.IntegerField(validators=[MaxLengthValidator(3),MinLengthValidator(3)],primary_key=True)
    subject_id = models.ForeignKey('exam.Subject')
    test_name = models.CharField(max_length=20)
    test_totalmarks = models.IntegerField()
    test_totaltimes = models.IntegerField()
    test_type = models.IntegerField()
    test_total_questions = models.IntegerField()
    approver = models.CharField(max_length=50,null=True,blank=True)
    datetime = models.DateTimeField()
