from django.conf.urls import url,include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from exam import views
from django.contrib.auth import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'',include('exam.urls')),
    url(r'accounts/logout/$',views.logout,name='logout',kwargs={'next_page':'/'}),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

