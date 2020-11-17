django在线教育平台的总结
##项目介绍。系统概括
*系统具有完备的用户登录注册以及找回密码功能，用有完整的个人中心
*个人中心：修改头像，修改密码，修改邮箱，可以看到我的课程以及我的收藏，可以删除收藏
导航栏: 公开课，授课讲师，授课机构，全局搜索。
点击公开课–> 课程列表，排序-搜索。热门课程推荐，课程的分页
点击课程–> 课程详情页中对课程进行收藏，取消收藏。富文本展示课程内容。
点击开始学习–> 课程的章节信息，课程的评论信息。课程资源的下载链接。
点击授课讲师–>授课讲师列表页，对讲师进行人气排序以及分页，右边有讲师排行榜
点击讲师的详情页面–> 对讲师进行收藏和分享，以及讲师的全部课程
导航栏: 授课机构有分页，排序筛选功能。
机构列表页右侧有快速提交我要学习的表单。
点击机构–> 左侧：机构首页,机构课程，机构介绍，机构讲师。
后台管理系统可以切换主题。左侧每一个功能都有列表显示, 增删改查，筛选功能。
课程列表页可以对不同字段进行排序。选择多条记录进行删除操作。
课程列表页：过滤器->选择字段范围等,搜索,导出csv，xml，json
课程新增页面上传图片，富文本编辑器，时间选择，添加章节，添加课程资源
日志记录：记录后台人员的操作

##**从模板到整站**

完整的功能实现

前台功能模块

1、基本模块  

登录  注册 找回密码  全局搜索 个人中心

2、课程功能

​	课程管理 讲师管理   授课机构管理   热门推荐   相关课程推荐

3、 用户操作管理

   用户收藏   课程评论

后台管理系统

4、课程管理模块

课程管理  课程资源管理  课程评论管理   轮播课程管理

5、 认证和授权管理

用户管理   组管理  权限管理  用户日志管理

6、机构管理模块

课程机构管理   轮播图管理

##**从0 到上线**

完整的开发流程

0--》 开发环境搭建 ---》 model数据库设计   ---》xadmin搭建后台管理系统和录入数据----》url设计

----》form以及modelform表单设计 ---》template模板设计  》基于class的view实现各功能模块 ---》常见网络攻击与防护---》上线



一、**环境搭建**  

 基于python3.x  django2.2.16  mysql    pip install mysqlclient 

二、**models设计**

项目的开发都是从models设计开始，后台的管理和前端的渲染无非就是对数据库的增删改查，所以models设计的好坏对整个项目的开发起着至关重要的因素

总共分为四个app，users(用户apps), course(课程) ,organization（机构） ,operation（运营）,

**自己想到的设计模型的灵感**：

​			拿到一个content之后，首先将所有的能想到的模型或者是需要建表的，全部先列出来，之后再逐一归类，在根据主次进行管理，定出大类，之间的关联商量清楚。最后定表。

users:

​	UserProfile(用户信息)：用户的昵称，生日，性别，地址，手机号和图像

​	EmailVerifyRecord(邮箱验证码)：验证码。邮箱，发送类型和时间

​	Banner（轮播图） ：标题，轮播图，url ，顺序和添加时间

course：

​	Course(课程)：课程名，描述，详情，等级，学习时长等等

​	Lesson(章节)：课程名，章节名，和添加时间

​	Video（视频）：课程名，视频名，和添加时间

​	CourseResource（课程资源）：课程名，资源，名称，添加

organization:

​	CourseOrg:  名称，描述，点击数，收藏数和封面图

​	CityDict(城市)：名字，描述，和添加时间

