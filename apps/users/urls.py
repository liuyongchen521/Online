from django.urls import path
from django.views.generic import TemplateView
from . import views
app_name ="users"
urlpatterns =[
    path("",views.IndexView.as_view(),name="index"),                             #首页
    path("login/",views.LoginView.as_view(),name="login"),                      #登录
    path("register/",views.RegisterView.as_view(),name="register"),             #注册
    path("active/<active_code>",views.ActiveUserView.as_view(),name="active"),  #邮箱激活用户路由
    path("forget/",views.ForgetpwdView.as_view(),name="forget_pwd"),            #找回密码，发送邮箱页面

    #邮箱内，找回密码连接，验证存在跳转修改页面，否验证码失效
        #bug：验证码没有时间限制，会一直存放在数据库，应增加一个时间限制，或者访问过后直接删除验证码记录
    path("reset/<active_code>/",views.ResetView.as_view(),name="reset_pwd"),
    path('modify_pwd/', views.ModifyPwdView.as_view(), name='modify_pwd'),      #提交修改密码地址
    path('log_out/', views.log_out, name='logout'),                             #退出登录
    path("info/",views.UserinfoView.as_view(),name="user_info"),                #个人信息页面
    path("image/upload", views.UploadImageView.as_view(), name='image_upload'), #个人中心修改头像地址

    #个人中心修改密码地址，
        #完善，应该增加一个旧密码的提交，和一个忘记旧密码的按钮
        #旧密码，来到视图中跟数据库作比对，相同可以修改，不同返回密码出错
        #或点击忘记密码后，跳转到找回密码页面
    path("update/pwd/", views.UpdatePwdView.as_view(), name='update_pwd'),
    path("sendemail_code/", views.SendEmailCodeView.as_view(),name='sendemail_code'),  #个人中心修改邮箱，发送邮箱验证码地址
    path("update_email/", views.UpdateEmailView.as_view(), name='update_email'),       #个人中心修改邮箱，提交修改表单地址
    path("mycourse/", views.MyCourseView.as_view(), name='mycourse'),                   #我的课程
    path('myfav/org/', views.MyFavOrgView.as_view(), name="myfav_org"),                  # 我的收藏--课程机构
    path('myfav/teacher/', views.MyFavTeacherView.as_view(), name="myfav_teacher"),          # 我的收藏--授课讲师
    path('myfav/course/', views.MyFavCourseView.as_view(), name="myfav_course"),              #我的收藏--课程
    path('my_message/', views.MyMessageView.as_view(), name="my_message"),                    #我的消息
]