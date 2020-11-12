"""Online URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
import xadmin
from django.urls import path,include
from django.views.static import serve
from Online.settings import MEDIA_ROOT
from django.views.generic import TemplateView
import apps
urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path("media/<path:path>",serve,{"document_root":MEDIA_ROOT}), #配置文件存储的路由
    path("ueditor/",include("DjangoUeditor.urls")),  #富文本编辑器的路由,
    # path("",TemplateView.as_view(template_name='../templates/operation/index.html'),name="index"),
    # path('login/', TemplateView.as_view(template_name='../templates/operation/login.html'),name='login'),
    path("",include("apps.users.urls",namespace="users")),# 包含users app的所有路由
    path("captcha/",include("captcha.urls")), #添加一下 captcha验证码的路由
    path("org/",include("apps.organization.urls",namespace="org")),#包含所有机构的路由
    path("course/",include("apps.course.urls",namespace="course")),#包含所有课程的路由
]
