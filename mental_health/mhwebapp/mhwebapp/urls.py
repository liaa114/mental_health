from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('mh_app.urls'), name='index'),
    path('psy_login/', include('psy_login.urls'), name='psylog'),
    path('patient_login/', include('patient_login.urls'), name='patientlog'),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)