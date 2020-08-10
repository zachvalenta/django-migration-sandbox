from django.contrib import admin
from django.urls import include, path

from api.views import healthcheck

urlpatterns = [
    path('admin/', admin.site.urls),
    path('healthcheck/', healthcheck, name="hc"),
    path('api/', include('api.urls')),
]
