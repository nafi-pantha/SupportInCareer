from django import forms
from exam.models import UserInfo

class UserInfoForm(forms.ModelForm):
    class Meta():
        model= UserInfo
        fields = ('user_image',)
