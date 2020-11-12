from django.urls import path
from django.views.generic import TemplateView
from . import views
app_name ="users"
urlpatterns =[
    path("",views.index,name="index"),
    path("login/",views.LoginView.as_view(),name="login"),
    path("register/",views.RegisterView.as_view(),name="register"),
    path("active/<active_code>",views.ActiveUserView.as_view(),name="active"),
    path("forget/",views.ForgetpwdView.as_view(),name="forget_pwd"),
    path("reset/<active_code>/",views.ResetView.as_view(),name="reset_pwd"),
    path('modify_pwd/', views.ModifyPwdView.as_view(), name='modify_pwd'),
    path('log_out/', views.log_out, name='logout'),
    path("info/",views.UserinfoView.as_view(),name="user_info"),
    path("image/upload", views.UploadImageView.as_view(), name='image_upload'),
    path("update/pwd/", views.UpdatePwdView.as_view(), name='update_pwd'),
    path("sendemail_code/", views.SendEmailCodeView.as_view(),name='sendemail_code'),
]