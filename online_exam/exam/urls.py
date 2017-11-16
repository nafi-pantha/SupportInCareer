from django.conf.urls import url
from exam import views

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^userinfo/$',views.userInfoInsert,name='user_info'),
    url(r'^user_info_update/(?P<pk>\d+)$',views.profileUpdate,name='user_info_update'),
    url(r'^subject/$',views.subjectInsert,name='subject'),
    url(r'^test/$',views.getAllSubjectList,name='test'),
    url(r'^test_submit/$',views.testInfoInsert,name='test_submit'),
    url(r'^test_info/$',views.getTestInfo,name='test_info'),
    url(r'^test_available_check/$',views.testAvailableCheck,name='test_available_check'),
    url(r'^mcq_available_check/$',views.isMcqQuesAvailable,name='mcq_available_check'),
    url(r'^get_mcq_ques_data/$',views.getMcqQuesData,name='get_mcq_ques_data'),
    url(r'^mcq_ques_edit/$',views.mcqQuesEdit,name='mcq_ques_edit'),

    url(r'^test_list/$',views.getAllTestList,name='test_list'),
    url(r'^mcq_paper_submit/$',views.mcqQuesPaperSubmit,name='mcq_paper_submit'),
    url(r'^getMcqQues/$',views.isMcqQuesAvailable,name='getMcqQues'),
]
