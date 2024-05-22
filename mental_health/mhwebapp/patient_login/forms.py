from django import forms
from django.contrib.auth.forms import AuthenticationForm
from mh_app.models import Patient, Consultation
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class Formpatientlog(AuthenticationForm):
    username = forms.CharField(
        widget = forms.TextInput(attrs={'class':'form-control','type':'text','placeholder': 'Username'})
    )
    password = forms.CharField(
        widget = forms.PasswordInput(attrs={'class':'form-control','placeholder': 'Password'})
    )

    class Meta:
        model = Patient
        fields = ['username', 'password']

class Formpatientregistration(UserCreationForm):
    username = forms.CharField(
        widget = forms.TextInput(attrs={'class':'form-control','type':'text','placeholder': 'Username'})
    )
    password1 = forms.CharField(
        widget = forms.PasswordInput(attrs={'class':'form-control','placeholder': 'Password'})
    )
    password2 = forms.CharField(
        widget = forms.PasswordInput(attrs={'class':'form-control','placeholder': 'Password Confirmation'})
    )
    photo = forms.ImageField(label='Select a profile picture', required=False)

    class Meta:
        model = User
        fields = ['username', 'password1', 'password2','photo']
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control', 'type': 'text'}),
            'password1': forms.PasswordInput(attrs={'class': 'form-control', 'type': 'password'}),
            'password2': forms.PasswordInput(attrs={'class': 'form-control', 'type': 'password'}),
        }

class ConsultationForm(forms.ModelForm):
    class Meta:
        model = Consultation
        fields = ['date']

class PatientProfileForm(forms.ModelForm):
    first_name = forms.CharField(max_length=30, required=False)
    last_name = forms.CharField(max_length=30, required=False)
    email = forms.EmailField(required=False)
    photo = forms.ImageField(label='Select a profile picture', required=False)
    phone = forms.CharField(max_length=15, required=False, label='Phone')

    class Meta:
        model = Patient
        fields = ['first_name', 'last_name', 'email', 'photo', 'phone']
