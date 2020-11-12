from django.db import models
from datetime import datetime


# CityDict        城市信息
class CityDict(models.Model):
    name = models.CharField('城市', max_length=20)
    desc = models.CharField('描述', max_length=200)
    add_time = models.DateTimeField(default=datetime.now)

    class Meta:
        verbose_name = '城市'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

# CourseOrg  课程机构基本信息
class CourseOrg(models.Model):
    ORG_CHOICES = (
        ("pxjg", u"培训机构"),
        ("gx", u"高校"),
        ("gr", u"个人"),
    )

    name = models.CharField(verbose_name='机构名称',max_length=50)
    desc = models.TextField(verbose_name='机构描述')
    click_nums = models.IntegerField(verbose_name='点击数',default=0)
    students = models.IntegerField("学习人数", default=0)
    course_nums = models.IntegerField("课程数", default=0)
    fav_nums = models.IntegerField(verbose_name='收藏数',default=0)
    image = models.ImageField(verbose_name='封面图',upload_to='org/%Y%m',max_length=100)
    address = models.CharField(verbose_name='机构地址',max_length=150,)
    city = models.ForeignKey(CityDict,verbose_name='所在城市',on_delete=models.CASCADE)
    add_time = models.DateTimeField(default=datetime.now)



    category = models.CharField(max_length=20, choices=ORG_CHOICES, verbose_name=u"机构类别", default="pxjg")

    def __str__(self):
        return self.name
    class Meta:
        verbose_name = '课程机构'
        verbose_name_plural = verbose_name

    def get_teacher_nums(self):
        #获取机构教师数
        return self.teacher_set.all().count()


# Teacher       教师基本信息
class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg,verbose_name='所属机构',on_delete=models.CASCADE)
    name = models.CharField(verbose_name='教师名',max_length=50)
    teacher_age = models.IntegerField('年龄', default=25)
    work_years = models.IntegerField(verbose_name='工作年限',default=0)
    work_company = models.CharField(verbose_name='就职公司',max_length=50)
    work_position = models.CharField(verbose_name='公司职位',max_length=50)
    points = models.CharField(verbose_name='教学特点',max_length=50)
    click_nums = models.IntegerField(verbose_name='点击数',default=0)
    fav_nums = models.IntegerField(verbose_name='收藏数',default=0)
    add_time = models.DateTimeField(default=datetime.now)
    image = models.ImageField(verbose_name='封面图',upload_to='image/%Y%m',max_length=100,null=True)
    class Meta:
        verbose_name = '教师'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "[{0}]的教师: {1}".format(self.org, self.name)