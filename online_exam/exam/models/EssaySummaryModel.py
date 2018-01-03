from django.db import models
from django.core.validators import MaxLengthValidator, MinLengthValidator



class EssaySummary(models.Model):
    test_id = models.ForeignKey('exam.Test')
    essay_summary_details = models.TextField()
    approver = models.CharField(max_length=50,null=True,blank=True)
    datetime = models.DateTimeField()

