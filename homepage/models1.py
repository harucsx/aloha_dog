from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

SEX_CHOICES = (('M', '남자'), ('F', '여자'))
MEMBER_SHIP_LEVEL_CHOICES = (('member', '일반회원'), ('sitter', '시터'), ('manager', '관리자'))

class User(models.Model):
    user_id = models.CharField(max_length=200, verbose_name='회원 아이디')
    name = models.CharField(max_length=50, verbose_name='회원 이름')
    sex = models.CharField(max_length=1, choices=SEX_CHOICES, verbose_name='회원 성별', default='F')
    birth_date = models.DateField(verbose_name='회원 생일')
    phone_number = models.CharField(max_length=20, verbose_name='회원 핸드폰번호')
    email = models.EmailField(max_length=50, verbose_name='회원 이메일')
    address1 = models.CharField(max_length=50, verbose_name='회원 주소1')
    address2 = models.CharField(max_length=50, verbose_name='회원 주소2')
    address3 = models.CharField(max_length=50, verbose_name='회원 주소3')
    profile = models.FileField(upload_to='uploads/', verbose_name='회원 사진')
    registration_datetime = models.DateTimeField(auto_now=True, verbose_name='회원가입일')
    member_ship_level = models.CharField(max_length=10, verbose_name='회원 등급', choices=MEMBER_SHIP_LEVEL_CHOICES, default='member')

    def __str__(self):
        return str(self.user)