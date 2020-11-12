from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth import login,authenticate,logout
from django.contrib.auth.backends import ModelBackend  #
from .models import UserProfile,EmailVerifyRecord
from django.db.models import Q   #Q表达式
from .form import LoginForm,RegisterForm,ForgetpwdForm,ModifyPwdForm,UploadImageForm
from django.contrib.auth.hashers import make_password  #加密password
from apps.utils.email_send import send_register_eamil
from django.views.generic.base import View
from apps.utils.mixin_utils import LoginRequiredMixin
import json
#邮箱和用户名都可以登录
# 基础ModelBackend类，因为它有authenticate方法

def index(request):
    return render(request,"../templates/operation/index.html")
#
# 增加邮箱登录
#  让用户可以通过邮箱或者用户名都可以登录，用自定义authenticate方法
# 这里是继承ModelBackend类来做的验证
class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            #不希望用户存在两个，  get只能有一个，两个是get失败的一种原因，Q为并集查询
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            #后面注册是时候加上判断手机号是否已经存在，在数据库中的字段也修改为 唯一性
            #django的后台中密码加密：所以不能password= password
            #UserProfile继承的AbstractUser 中有check_password(self,raw_password)
            if user.check_password(password):
                return user
        except Exception as e:
            return None




class LoginView(View):
    def get(self,request):
        return render(request, '../templates/operation/login.html')

    def post(self,request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            # 获取用户提交的用户名和密码
            user_name = request.POST.get('username', None)
            pass_word = request.POST.get('password', None)
            print(user_name,pass_word)
            # 成功返回user对象,失败None
            user = authenticate(username=user_name, password=pass_word)
            # 如果不是null说明验证成功
            if user is not None:
                if user.is_active:
                    # 登录
                    login(request, user)
                    return render(request, '../templates/operation/index.html',{'user':user})
                else:
                    return render(request,'../templates/operation/login.html',{"msg":"用户还未激活，不可登录哦!"})
            else:
                return render(request, '../templates/operation/login.html', {'msg': '用户名或密码错误'})

        # form.is_valid（）已经判断不合法了，所以这里不需要再返回错误信息到前端了
        else:
            return render(request, "../templates/operation/login.html", {'login_form': login_form})


class RegisterView(View):
    '''用户注册'''
    def get(self,request):
        register_form = RegisterForm()
        return render(request,'../templates/operation/register.html',{"register_form":register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get('email', None)
            # 如果用户已存在，则提示错误信息
            if UserProfile.objects.filter(email=user_name):
                return render(request,"../templates/operation/register.html",{"register_form":register_form})
            pass_word =  register_form.cleaned_data.get("password")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.is_active = False
            #对需要加密的数据进行加密
            user_profile.password =make_password(pass_word)
            try:
                send_register_eamil(user_name,"register")
                user_profile.save()
                return render(request, '../templates/operation/login.html')
            except Exception as e:
                return render(request,"../templates/operation/register.html",{"register_form":register_form,"msg":"此邮箱不是真实存在的"})
        else:
            return render(request,"../templates/operation/register.html",{"register_form":register_form})

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
            return render(request,'../templates/operation/active_fail.html')
        # 激活成功跳转到登录页面
        return render(request, "../templates/operation/login.html", )


#找回密码
#如果是get请求，返回找回密码第一步发送邮箱验证页面
#post是提交的表单，提取到指定的email发送邮件，格式为forget
#没发送完则原页面不动
class ForgetpwdView(View):
    '''找回密码'''
    def get(self,request):
        forget_form = ForgetpwdForm()
        return render(request,'../templates/operation/send_success.html',{'forget_form':forget_form})


    def post(self,request):
        forget_form = ForgetpwdForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get('email', None)
            send_register_eamil(email, 'forget')
            return render(request, '../templates/operation/send_success.html')
        else:
            return render(request, '../templates/operation/forgetpwd.html', {'forget_form': forget_form})

#重置密码
#接受到有点用户点击链接，来到次视图验证，
#去数据库内查询邮箱验证码所对应的email
#如果有此邮件记录，则返回到具体修改密码的页面

#提出异议：
    #如果发送邮件后，不应该在别处跳转进入程序，应该继续在此页面，完成接下来的动作，
#   1，添加一个按钮，完成验证，点击此处，
            #验证完成后来到此页面，点击按钮，跳转判断，是否完成，没有返回此页面，和msg提示
            #完成就跳转到修改密码的页面
#    2，在邮箱验证完成后返回的提示消息，验证完成，
#             添加一个路由跳转

#找回密码连接
class ResetView(View):

    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request, "../templates/operation/password_reset.html", {"email":email})
        else:
            return render(request, "../templates/operation/active_fail.html")
        return render(request, "../templates/operation/login.html")

#修改密码
class ModifyPwdView(View):
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            email = request.POST.get("email", "")
            if pwd1 != pwd2:
                return render(request, "../templates/operation/password_reset.html", {"email":email, "msg":"密码不一致！"})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd2)
            user.save()

            return render(request, "../templates/operation/login.html")
        else:
            email = request.POST.get("email", "")
            return render(request, "../templates/operation/password_reset.html", {"email":email, "modify_form":modify_form })



class UserinfoView(LoginRequiredMixin,View):
    '''用户个人信息'''
    def get(self,request):
        return render(request,'../templates/users/usercenter-info.html',{})

class UploadImageView(LoginRequiredMixin,View):
    '''用户图像修改'''
    def post(self,request):
        #上传的文件都在request.FILES里面获取，所以这里要多传一个这个参数
        image_form = UploadImageForm(request.POST,request.FILES)
        if image_form.is_valid():
            image = image_form.cleaned_data['image']
            request.user.image = image
            request.user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')


class UpdatePwdView(View):
    """
    个人中心修改用户密码
    """
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail","msg":"密码不一致"}',  content_type='application/json')
            user = request.user
            user.password = make_password(pwd2)
            user.save()

            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type='application/json')

class SendEmailCodeView(LoginRequiredMixin, View):
    '''发送邮箱修改验证码'''
    def get(self,request):
        email = request.GET.get('email','')

        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已存在"}', content_type='application/json')

        send_register_eamil(email,'update_email')
        return HttpResponse('{"status":"success"}', content_type='application/json')

# logout
def log_out(request):
    logout(request)
    return render(request,"../templates/operation/index.html")