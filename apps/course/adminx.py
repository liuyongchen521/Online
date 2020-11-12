import xadmin
from apps.course.models import Course,CourseResource,Video,Lesson


class CourseAdmin(object):
    '''课程'''

    list_display = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students'] #显示列表
    search_fields = ['name', 'desc', 'detail', 'degree', 'students'] #用于查询的字段
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students'] #用于过滤的字段


class LessonAdmin(object):
    '''章节'''

    list_display = ['course', 'name', 'add_time'] #默认显示的字段
    search_fields = ['course', 'name']  #查询字段
    # 这里course__name是根据课程名称过滤
    list_filter = ['course__name', 'name', 'add_time']


class VideoAdmin(object):
    '''视频'''

    list_display = ['lesson', 'name', 'add_time'] #显示的字段
    search_fields = ['lesson', 'name'] #查询的字段
    list_filter = ['lesson', 'name', 'add_time'] #过滤的字段


class CourseResourceAdmin(object):
    '''课程资源'''

    list_display = ['course', 'name', 'download', 'add_time'] #显示字段
    search_fields = ['course', 'name', 'download'] #查询字段
    list_filter = ['course__name', 'name', 'download', 'add_time'] #过滤字段


# 将管理器与model进行注册关联
xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)

