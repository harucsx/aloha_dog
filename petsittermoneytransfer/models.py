from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from django.contrib.auth.models import User
from payment.models import Payment
from request.models import Request

@python_2_unicode_compatible
class Petsittermoneytransfer(models.Model):
	petsittermoneytransfer_id = models.AutoField(primary_key=True, max_length=30)
	payment_id = models.OneToOneField(Payment, on_delete=models.CASCADE, null=True)
	request_id = models.OneToOneField(Request, on_delete=models.CASCADE, null=True)
	id = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
	calculatedate = models.DateTimeField(auto_now_add=True)
	calculateprice = models.IntegerField(default=0)
	CALCULATEBANK_CHOICES = (('1', '국민은행'), ('2', '신한은행'), ('3', '우리은행'), ('4', '하나은행'),
                                ('5', '케이뱅크'), ('6', '카카오뱅크'), ('7', '산업은행'), ('8', '기업은행'), ('9', '한국수출입은행'),
                                ('10', '농협은행'), ('11', '신협은행'), ('12', '대구은행'), ('13', '부산은행'), ('14', '경남은행'),
                                ('15', '광주은행'), ('16', '전북은행'), ('17', '제주은행'))
	calculatebank = models.CharField(max_length=1, choices=CALCULATEBANK_CHOICES, null=False)
	calculatebankcalculatebank = models.CharField(max_length=30)

	def __str__(self):
		return str(self.petsittermoneytransfer_id)