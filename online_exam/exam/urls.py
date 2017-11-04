from django.conf.urls import url
from exam import views

urlpatterns = [

url(r'^$',views.index,name='index'),
url(r'^userinfo/$',views.userInfoInsert,name='user_info'),
url(r'^subject/$',views.subjectInsert,name='subject'),

]
