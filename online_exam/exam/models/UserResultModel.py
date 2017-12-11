from django.db import models

class UserResult(models.Model):
    user = models.ForeignKey('exam.UserInfo')
    test_id = models.ForeignKey('exam.Test')
    test_type = models.IntegerField()
    gained_marks = models.IntegerField()
    spend_time = models.IntegerField()
    is_passed = models.BooleanField()
    datetime = models.DateTimeField()
