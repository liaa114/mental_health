from django.urls import path
from . import views

urlpatterns = [
    path('', views.patient_log, name='patient_log'),
    path('patient_dashboard', views.patient_dashboard, name='patient_dashboard'),
    path('patient_logout', views.patient_logout, name='patient_logout'),
    path('patient_profile', views.patient_profile, name='patient_profile'),
    path('patient_registration', views.patient_registration, name='patient_registration'),
    path('pat_orders_request', views.pat_orders_request, name='pat_orders_request'),
    path('pat_orders_onprogres', views.pat_orders_onprogres, name='pat_orders_onprogres'),
    path('pat_orders_completed', views.pat_orders_completed, name='pat_orders_completed'),
    path('search', views.search, name='search'),
    path('order_consultation/<int:psychologist_id>/', views.order_consultation, name='order_consultation'),
    path('checkout/<int:consultation_id>/', views.checkout, name='checkout'),
    path('pat_about_us', views.pat_about_us, name='pat_about_us'),
    path('chat/<int:consultation_id>/', views.patient_chat, name='patient_chat'),
    path('pat_process_order/<int:consultation_id>/', views.pat_process_order, name='pat_process_order'),
    path('rate_consultation/<int:consultation_id>/', views.rate_consultation, name='rate_consultation'),
]
