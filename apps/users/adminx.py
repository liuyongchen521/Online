import xadmin
from apps.users.models import UserProfile
from xadmin import views

class BaseSetting(object):
    """
    设置主题
    """
    enable_themes= True
    use_bootswatch = True

class GlobalSettings(object):
    """

    设置网站标题和页脚

    """
    site_title = "在线教育平台"
    site_footer  ="Powered By 1906c -2020"
#    设置一个菜单折叠
    menu_style = "accordion"

class UserProfileAdmin(object):
    # detail就是要显示为富文本的字段名
    list_display = ('username','gender','mobile','address')
    search_fields =  ['username','gender','mobile','address']
    list_filter = ['username','gender','mobile','address']

    model_icon = "fa fa-user"
    style_fields = {"address": "ueditor"}
    ordering = ["-date_joined"] #排序 用户最新排在最前
    readonly_fields = ["nick_name"]  #只读属性，只显示不能编辑
    # exclude = ["gender"] #不显示的字段
    list_editable = ["mobile"]  #可在首页编辑的字段
    refresh_times =[3,5]  #自动刷新  3秒 5 秒

xadmin.site.unregister(UserProfile)
xadmin.site.register(UserProfile,UserProfileAdmin)
xadmin.site.register(views.BaseAdminView,BaseSetting)
xadmin.site.register(views.CommAdminView,GlobalSettings)