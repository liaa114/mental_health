from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect
from patient_login.forms import Formpatientlog, Formpatientregistration, PatientProfileForm
from django.contrib.auth.decorators import login_required
from mh_app.models import Patient, Psychologist, Consultation, Chat, Rating
from django.contrib.auth.models import User
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.shortcuts import get_object_or_404
from django.utils import timezone
from django.db.models import Avg, Q
from django.http import HttpResponse


@login_required(login_url='patient_log')
def patient_dashboard(request):
    if request.method =='GET':
        if not request.user.is_authenticated and hasattr(request.user, 'patient_profile'):
            return render(request, 'patient.html')
        else:
            psychologists = Psychologist.objects.all()
            return render(request, 'patient_dashboard.html', {'psychologists': psychologists}) 

def patient_log(request):
    if request.method == 'POST':
        form = Formpatientlog(data=request.POST)
        formr = Formpatientregistration(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = authenticate(request, username=username, password=password)
            if user and Patient.objects.filter(user=user).count():
                login(request, user)
                return redirect('patient_dashboard')
            else:
                messages.error(request, 'You are a Psychologist, not a Patient')
        else:
                messages.error(request, 'Invalid username or password.')
    else:
        form = Formpatientlog()
        formr = Formpatientregistration()
    return render(request, 'patient.html', {'form': form, 'formr': formr})


def patient_registration(request):
    form = Formpatientlog()
    if request.method == 'POST':
        formr = Formpatientregistration(request.POST, request.FILES)
        if formr.is_valid():
            username = formr.cleaned_data['username']
            password = formr.cleaned_data['password1']
            photo = formr.cleaned_data['photo']
            user = User.objects.create_user(username=username, password=password)
            patient = Patient(user=user, photo=photo)
            patient.save()
            messages.success(request, 'Account created successfully. Please log in.')
            return redirect('patient_log')
        else:
            print(formr.errors)
    else:
        formr = Formpatientregistration()
    return render(request, 'patient.html', {'form':form, 'formr': formr})

def patient_logout(request):
    logout(request)
    request.session.flush()
    return redirect('patient_log')

@login_required(login_url='patient_log')
def patient_profile(request):
    if request.method == 'POST':
        form = PatientProfileForm(request.POST, request.FILES, instance=request.user.patient_profile)
        if form.is_valid():
            user = request.user
            user.first_name = form.cleaned_data['first_name']
            user.last_name = form.cleaned_data['last_name']
            user.email = form.cleaned_data['email']
            user.save()
            patient = form.save(commit=False)
            patient.user = user
            patient.phone = form.cleaned_data['phone']
            patient.save()
            messages.success(request, 'Profile updated successfully')
            return redirect('patient_profile')
        else:
            messages.error(request, 'Please correct the errors below.')
    else:
        form = PatientProfileForm(instance=request.user.patient_profile)
    
    current_patient = request.user.patient_profile
    full_name = current_patient.user.get_full_name()
    email = current_patient.user.email
    
    return render(request, 'patient_profile.html', {
        'form': form,
        'full_name': full_name,
        'email': email,
        'user': request.user
    })

def pat_process_order(request, consultation_id):
    consultation = Consultation.objects.get(pk=consultation_id)
    
    if request.method == 'POST':
        if 'accept_order' in request.POST:
            consultation.status = Consultation.ConsultationStatus.CONFIRMED
            consultation.save()
            return redirect('pat_orders_onprogres')
        elif 'reject_order' in request.POST:
            consultation.status = Consultation.ConsultationStatus.FINISHED_REJECTED
            consultation.save()
            return redirect('pat_orders_completed')
    
    return HttpResponse("Invalid request!")

def pat_orders_request(request):
    request_orders = Consultation.objects.filter(
        patient=request.user.patient_profile,
        status=Consultation.ConsultationStatus.WAIT_CONFIRMATION.value
    )

    return render(request, 'orders/patincome_order.html', {'request_orders': request_orders})


def pat_orders_onprogres(request):
    on_progress_consultations = Consultation.objects.filter(
        patient=request.user.patient_profile,
        status=Consultation.ConsultationStatus.CONFIRMED
    )
    
    for consultation in on_progress_consultations:
        if consultation.is_expired():
            consultation.status = Consultation.ConsultationStatus.FINISHED_ACCEPTED
            consultation.save()
    
    return render(request, 'orders/patonprogres_order.html', {'on_progress_consultations': on_progress_consultations})

def pat_orders_completed(request):
    accepted_consultations = Consultation.objects.filter(
        patient=request.user.patient_profile,
        status=Consultation.ConsultationStatus.FINISHED_ACCEPTED.value
    )
    rejected_consultations = Consultation.objects.filter(
        patient=request.user.patient_profile,
        status=Consultation.ConsultationStatus.FINISHED_REJECTED.value
    )
    return render(request, 'orders/patcompleted_order.html', {
        'accepted_consultations': accepted_consultations,
        'rejected_consultations': rejected_consultations
    })

def search(request):
    psychologists = Psychologist.objects.all()
    name_query = request.GET.get('name_query')
    order_by_price = request.GET.get('order_by_price')

    if name_query:
        psychologists = psychologists.filter(
            Q(user__first_name__icontains=name_query) | Q(user__last_name__icontains=name_query)
        )

    if order_by_price == 'lowest':
        psychologists = psychologists.order_by('cons_price')
    elif order_by_price == 'highest':
        psychologists = psychologists.order_by('-cons_price')

    psychologists = psychologists.annotate(avg_rating=Avg('ratings_received__rate_value')).order_by('-avg_rating')

    return render(request, 'search.html', {'psychologists': psychologists})

def order_consultation(request, psychologist_id):
    psychologist = get_object_or_404(Psychologist, pk=psychologist_id)
    patient = request.user.patient_profile
    consultation = Consultation(patient=patient, psychologist=psychologist, date=timezone.now())
    consultation.save()
    return HttpResponseRedirect(reverse('checkout', args=(consultation.cons_id,)))

def checkout(request, consultation_id):
    consultation = get_object_or_404(Consultation, pk=consultation_id)
    consultation_price = consultation.psychologist.cons_price
    psychologist_phone = consultation.psychologist.phone
    if request.method == 'POST':
        consultation_date = request.POST.get('consultation_date')
        payment_proof = request.FILES.get('payment_proof')
        if consultation_date:
            consultation.date = consultation_date
            consultation.status = Consultation.ConsultationStatus.WAIT_CONFIRMATION.value
            consultation.payment_proof = payment_proof
            consultation.save()
            order = {
                'psychologist_id': consultation.psychologist.id,
                'date': consultation.date,
                'status': consultation.status,
            }
            if 'orders' in request.session:
                orders = request.session['orders']
                orders.append(order)
                request.session['orders'] = orders
            else:
                request.session['orders'] = [order]
            return redirect('pat_orders_request')
    return render(request, 'checkout.html', {'consultation': consultation, 'consultation_price': consultation_price, 'psychologist_phone': psychologist_phone})

def pat_about_us(request):
    return render(request, 'pat_about_us.html')

def room_chat_patient(request, consultation_id):
    consultation = get_object_or_404(Consultation, pk=consultation_id)
    psychologist = consultation.psychologist
    
    return render(request, 'pat_room.html', {
        'psychologist': psychologist,
        'consultation': consultation,
    })

def patient_chat(request, consultation_id):
    consultation = get_object_or_404(Consultation, pk=consultation_id)
    if request.method == 'POST':
        content = request.POST.get('content')
        if content:
            sender = request.user
            receiver = consultation.psychologist.user
            new_chat = Chat(content=content, sender=sender, receiver=receiver, consultation=consultation)
            new_chat.time = timezone.now()
            new_chat.save()
            return redirect('patient_chat', consultation_id=consultation_id)
    chats = Chat.objects.filter(consultation=consultation).order_by('time')
    return render(request, 'patient_chat.html', {'consultation': consultation, 'chats': chats})

def rate_consultation(request, consultation_id):
    consultation = Consultation.objects.get(pk=consultation_id)
    
    if request.method == 'POST':
        rating_value = request.POST.get('rating')
        if rating_value in ['Satisfied', 'Not Satisfied']:
            new_rating = Rating.objects.create(
                rate_value=rating_value,
                patient=request.user.patient_profile,
                psychologist=consultation.psychologist,
                consultation=consultation
            )
            new_rating.save()
            consultation.rating_given = True
            consultation.save()
            return redirect('pat_orders_completed')
    
    return redirect('pat_orders_completed')