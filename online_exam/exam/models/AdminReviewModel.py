from django.db import models

class AdminReview(models.Model):
    user = models.ForeignKey('exam.UserInfo')
    test_id = models.ForeignKey('exam.Test')
    is_reviewed= models.BooleanField()
    spend_time = models.DecimalField(max_digits=5, decimal_places=2, null=True,blank=True)
    approver = models.CharField(max_length=50,null=True,blank=True)
    datetime = models.DateTimeField()