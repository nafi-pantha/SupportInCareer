from django.conf.urls import url
from exam import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    url(r'^$',views.userLogin,name='home'),
    url(r'user_login/$',views.testLogin,name='user_login'),

    #User Section
    url(r'^user_update/$',views.userUpdate,name='user_update'),

    #Subject Section
    url(r'^subject_insert/$',views.subjectInsert,name='subject_insert'),
    url(r'^subjectname_Check/$',views.subjectAvailableCheck,name='subjectname_Check'),

    #Test Section
    url(r'^test/$',views.getAllSubjectList,name='test'),
    url(r'^test_submit/$',views.testInfoInsert,name='test_submit'),
    url(r'^test_info/$',views.getTestInfo,name='test_info'),
    url(r'^test_available_check/$',views.testAvailableCheck,name='test_available_check'),
    url(r'^testname_Check/$',views.testNameCheck,name='testname_Check'),

    #Login Register
    url(r'^user_registration/$',views.userRegistration,name='user_registration'),
    url(r'^username_Check/$',views.usernameAvailableCheck,name='username_Check'),
    url(r'^email_Check/$',views.emailAvailableCheck,name='email_Check'),
    #url(r'^user_login/$',views.userLogin,name='user_login'),

    #MCQ Section
    url(r'^mcq_available_check/$',views.isMcqQuesAvailable,name='mcq_available_check'),
    url(r'^get_mcq_ques_data/$',views.getMcqQuesData,name='get_mcq_ques_data'),
    url(r'^mcq_ques_edit/$',views.mcqQuesEdit,name='mcq_ques_edit'),
    url(r'^test_list/$',views.getAllTestList,name='test_list'),
    url(r'^mcq_paper_submit/$',views.mcqQuesPaperSubmit,name='mcq_paper_submit'),

    # Essay Section
    url(r'^essay_paper_submit/$',views.essayQuesPaperSubmit,name='essay_paper_submit'),
    url(r'^essay_available_check/$',views.isEssayQuesAvailable,name='essay_available_check'),
    url(r'^get_essay_ques_data/$',views.getEssayQuesData,name='get_essay_ques_data'),
    url(r'^essay_ques_edit/$',views.essayQuesEdit,name='essay_ques_edit'),

    #User Section
    url(r'^getUserList/$',views.getUserList,name='getUserList'),

    #UP MCQ Exam Section
    url(r'^test_info_list/$',views.test_info_list,name='test_info_list'),
    url(r'^ques_info/$',views.ques_info,name='ques_info'),

    url(r'^mcq_ans_submit/$',views.mcq_ans_submit,name='mcq_ans_submit'),
    url(r'^user_test_id/$',views.user_test_id,name='user_test_id'),
    url(r'^get_user_result/$',views.get_user_result,name='get_user_result'),

    #UP Essay Exam Section
    url(r'^essay_ques_info/$',views.essay_ques_info,name='essay_ques_info'),
    url(r'^essay_ans_submit/$',views.essay_ans_submit,name='essay_ans_submit'),
    url(r'^get_essay_summary/$',views.essay_summary_info,name='get_essay_summary'),

    #Review Section
    url(r'^reviewUserList/$',views.reviewUserList,name='reviewUserList'),
    url(r'^getTestListReview/$',views.getTestListReview,name='getTestListReview'),
    url(r'^getUserAnswerReview/$',views.getUserAnswerReview,name='getUserAnswerReview'),
    url(r'^review_submit/$',views.reviewSubmit,name='review_submit'),

    #System URL's
    url(r'^user_status/$',views.getUserStatus,name='user_status'),
    url(r'^user_type/$',views.getUserType,name='user_type'),
    url(r'^total_ques_no/$',views.getTotalQuesNo,name='total_ques_no'),
    url(r'^test_type/$',views.getTestType,name='test_type'),

    #email verification
    url(r'^activate/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
        views.activate, name='activate'),
    #password reset
    url(r'^password_reset/$', auth_views.password_reset,
        {'template_name':'exam/password_reset_form.html',
        'password_reset_form': views.EmailValidationOnForgotPassword},name='password_reset'),
    url(r'^password_reset/done/$', auth_views.password_reset_done,
        {'template_name':'exam/password_reset_done.html'} ,name='password_reset_done'),
    url(r'^reset/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
        auth_views.password_reset_confirm,{'template_name':'exam/password_reset_confirm.html'},
        name='password_reset_confirm'),
    url(r'^reset/done/$', auth_views.password_reset_complete,
        {'template_name':'exam/password_reset_complete.html'} ,name='password_reset_complete'),

    #Result Section
    url(r'^user_result/$',views.getResult,name='user_result'),
    url(r'^essay_result_details/$',views.getEssayResultDetails,name='essay_result_details'),



]
