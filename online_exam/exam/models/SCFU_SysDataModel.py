from django.db import models


class SCFU_UserStatus(models.Model):
    status_id = models.BooleanField(primary_key=True)
    status_name = models.CharField(max_length=10)

class SCFU_UserType(models.Model):
    type_id = models.BooleanField(primary_key=True)
    type_name = models.CharField(max_length=10)

class SCFU_McqTotalTest(models.Model):
    mcq_total_test = models.IntegerField()

class SCFU_EssayTotalTest(models.Model):
    essay_total_test = models.IntegerField()

class SCFU_TestType(models.Model):
    test_type_id = models.IntegerField(primary_key=True)
    test_type_name = models.CharField(max_length=10)

class SCFU_MCQTestTotalQuesNo(models.Model):
    test_ques_no = models.IntegerField()

class SCFU_EssayTestTotalQuesNo(models.Model):
    test_ques_no = models.IntegerField()

class SCFU_TotalTime(models.Model):
    test_time = models.IntegerField()
