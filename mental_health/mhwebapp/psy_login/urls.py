from django.urls import path
from . import views

urlpatterns = [
    path('', views.psy_log, name='psy_log'),
    path('psy_dashboard', views.psy_dashboard, name='psy_dashboard'),
    path('psy_logout', views.psy_logout, name='psy_logout'),
    path('psy_profile', views.psy_profile, name='psy_profile'),
    path('orders_incoming', views.orders_incoming, name='orders_incoming'),
    path('orders_onprogres', views.orders_onprogres, name='orders_onprogres'),
    path('orders_completed', views.orders_completed, name='orders_completed'),
    path('process_order/<int:consultation_id>/', views.process_order, name='process_order'),
    path('about_us', views.about_us, name='about_us'),
    path('chat/<int:consultation_id>/', views.psy_chat, name='psy_chat'),
]
