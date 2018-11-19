from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from petsitterapplication.models import Petsitterapplication
from educationpaymentmethod.models import Educationpaymentmethod

@python_2_unicode_compatible
class Educationpayment(models.Model):
    educationpayment_id = models.AutoField(primary_key=True)
    application_id = models.OneToOneField(Petsitterapplication, on_delete=models.CASCADE, null=False)
    epaymentmethod_id = models.OneToOneField(Educationpaymentmethod, on_delete=models.CASCADE, null=False)
    paymentdate = models.DateTimeField(auto_now_add=True, null=False)
    DEPOSITBANK_CHOICES = (('1', '국민은행'), ('2', '신한은행'), ('3', '우리은행'), ('4', '하나은행'),
    	('5', '케이뱅크'), ('6', '카카오뱅크'), ('7', '산업은행'), ('8', '기업은행'), ('9', '한국수출입은행'),
    	('10', '농협은행'), ('11', '신협은행'), ('12', '대구은행'), ('13', '부산은행'), ('14', '경남은행'),
    	('15', '광주은행'), ('16', '전북은행'), ('17', '제주은행'))
    depositbank = models.CharField(max_length=1, choices=DEPOSITBANK_CHOICES, null=False)
    depositaccount = models.CharField(max_length=20, null=False)
    approvalnumber = models.CharField(max_length=30, null=False)
    price = models.IntegerField(null=False)

    def __str__(self):
        return str(self.educationpayment_id)