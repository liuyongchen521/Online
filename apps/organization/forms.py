from django import forms
from apps.operation.models import UserAsk

class UserAskForm(forms.ModelForm):
    "我要咨询"
    class Meta:
        model = UserAsk
        fields = ["name","mobile","course_name"]

    def clean_mobile(self):
        """
        验证手机号是否合法
        :return:
        """
        mobile = self.cleaned_data['mobile']
        REGEX_MOBILE = "^1[358]\d{9}$|^147\d{8}$|176\d{8}$|^166\d{8}$"
        import re
        p = re.compile(REGEX_MOBILE)  #编译一个需要的正则表达式
        if p.match(mobile):
            return mobile
        else:
            raise forms.ValidationError(u"手机号非法",code="mobile_invalidat")