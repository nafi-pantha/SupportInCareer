from django.db import models
from exam.allModels import SubjectModel
from django.core.validators import MaxLengthValidator,MinLengthValidator

class Test(models.Model):
    test_id = models.IntegerField(validators=[MaxLengthValidator(3),MinLengthValidator(3)],primary_key=True)
    subject_id = models.ForeignKey('exam.Subject')
    test_name = models.CharField(max_length=20)
    test_totalmarks = models.IntegerField()
    test_totaltimes = models.IntegerField()
    test_type = models.IntegerField()
    approver = models.CharField(max_length=50)
    datetime = models.DateTimeField()