​	Teacher(教师）： 所属机构，教师名，工作年限，就职公司等等

operation:

​	UserAsk（用户咨询）：名字，手机号，课程名，和添加时间

​	CourseComments（课程评论）：用户，课程，评论，和添加时间

​	UserFavorite(用户收藏)：用户，数据id 收藏类型，和添加时间

​	UserMessage(用户消息)：接受用户，消息内容，是否已读 和添加时间

​	UserCourse（用户课程）：用户 课程和添加时间



### 2.1.users 用户

自定义userProfile

由于系统自动生成额user表有局限性，但由于我们的开发还需加入以下字段，所以我们得继承自AbstractUser 的基础上天机几个字段，最后迁移。

image字段需要下载pillow库

​		pip install pillow

注册app

必须指定重载AUTH_USER_MODEL

​	AUTH_USER_MODEL = “users.UserProfile”

 设计数据库为Mysql 

user中还需要添加的表(这些功能比较独立):

- EmailVerifyRecord - 邮箱验证码
- Banner - 轮播图

### 2.2.Course 课程

课程app中需要四张表

- Course 课程表
- Lesson 章节信息
- Video  视频
- CourseResource 课程资源

### 2.3.organization 机构

总共三张表

- CourseOrg 课程机构基本信息
- Teacher    教师基本信息
- CityDict    城市信息

### 2.4.operation

总共五张表

- UseAsk 用户咨询
- UserMessage 用户消息表
- CourseComments 用户评论
- UserCourse 用户学习的课程
- UserFavorite 用户收藏

 创建完models后一定要把所有的apps添加到settings的“INSTALLED_APPS”里面 

### 把四个app放到一个文件夹

 但是这时候cmd下还是会报错。需要在settings设置

插入第0是希望它先搜索我们app下东西：

```
import os
import sys
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0,os.path.join(BASE_DIR,'apps'))
```





**[Django+xadmin打造在线教育平台（二）](http://www.cnblogs.com/derek1184405959/p/8592800.html)**



二、xadmin

官方网站：http://x.xuebingsi.com/

官方文档：https://xadmin.readthedocs.io/en/docs-chinese/

步骤如下：

​	1、安装xadmin：pip install https://codeload.github.com/sshwsfc/xadmin/zip/django2

2、配置路由

把admin改成xadmin

```
# urls.py

from django.urls import path

import xadmin

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
]
```

 3、注册app 

```
'xadmin',
'crispy_forms',
'reversion',
```

4、app下的admin删除，新建一个adminx文件

![1604470847942](C:\Users\MECHREVO\AppData\Roaming\Typora\typora-user-images\1604470847942.png)

**在里面实现后台模型注册功能**

```
import xadmin
from apps.users.models import UserProfile
from xadmin import views  #引入此view以便于注册
请看清楚数字顺序
4、设置主题类，并在下面注册
class BaseSettings(object):
	#设置主题
	enable_themes = True #使用主题
	use_bootswatch =True #使用主题
3、设置网站的标题和页脚
class GlableSettings(object):
	site_title = "在线教育平台"   #标题
	site_footer = "Powered By 1906c-2020" #页脚
	
#2、定义UserProfileAdmin,已设置后台显示 继承自object，admin是继承自admin.ModelAdmin的
class UserProfileAdmin(object):
	list_display = ("username","gender","modile") #设置默认显示的哪些字段
	search_fields = ["username","gender","mobile"] #设置可以通过搜索框查询的字段
	list_filter = ["username","gender","mobile"] #设置可以筛选排序的字段，比如过滤性别为女的所有
	model_icon = "fa fa-user"  #根据百度旗下的一个图标库查询的显示图标的设置，xadmin内嵌了此库
	style_fields = {"address":"ueditor"}  #设置富文本编辑器的插件显示，后有详解
	ordering =["-date_joined"] #排序，根据创建时间进行排序 去掉减号就是正序
	readonly_fields = ["nick_name"] #对某字段设置为只读，不可编辑
	exclude = ["gender"] #后台不显示那个字段
	list_editable = ["mobile"] #可在首页编辑的字段，添加了一个小笔图标，点击编辑
	refresh_times = [3,5] #设置自动刷新时间，

#1、注册一下自己扩展完成的UserProfile模型，也同时把UserProfileAdmin类注册一下，但必须先将#UserProfile卸载一下，在一起注册则生效
xadmin.site.unregister(UsreProfile)
xadmin.site.register(UserProfile)
xadmin.site.register(views.BaseAdminView,BaseSetting) #这两个一起注册才有效果
xadmin.site.register(views.CommAdminView,GlabalSettings)  #这两个一起注册才有效果

```

**将上传文件设置为本地存储**

1、在settings里面配置media 的路由和文件路径

MEDIA_URL = "/media/"

MEDIA_ROOT= os.path.join(BASE_DIR,"media") 

2、在url里面配置路由

```
from django.views.static import serve

    path("media/<path:path>",serve,{"document_root":MEDIA_ROOT}), #配置文件存储的路由

```

3、在模型中定义字段时候设置

```
image = models.ImageField(upload_to="iamge/%Y%m",default="image/default.png",max_length=100)
    #upload_to :指定存储图片的文件路径，会创建一个image/时间格式化

```

**增加富文本编辑器**

使用DjangUeditor，由于直接下载的版本是基于python2.7的，不能兼容，所以我们得下载这个

1、访问地址： https://github.com/twz915/DjangoUeditor3/ github网站上下载

解压后，将里面的DjangoUeditor文件夹拷贝到 项目目录下

2、settings中添加app

```
INSTALLED_APPS = [
    'DjangoUeditor',
]
```

3）MxOnline/urls.py

```
 　　# 富文本编辑器url
    path('ueditor/',include('DjangoUeditor.urls' )),
```

4、在models中定义字段的时候使用其models下的UEditorField字段类型

```
class Course(models.Model):
    # detail = models.TextField("课程详情")
    detail = UEditorField(verbose_name=u'课程详情', width=600, height=300, imagePath="courses/ueditor/",
                          filePath="courses/ueditor/", default='')
```

5、在/lib/site-packages/xadmin/plugins/ 下新建一个ueditor插件


    import xadmin
    from xadmin.views import BaseAdminPlugin, CreateAdminView, ModelFormAdminView, UpdateAdminView
    from DjangoUeditor.models import UEditorField
    from DjangoUeditor.widgets import UEditorWidget
    from django.conf import settings
    
    class XadminUEditorWidget(UEditorWidget):
        def __init__(self, **kwargs):
            self.ueditor_options = kwargs
            self.Media.js = None
            super(XadminUEditorWidget,self).__init__(kwargs)
    
    class UeditorPlugin(BaseAdminPlugin):
    ​    	def get_field_style(self, attrs, db_field, style, **kwargs):
    ​        if style == 'ueditor':
    ​            if isinstance(db_field, UEditorField):
    ​                widget = db_field.formfield().widget
    ​                param = {}
    ​                param.update(widget.ueditor_settings)
    ​                param.update(widget.attrs)
    ​                return {'widget':XadminUEditorWidget(**param)}
    ​        return attrs
    ​    
        def block_extrahead(self, context, nodes):
            js  = '<script type="text/javascript" src="%s"></script>' %(settings.STATIC_URL + "ueditor/ueditor.config.js")
            js += '<script type="text/javascript" src="%s"></script>' %(settings.STATIC_URL + "ueditor/ueditor.all.min.js")
            nodes.append(js)
        xadmin.site.register_plugin(UeditorPlugin, UpdateAdminView)
        xadmin.site.register_plugin(UeditorPlugin, CreateAdminView)


​    


 6、xadmin/plugs/__init__.py里面添加ueditor插件 

```
PLUGINS = (
   'ueditor',
)
```

（7）course/adminx.py中使用

```
class CourseAdmin(object):
    #detail就是要显示为富文本的字段名
    style_fields = {"detail": "ueditor"}
```

完成

天天生鲜项目中的富文本编辑器总结



#**完成登录功能**

首页

​	判断一下当前用户是否登陆，登陆就展示用户名和个人信息，否则就显示登陆注册

登录页面

​	在form表单中添加csrf_token的标签，防止跨站伪造攻击，

登录视图



 增加邮箱登录 

  让用户可以通过邮箱或者用户名都可以登录，用自定义authenticate方法 



完善登陆页面的错误信息显示



**主要实现功能**

- 用户输入邮箱、密码和验证码，点注册按钮
- 如果输入的不正确，提示错误信息
- 如果正确，发送激活邮件，用户通过邮件激活后才能登陆
- 即使注册成功，没有激活的用户也不能登陆

**验证码**：

安装 pip install django-simple-captcha

注册一下captcha app在settings中

生成验证码数据库

​	makemigrations  --->  migrate

 在注册页面显示验证码

1、 定义我们的register form:

2、	定义字段 captcha = CapychaFields(error_messages ="验证码错误")  

3、在视图中实例化form表单验证传到页面

​	register_form = RegisterForm()

4、在页面中填写 {{ register_form.captcha }}就ok了。

​	会在页面中生成验证码，提交表单后会验证，成功则成功，失败则返回error_messages的消息

### 发送激活邮件

在Python中已经内置了一个smtp邮件发送模块，Django在此基础上进行了简单地封装，让我们在Django环境中可以更方便更灵活的发送邮件

 所有的功能都在django.core.mail中 

 **首先settings里面设置** 

```
EMAIL_HOST = "smtp.qq.com"  # SMTP服务器主机
EMAIL_PORT = 25             # 端口
EMAIL_HOST_USER = "1184405959@qq.com"       # 邮箱地址
EMAIL_HOST_PASSWORD = "dwjybikexxxxxxxx"    # 密码
EMAIL_USE_TLS= True
EMAIL_FROM = "1184405959@qq.com"            # 邮箱地址
```

#在apps下创建utils包，一个py文件叫email_send

    from random import Random
    from django.core.mail import send_mail
    
    from users.models import EmailVerifyRecord
    from MxOnline.settings import EMAIL_FROM
    
    # 生成随机字符串
    
    def random_str(random_length=8):
        str = ''
        # 生成字符串的可选字符串
        chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
        length = len(chars) - 1
        random = Random()
        for i in range(random_length):
            str += chars[random.randint(0, length)]
        return str
    
    # 发送注册邮件
    
    def send_register_eamil(email, send_type="register"):
        # 发送之前先保存到数据库，到时候查询链接是否存在
        # 实例化一个EmailVerifyRecord对象
        email_record = EmailVerifyRecord()
        # 生成随机的code放入链接
        code = random_str(16)
        email_record.code = code
        email_record.email = email
        email_record.send_type = send_type
    	email_record.save()
    
        # 定义邮件内容:
        email_title = ""
        email_body = ""
    
        if send_type == "register":
            email_title = "NBA注册激活链接"
            email_body = "请点击下面的链接激活你的账号: 		    http://127.0.0.1:8000/active/{0}".format(code)
    
            # 使用Django内置函数完成邮件发送。四个参数：主题，邮件内容，发件人邮箱地址，收件人（是一个字符串列表）
            send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
            # 如果发送成功
            if send_status:
                pass
 **激活用户** 

 在注册页面上发送了激活邮件后，收件者可以点击对应的路由来到此视图实现具体功能

根据邮箱找到对应的用户，然后设置is_active = True来实现 

```
# 激活用户
class ActiveUserView(View):
    def get(self, request, active_code):
        # 查询邮箱验证记录是否存在
        all_record = EmailVerifyRecord.objects.filter(code = active_code)

        if all_record:
            for record in all_record:
                # 获取到对应的邮箱
                email = record.email
                # 查找到邮箱对应的user
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
         # 验证码不对的时候跳转到激活失败页面
        else:
            return render(request,'active_fail.html')
        # 激活成功跳转到登录页面
        return render(request, "login.html", )
```

**总结天天生鲜的注册功能**

***总结爱家项目的注册功能***



## 找回密码

主要需要实现的功能：

- 用户点“忘记密码”，跳到找回密码页面
- 在forgetpwd页面，输入邮箱和验证码成功后，发送邮件提醒
- 通过点击邮件链接，可以重置密码
- 两次密码输的正确无误后，密码更新成功，跳到登录界面

## 授课机构功能

### 模板继承

（1）创建母板

把org-list.html拷贝到templates目录下，新建base.html,剪切org-list.html内容到里面



机构首页路由

```
from organization.views import OrgView

path('org_list/',OrgView.as_view(),name = 'org_list'),
```

（3）机构views

```
class OrgView(View):
    '''课程机构'''
    def get(self,request):
        return render(request,'org-list.html')
```

（4）org-list.html继承base

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
{#templates/org-list.html#}

{% extends 'base.html' %}

{% block title %}
    课程机构列表
{% endblock %}
```

随后在模板中写block 方法，在子板中使用

添加一个models中机构类型的字段，有个人，高校，培训机构，迁移之后在后端可以选择此三个选项

添加城市几个，添加机构几个，机构属于哪个城市

添加机构时候要上传图片，

在项目下面吗新建一个目录‘media’ 用来存放图片，

在settings中配置一下上传文件的路径

MEDIA_URL='/media/'

MEDIA_ROOT=os.path.join(BASE_DIR,'media')  #制定以下根目录

在image字段中设置upload_to= ‘一个路径‘ 就会在media下面新建一个目录存放



### 显示课程机构和城市

写视图函数organization/views.py

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
class OrgView(View):
    '''课程机构'''
    def get(self,request):
        # 取出所有课程机构
        all_orgs = CourseOrg.objects.all()
        org_onums = all_orgs.count()
        # 取出所有城市
        all_citys = CityDict.objects.all()
        return render(request, "org-list.html", {
            "all_orgs": all_orgs,
            "all_citys": all_citys,
            'org_onums':org_onums,
        })
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

（2）修改org-list.html

显示机构总共数量

![img](https://images2018.cnblogs.com/blog/1299879/201803/1299879-20180324140233528-267342101.png)

显示城市

![img](https://images2018.cnblogs.com/blog/1299879/201803/1299879-20180324134853576-773132439.png)

显示机构

![img](https://images2018.cnblogs.com/blog/1299879/201803/1299879-20180324135021295-242157208.png)

![img](https://images2018.cnblogs.com/blog/1299879/201803/1299879-20180324135110032-1070169703.png)



在模板中使用{{ MEDIA_URL}} 必须在settings中TEMPLATE的配置中添加media处理器

’django.core.context_processors. media'

然后也要添加图片相应路径的url路由

```
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')]
        ,
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                #添加图片处理器，为了在课程列表中前面加上MEDIA_URL
                'django.template.context_processors.media',
            ],
        },
    },
]
```

```
from django.views.static import serve
from MxOnline.settings import MEDIA_ROOT


