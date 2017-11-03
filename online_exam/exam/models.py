from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from django.core.validators import MaxLengthValidator,MinLengthValidator

class UserInfo(models.Model):
    user_id = models.IntegerField(primary_key=True)
    user_name = models.CharField(max_length=50)
    user_contact = models.CharField(max_length=11)
    user_image = models.ImageField(upload_to='profile_pics',blank=True)
    user_email = models.EmailField()
    user_status = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    user_password  = models.CharField(max_length=11)
    approver = models.CharField(max_length=200)
    datetime = models.DateTimeField()

class Subject(models.Model):
    subject_id = models.IntegerField(primary_key=True)
    subject_name = models.CharField(max_length = 20)
    mcq_total_questions = models.IntegerField()
    essay_total_questions = models.IntegerField()
    approver = models.CharField(max_length=50)
    datetime = models.DateTimeField()


class Test(models.Model):
    test_id = models.IntegerField(primary_key=True)
    subject_id = models.ForeignKey('exam.Subject')
    test_name = models.CharField(max_length=20)
    test_totalmarks = models.IntegerField()
    test_totaltimes = models.IntegerField()
    test_type = models.IntegerField()
    approver = models.CharField(max_length=50)
    datetime = models.DateTimeField()

class McqQuestion(models.Model):
    mcq_question_id = models.IntegerField(primary_key=True)
    test_id = models.ForeignKey('exam.Test')
    mcq_question = models.CharField(max_length=100)
    mcq_option1 = models.CharField(max_length=50)
    mcq_option2 = models.CharField(max_length=50)
    mcq_option3 = models.CharField(max_length=50)
    mcq_option4 = models.CharField(max_length=50)
    mcq_right_answer = models.IntegerField()
    approver = models.CharField(max_length=50)
    datetime = models.DateTimeField()

class EssayQuestion(models.Model):
    essay_question_id = models.IntegerField(primary_key=True)
    test_id = models.ForeignKey('exam.Test')
    essay_question = models.TextField()
    essay_question_marks = models.IntegerField()
    approver = models.CharField(max_length=50)
    datetime = models.DateTimeField()
