from django.db import models

class UserResult(models.Model):
    user = models.ForeignKey('exam.UserInfo')
    test_id = models.ForeignKey('exam.Test')
    test_type = models.IntegerField()
    gained_marks = models.IntegerField()
    spend_time = models.DecimalField(max_digits=5, decimal_places=2)
    is_passed = models.BooleanField()
    datetime = models.DateTimeField()