# 处理图片显示的url,使用Django自带serve,传入参数告诉它去哪个路径找，我们有配置好的路径MEDIAROOT
re_path(r'^media/(?P<path>.*)', serve, {"document_root": MEDIA_ROOT })
```

### 分页功能

使用 分页神器 **[django-pure-pagination](https://github.com/jamespacileo/django-pure-pagination)** 分页，github上面有介绍使用方法

 （1）安装

```
pip install django-pure-pagination
```

（2）settings里面添加

```
INSTALLED_APPS = (
    ...
    'pure_pagination',
)
```

 views中使用方法 

引入分页对象

和错误消息方法

```
from pure_pagination.paginator import Paginator,EmptyPage,InvalidPage,PageNotAnInteger
```

```
# 对课程机构进行分页
        # 尝试获取前台get请求传递过来的page参数
        # 如果是不合法的配置参数默认返回第一页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        # 这里指从allorg中取五个出来，每页显示5个
        p = Paginator(all_orgs, 5, request=request)  #对总页面分页，传入每显示页数
        orgs = p.page(page) #得到当前页的对象
```

修改org-list.html

 这里变成 "all_orgs.object_list"

![img](https://images2018.cnblogs.com/blog/1299879/201803/1299879-20180324145117011-669942286.png)

分页功能

<div class="pageturn">
    <ul class="pagelist">
        {% if all_orgs.has_previous %}
            <li class="long"><a href="?{{ all_orgs.previous_page_number.querystring }}">上一页</a></li>
        {% endif %}

        {% for page in all_orgs.pages %}
            {% if page %}
                {% ifequal page all_orgs.number %}
                    <li class="active"><a href="?{{ page.querystring }}">{{ page }}</a></li>
                {% else %}
                    <li><a href="?{{ page.querystring }}" class="page">{{ page }}</a></li>
                {% endifequal %}
            {% else %}
                <li class="none"><a href="">...</a></li>
            {% endif %}
        {% endfor %}
        {% if all_orgs.has_next %}
            <li class="long"><a href="?{{ all_orgs.next_page_number.querystring }}">下一页</a></li>
        {% endif %}
    </ul>
**总结一下天天生鲜中的分页方法**

调用的是django中内置的分页对象

from django.core.paginator import Paginator

参数需要的是 总数据，每页显示多少记录，

Paginator(data,5) #传入数据，每页显示5条

p.num_pages  #是总页数

p.page(page)#传入第几页，得到第几页的对象

逻辑：

1、判断传入的页数是否大于总页数，大于就让显示第一页。

2、根据传入的页码，p.page(page)得到页码对象

3、判断总页数小于5页时，得到一个range(1,总页数+1)的迭代对象，显示的是第一页到总页数+1 的数字

​		不符合时就数据可以分5页以上，在判断当前页<=3 让显示 "..." [1,2,"...",总页数] 的样子，

​		不符合时，当总页数-当前页 <=2 时，让显示 	[1,2,"...",总页数-2，总页数-1，总页数] 的样子

​		不符合时，在判断：

​			当前页 ==4  让显示[1,2,page-1,page,"...",总页数]

​			再不然  让显示	[1,"...",page-1,page,page+1,"...",num_pages]

​	最后得到一个分页显示的列表样子，在模板中循环使用

最后传入模板中使用的是 p() 和 pages

​	![1604662965423](C:\Users\MECHREVO\AppData\Roaming\Typora\typora-user-images\1604662965423.png)

​		

### 列表筛选功能

 **城市列表筛选** 

- 点城市，筛选出对应的课程机构
- 默认“全部”是‘active’状态（绿色），如果点了某个城市，应该城市是‘active’状态
- 当用户点击city时，应该把city的id传到后台，然后后台在传到模板中，是的可以知道哪个城市被选中，然后加上‘’active‘’

 **后台处理city筛选**

 在models中添加学习人数和课程数两个字段 

迁移之后会有课程数，和学习人数的字段，可以查询 排序

```
# 学习人数和课程数筛选
sort = request.GET.get('sort', "")
if sort:
    if sort == "students":
        all_orgs = all_orgs.order_by("-students")
    elif sort == "courses":
        all_orgs = all_orgs.order_by("-course_nums")
