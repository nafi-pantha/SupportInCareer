from django.db import models
from django.contrib.auth.models import User
from PIL import Image
from django.core.validators import MaxValueValidator, MinValueValidator

class UserInfo(models.Model):
    user = models.OneToOneField(User)
    user_contact = models.CharField(max_length=11,validators=[MaxValueValidator(7),MinValueValidator(7)])
    user_image = models.FileField(upload_to='profile_pics',blank=True,null=True)
    approver = models.CharField(max_length=200,null=True,blank=True)
    datetime = models.DateTimeField()
