from django import forms
from exam.models import UserInfo,Subject

class UserInfoForm(forms.ModelForm):
    class Meta():
        model = UserInfo
        fields = '__all__'

class UserInfoUpdateForm(forms.ModelForm):
    class Meta():
        model = UserInfo
        fields = '__all__'

class SubjectForm(forms.ModelForm):
    class Meta():
        model = Subject
        fields = '__all__'        