```

```
 <div class="head">
        <ul class="tab_header">
            <li class="{% if sort == '' %}active{% endif %}"><a href="?sort=students&ct={{ category }}&city={{ city_id }}">全部</a></li>
            <li class="{% if sort == 'students' %}active{% endif %}"><a href="?sort=students&ct={{ category }}&city={{ city_id }}">学习人数 &#8595;</a></li>
            <li class="{% if sort == 'courses' %}active{% endif %}"><a href="?sort=courses&ct={{ category }}&city={{ city_id }}">课程数 &#8595;</a></li>
        </ul>
    </div>
    #添加高亮
```

### 提交我要学习咨询

（1）用ModelForm来实现

在organazition目录下创建forms.py文件

```
from django import forms
from operation.models import UserAsk


class UserAskForm(forms.Form):
    '''我要咨询'''
    class Meta:
        model = UserAsk
        fields = ['name','mobile','course_name']
```

视图函数

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
from django.http import HttpResponse
from .forms import UserAskForm


class AddUserAskView(View):
    """
    用户添加咨询
    """
    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            # 如果保存成功,返回json字符串,后面content type是告诉浏览器返回的数据类型
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            # 如果保存失败，返回json字符串,并将form的报错信息通过msg传递到前端
            return HttpResponse('{"status":"fail", "msg":"添加出错"}', content_type='application/json')
```

