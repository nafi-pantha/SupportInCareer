from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator

class UserInfo(models.Model):
    user_id = models.IntegerField(validators=[MaxValueValidator(7),MinValueValidator(7)],primary_key=True)
    user_name = models.CharField(max_length=50)
    user_contact = models.CharField(max_length=11,validators=[MaxValueValidator(7),MinValueValidator(7)])
    user_image = models.ImageField(upload_to='profile_pics',blank=True,null=True)
    user_email = models.EmailField()
    user_status = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    user_password  = models.CharField(max_length=11,validators=[MinValueValidator(7)])
    approver = models.CharField(max_length=200,null=True,blank=True)
    datetime = models.DateTimeField()
