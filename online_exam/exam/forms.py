from django import forms
from exam.models import Subject

class SubjectForm(forms.ModelForm):
    class Meta():
        model = Subject
        fields ='__all__'