这里要用到Ajax提交，不会对页面整体刷新，应该给前端返回一个Json数据

HttpResponse可以指定传递到前端的数据类型

模板中使用Ajax方式提交

org-list.html

```
<script>
    $(function () {
        $('#jsStayBtn').on('click', function () {
            $.ajax({
                cache: false,
                type: "POST",
                url: "{% url "org:add_ask" %}",
                data: $('#jsStayForm').serialize(),
                async: true,
                success: function (data) {
                    if (data.status == 'success') {
                        $('#jsStayForm')[0].reset();
                        alert("提交成功")
                    } else if (data.status == 'fail') {
                        $('#jsCompanyTips').html(data.msg)
                    }
                },
            });
        });
    })
</script>
Ajax代码说明：
第一行表示：其它代码执行完再执行
给“立即咨询”按钮绑定click事件，点击后执行function()函数里面的代码
cache:false   这个参数默认True，表示缓存，这里改为false，表示不用缓存
type：post    以post方式发送数据
url：把请求发送到哪个url
data:发送到服务器的数据
async:ture   表示异步发送
success:请求成功时执行的回调函数，data是服务器返回过来的数据
因为后台返回的数据是{"status’:"success"}或者{"status’:"fail"},这里做个判断
如果是“success”，则把提交表单里面的数据清空，如果是“fail”，显示错误信息
```

### 机构首页

（1）给courses（课程）添加一个外键

```
course_org = models.ForeignKey(CourseOrg, on_delete=models.CASCADE, verbose_name="所属机构", null=True, blank=True)
```