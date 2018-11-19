from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

BANK_NAME_CHOICES = (('1', '국민은행'), ('2', '신한은행'), ('3', '우리은행'), ('4', '하나은행'),
    ('5', '케이뱅크'), ('6', '카카오뱅크'), ('7', '산업은행'), ('8', '기업은행'), ('9', '한국수출입은행'),
    ('10', '농협은행'), ('11', '신협은행'), ('12', '대구은행'), ('13', '부산은행'), ('14', '경남은행'),
    ('15', '광주은행'), ('16', '전북은행'), ('17', '제주은행'))

SEX_CHOICES = (('M', 'Male'), ('F', 'Female'))


class Sitter(models.Model):
    user = models.OneToOneField('User', on_delete=models.CASCADE, verbose_name= "시터이름")
    account_number = models.CharField(max_length=100 ,verbose_name= "계좌번호")
    bank_name = models.CharField(max_length=10, choices=BANK_NAME_CHOICES ,verbose_name= "은행명")
    introduction = models.CharField(max_length=200 ,verbose_name= "시터소개")
    free_services = models.CharField(max_length=100, verbose_name='무료 서비스')
    paid_services = models.CharField(max_length=100, verbose_name='유료 서비스')
    unit_price = models.IntegerField(default=0, verbose_name='시급')

    def __str__(self):
        return str(self.id)


class Dog(models.Model):
    dog_id = models.AutoField(primary_key=True ,verbose_name= "펫아이디")
    dog_name = models.CharField(max_length=50 ,verbose_name= "펫이름")
    species = models.CharField(max_length=50 ,verbose_name= "견종")
    birth_date = models.DateField(verbose_name= "생일")
    weight = models.IntegerField(default=10 ,verbose_name= "몸무게")
    sex = models.CharField(max_length=5, choices=SEX_CHOICES ,verbose_name= "성별")
    neutralization = models.BooleanField(default=True ,verbose_name= "중성화유무")
    profile = models.FileField(upload_to='uploads/' ,verbose_name= "프로필사진")
    vaccination = models.BooleanField(verbose_name= "예방접종유무")

    def __str__(self):
        return str(self.dog_id)


