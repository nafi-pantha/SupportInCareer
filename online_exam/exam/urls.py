from django.conf.urls import url
from exam import views

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^userinfo/$',views.userInfoInsert,name='user_info'),
    url(r'^user_info_update/(?P<pk>\d+)$',views.profileUpdate,name='user_info_update'),
    url(r'^subject/$',views.subjectInsert,name='subject'),
    url(r'^test/$',views.getAllSubjectList,name='test'),
    url(r'^test_submit/$',views.testInfoInsert,name='test_submit'),
    url(r'^test_available_check/$',views.testAvailableCheck,name='test_available_check'),
]
