from django.db import models

from django.contrib.auth.models import AbstractUser
from datetime import datetime

#扩展user表 系统自动生成user表局限性很小，所有我们在这可以扩展user表添加一个手机号码字段

#继承自AbstractUser
class UserProfile(AbstractUser):

    gender_choices=(
        ("male","男"),
        ("female","女")
    )

    nick_name = models.CharField(verbose_name="昵称",max_length=50,default="")
    birthday = models.DateField(verbose_name="生日",null=True,blank=True)
    gender = models.CharField(verbose_name="性别",max_length=10,choices=gender_choices,default="female")
    address = models.CharField(verbose_name="地址",max_length=100,default="")
    mobile = models.CharField(verbose_name="手机号",max_length=11,null=True,blank=True,unique=True)
    image = models.ImageField(upload_to="iamge/%Y%m",default="image/default.png",max_length=100)
    #upload_to :指定存储图片的文件路径，会创建一个image/时间格式化

    class Meta:
        verbose_name="用户信息"
        verbose_name_plural=verbose_name  #名字的复数  比如英文里面name  he names

    def __str__(self):  #设置返回的对象显示的方式
        return self.username


#EmailVerifyRecord - 邮箱验证码
class EmailVerifyRecord(models.Model):
    send_choices = (
        ('register','注册'),
        ('forget','找回密码'),
        ('update_email', '修改邮箱')
    )

    code = models.CharField(verbose_name='验证码',max_length=20)
    email = models.EmailField(verbose_name='邮箱',max_length=50)
    send_type = models.CharField(choices=send_choices,max_length=20)
    send_time = models.DateTimeField(default=datetime.now)

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name


#Banner - 轮播图
class Banner(models.Model):
    title = models.CharField(verbose_name='标题',max_length=100)
    image = models.ImageField(verbose_name='轮播图',upload_to='banner/%Y%m',max_length=100)
    url = models.URLField(verbose_name='访问地址',max_length=200)
    index = models.IntegerField(verbose_name='顺序',default=100)
    add_time = models.DateTimeField(verbose_name='添加时间',default=datetime.now)

    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name