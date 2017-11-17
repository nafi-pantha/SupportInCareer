from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator

class Subject(models.Model):
    #subject_id = models.IntegerField(validators=[MaxValueValidator(3),MinValueValidator(3)],primary_key=True)
    subject_id = models.AutoField(primary_key=True)
    subject_name = models.CharField(max_length = 20)
    mcq_total_test = models.IntegerField()
    essay_total_test = models.IntegerField()
    approver = models.CharField(max_length=50,null=True,blank=True)
    datetime = models.DateTimeField()

