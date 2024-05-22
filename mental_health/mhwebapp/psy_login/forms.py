from django import forms
from django.contrib.auth.forms import AuthenticationForm
from mh_app.models import Psychologist

class Formpsylog(AuthenticationForm):
    username = forms.CharField(
        widget = forms.TextInput(attrs={'class':'form-control','type':'text','placeholder': 'Username'})
    )
    password = forms.CharField(
        widget = forms.PasswordInput(attrs={'class':'form-control','placeholder': 'Password'})
    )
    class Meta:
        model = Psychologist
        fields = ['username', 'password']