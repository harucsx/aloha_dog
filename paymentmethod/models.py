from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

@python_2_unicode_compatible
class  Paymentmethod(models.Model):
	paymentmethod_id = models.AutoField(primary_key=True)
	METHOD_CHOICES = (('카드결제', '카드결제'), ('계좌이체', '계좌이체'), ('무통장입금', '무통장입금'))
	method = models.CharField(max_length=50, choices=METHOD_CHOICES, null=False)

	def __str__(self):
		return str(self.paymentmethod_id)