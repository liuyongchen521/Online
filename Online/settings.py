"""
Django settings for Online project.

Generated by 'django-admin startproject' using Django 2.2.16.

For more information on this file, see
https://docs.djangoproject.com/en/2.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.2/ref/settings/
"""

import os
import sys
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

#让自定义的文件夹  django可以识别
sys.path.insert(0,BASE_DIR)
sys.path.insert(0,os.path.join(BASE_DIR,"apps"))
# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '_jwq!-kgx**&6**&ygt6&a$mw51g%0)ll2sh+$lnv6jua!mt#j'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = ["*"]


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'xadmin',
    'crispy_forms',
    'reversion',
    "DjangoUeditor",
    "captcha",
    "pure_pagination",

    "apps.users",
    "apps.course",
    "apps.organization",
    "apps.operation",

]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',

]

ROOT_URLCONF = 'Online.urls'

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
                "django.template.context_processors.media",
            ],
        },
    },
]

WSGI_APPLICATION = 'Online.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'lyy_online',        #数据库名字
        'USER': 'root',          #账号
        'PASSWORD': 'password',      #密码
        'HOST': '127.0.0.1',    #IP
        'PORT': '3306',                   #端口
    }
}


# Password validation
# https://docs.djangoproject.com/en/2.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/2.2/topics/i18n/

LANGUAGE_CODE = 'zh-hans'

TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = False


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.2/howto/static-files/
STATIC_ROOT = os.path.join(BASE_DIR,"static")
STATIC_URL = '/static/'

STATICFILES_DIRS= [
    os.path.join(BASE_DIR,"portfolio/static/") #设置static目录用来存放静态文件
]

#自己从写的user表，必须得声明AUTH_USER_MODEL
AUTH_USER_MODEL = "users.UserProfile"

#设置上传的文件路径
MEDIA_URL = "/media/" #资源的url指定为这个路由
MEDIA_ROOT = os.path.join(BASE_DIR,"media")  #路径

AUTHENTICATION_BACKENDS = (   #配置一下authentication的后端使用的是那个
    'apps.users.views.CustomBackend',  #
)
#邮箱的配置
EMAIL_HOST = "smtp.qq.com"  # SMTP服务器主机
EMAIL_PORT = 25             # 端口
EMAIL_HOST_USER = "yongcen.job@qq.com"       # 邮箱地址
EMAIL_HOST_PASSWORD = "njsdoawxjrlobcci"    # 授权码
EMAIL_USE_TLS= True
EMAIL_FROM = "yongcen.job@qq.com"            # 邮箱地址