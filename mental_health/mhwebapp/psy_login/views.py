from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect, get_object_or_404
from mh_app.models import Psychologist, Chat, Consultation
from psy_login.forms import Formpsylog
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.contrib import messages
from django.utils import timezone

@login_required(login_url='psy_log')
def psy_dashboard(request):
    if request.method =='GET':
        if not request.user.is_authenticated and hasattr(request.user, 'psych_profile'):
            return render(request, 'psy_log.html')
        else:
            return render(request, 'psy_dashboard.html')

def psy_log(request):
    if request.method == 'POST':
        form = Formpsylog(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = authenticate(username=username, password=password)
            if user and Psychologist.objects.filter(user=user).count():
                login(request, user)
                return redirect('psy_dashboard')
            else:
                messages.error(request, 'You are a Patient, not a Psychologist')
        else:
            messages.error(request, 'Invalid username or password.')
    else:
        form = Formpsylog()
    return render(request, 'psylog.html', {'form': form})

def psy_logout(request):
    logout(request)
    request.session.flush()
    return redirect('psy_log')

@login_required(login_url='psy_log')
def psy_profile(request):
    if request.method == 'POST' and request.FILES.get('photo'):
        psychologist = request.user.psych_profile 
        photo = request.FILES['photo']
        psychologist.photo = photo
        psychologist.save()
        messages.success(request, 'Profile photo updated successfully')
        return redirect('psy_profile')
    current_psychologist = request.user.psych_profile
    full_name = current_psychologist.user.first_name + ' ' + current_psychologist.user.last_name
    email = current_psychologist.user.email
    phone = current_psychologist.phone
    educations1 = current_psychologist.educations1
    educations2 = current_psychologist.educations2
    
    return render(request, 'psy_profile.html', {
        'full_name': full_name,
        'email': email,
        'phone': phone,
        'educations1': educations1,
        'educations2': educations2,
        'user': request.user
    })

def process_order(request, consultation_id):
    consultation = Consultation.objects.get(pk=consultation_id)
    
    if request.method == 'POST':
        if 'accept_order' in request.POST:
            consultation.status = Consultation.ConsultationStatus.CONFIRMED
            consultation.save()
            sender = request.user
            receiver = consultation.patient.user
            content = "Your consultation request has been accepted. We'll get in touch soon."
            
            new_chat = Chat(content=content, sender=sender, receiver=receiver, consultation=consultation)
            new_chat.time = timezone.now()
            new_chat.save()

            consultation_psychologist = Consultation.objects.get(patient=consultation.patient, psychologist=request.user.psych_profile)
            consultation_psychologist.payment_proof = consultation.payment_proof
            consultation_psychologist.save()
            
            return redirect('orders_onprogres')
        elif 'reject_order' in request.POST:
            consultation.status = Consultation.ConsultationStatus.FINISHED_REJECTED
            consultation.save()
            return redirect('orders_completed')
    
    return HttpResponse("Invalid request!")

def orders_onprogres(request):
    on_progress_consultations = Consultation.objects.filter(
        psychologist=request.user.psych_profile,
        status=Consultation.ConsultationStatus.CONFIRMED
    )
    
    for consultation in on_progress_consultations:
        if consultation.is_expired():
            consultation.status = Consultation.ConsultationStatus.FINISHED_ACCEPTED
            consultation.save()
        else:
            time_elapsed = timezone.now() - consultation.date_created
            time_remaining = timezone.timedelta(days=1) - time_elapsed
            consultation.time_remaining = time_remaining
    
    return render(request, 'orders/onprogres_order.html', {'on_progress_consultations': on_progress_consultations})

def orders_completed(request):
    rejected_consultations = Consultation.objects.filter(
        psychologist=request.user.psych_profile,
        status=Consultation.ConsultationStatus.FINISHED_REJECTED.value
    )
    completed_consultations = Consultation.objects.filter(
        psychologist=request.user.psych_profile,
        status=Consultation.ConsultationStatus.FINISHED_ACCEPTED.value
    )
    return render(request, 'orders/completed_order.html', {
        'rejected_consultations': rejected_consultations,
        'completed_consultations': completed_consultations
    })


def orders_incoming(request):
    incoming_orders = Consultation.objects.filter(
        psychologist=request.user.psych_profile,
        status=Consultation.ConsultationStatus.WAIT_CONFIRMATION.value
    )

    return render(request, 'orders/request_order.html', {'incoming_orders': incoming_orders})

def about_us(request):
    return render(request, 'about_us.html')

def room_chat_psychologist(request, consultation_id):
    consultation = get_object_or_404(Consultation, pk=consultation_id)
    patient = consultation.patient
    
    return render(request, 'psyroom.html', {
        'patient': patient,
        'consultation': consultation,
    })

def psy_chat(request, consultation_id):
    consultation = get_object_or_404(Consultation, pk=consultation_id)
    if request.method == 'POST':
        content = request.POST.get('content')
        if content:
            sender = request.user
            receiver = consultation.patient.user
            new_chat = Chat(content=content, sender=sender, receiver=receiver, consultation=consultation)
            new_chat.time = timezone.now()
            new_chat.save()
            return redirect('psy_chat', consultation_id=consultation_id)
    chats = Chat.objects.filter(consultation=consultation).order_by('time')
    return render(request, 'psy_chat.html', {'consultation': consultation, 'chats': chats})