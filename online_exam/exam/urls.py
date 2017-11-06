from django.conf.urls import url
from exam import views

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^userinfo/$',views.userInfoInsert,name='user_info'),
    url(r'^user_info_update/(?P<pk>\d+)$',views.userInfoUpdate,name='user_info_update'),
    url(r'^subject/$',views.subjectInsert,name='subject'),
    url(r'^test/$',views.getAllSubjectList,name='test'),
]
