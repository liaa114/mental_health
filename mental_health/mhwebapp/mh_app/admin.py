from django.contrib import admin
from .models import Patient, Psychologist

# Register your models here.
admin.site.register(Psychologist)
admin.site.register(Patient)