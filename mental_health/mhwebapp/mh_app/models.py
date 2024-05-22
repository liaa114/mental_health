from django.contrib.auth.models import User
from django.db import models
from enum import Enum
from django.utils import timezone

class Psychologist(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='psych_profile')
    cons_price = models.DecimalField(max_digits=20, decimal_places=0)
    photo = models.ImageField(upload_to='psychologist/photos')
    phone = models.CharField(max_length=15, blank=True, null=True)
    educations1 = models.CharField(max_length=100, blank=True, null=True)
    educations2 = models.CharField(max_length=100, blank=True, null=True)
    def __str__(self):
        return (self.user.username)

class Patient(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='patient_profile')
    photo = models.ImageField(upload_to='patient/photos')
    phone = models.CharField(max_length=15, blank=True, null=True)
    def __str__(self):
        return (self.user.username)

class Consultation(models.Model):
    class ConsultationStatus(models.TextChoices):
            WAIT_CONFIRMATION = 'WAIT', 'Wait Confirmation'
            CONFIRMED = 'CONFIRMED', 'Confirmed'
            FINISHED_ACCEPTED = 'FIN_ACCEPTED', 'Finished Accepted'
            FINISHED_REJECTED = 'FIN_REJECTED', 'Finished Rejected'

    cons_id = models.AutoField(primary_key=True)
    date = models.DateField()
    status = models.CharField(
            max_length=20,
            choices=ConsultationStatus.choices,
            default=ConsultationStatus.WAIT_CONFIRMATION
        )
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE, related_name='patient_consultations')
    psychologist = models.ForeignKey(Psychologist, on_delete=models.CASCADE, related_name='psych_consultations')
    date_created = models.DateTimeField(auto_now_add=True)
    rating_given = models.BooleanField(default=False)
    payment_proof = models.ImageField(upload_to='payment_proofs', blank=True, null=True)

    def is_expired(self):
        return timezone.now() - self.date_created > timezone.timedelta(days=1)

class Chat(models.Model):
    chat_id = models.AutoField(primary_key=True)
    content = models.TextField()
    time = models.DateTimeField()
    sender = models.ForeignKey(User, related_name='sender', on_delete=models.CASCADE)
    receiver = models.ForeignKey(User, related_name='receiver', on_delete=models.CASCADE)
    consultation = models.ForeignKey(Consultation, on_delete=models.CASCADE)

class Rating(models.Model):
    SATISFIED = 'Satisfied'
    NOT_SATISFIED = 'Not Satisfied'

    RATING_CHOICES = [
        (SATISFIED, 'Satisfied'),
        (NOT_SATISFIED, 'Not Satisfied'),
    ]

    rate_id = models.AutoField(primary_key=True)
    rate_value = models.CharField(max_length=20, choices=RATING_CHOICES)
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE, related_name='ratings_given')
    psychologist = models.ForeignKey(Psychologist, on_delete=models.CASCADE, related_name='ratings_received')
    consultation = models.ForeignKey(Consultation, on_delete=models.CASCADE, related_name='ratings')
