from django.urls import path
from . import views
app_name = "org"
urlpatterns = [
    path('org_list/',views.OrgView.as_view(),name ='org_list'),#显示的是课程机构的列表页
    path("add_ask/", views.AddUserAskView.as_view(),name="add_ask"),#添加用户咨询信息
    path("home/<org_id>",views.OrgHomeView.as_view(),name="home"), #配置机构详情的页面
    path("course/<org_id>",views.OrgCourseView.as_view(),name="org_course"), #配置机构课程列表的页面
    path("desc/<org_id>",views.OrgDescView.as_view(),name="desc"), #配置机构课程详情的页面
    path("teaCher/<org_id>",views.OrgTeacherView.as_view(),name="teacher"),#配置机构课程详情的页面
    path("add_fav/",views.AddFavView.as_view(),name="add_fav"),#配置机构课程详情的页面
    path("teacher/list/",views.TeacherListView.as_view(),name="teacher_list"),
    path("teacher/detail/<teacher_id>",views.TeacherDetailView.as_view(),name="teacher_detail"),


]