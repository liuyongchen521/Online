from django.urls import path
from . import views

app_name = "course"

urlpatterns=[
    path("list/",views.CourseListView.as_view(),name='course_list'),
    path("course/<int:course_id>",views.CourseDetailView.as_view(),name="course_detail"),
    path("info/<course_id>",views.CourseInfoView.as_view(),name="course_info"),
    path("comment/<course_id>",views.CommentsView.as_view(),name="course_comment"),
    path("add_comment/",views.AddCommentsView.as_view(),name="add_comment"),
    path("video/<video_id>",views.VideoPlayView.as_view(),name="video_play")
]