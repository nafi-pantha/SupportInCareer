from django.conf.urls import url
from exam import views

urlpatterns = [

url(r'^$',views.index,name='index'),
url(r'^user_info/$',views.userinfoview,name='user_info_view'),
url(r'^user_info_update/(?P<pk>\d+)$',views.user_info_update,name='user_info_update'),
url(r'^subject_form/$',views.CreateSubjectView.as_view(),name='subject_insert'),

]
