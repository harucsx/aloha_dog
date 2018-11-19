from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from django.contrib.auth.models import User

@python_2_unicode_compatible
class Petsitterapplication(models.Model):
	application_id = models.AutoField(primary_key=True)
	id =  models.ForeignKey(User, on_delete=models.CASCADE, null=False)
	informationapproval= models.BooleanField(default=False)
	ANSWER1_CHOICES = (('무직', '무직'), ('주부', '주부'), ('자영업', '자영업'), ('회사원', '회사원'), ('학생', '학생'), ('기타', '기타'))
	answer1 = models.CharField(max_length=20, choices=ANSWER1_CHOICES, null=False)
	ANSWER2_CHOICES = (('1', '예'), ('2', '아니요'))
	answer2 = models.CharField(max_length=1, choices=ANSWER2_CHOICES, null=False)
	ANSWER3_CHOICES = (('1', '1일'), ('2', '2일~7일'), ('3', '7일~23일'), ('4', '14일~20일'), ('5', '21일~31일'))
	answer3 = models.CharField(max_length=1, choices=ANSWER3_CHOICES, null=False)
	ANSWER4_CHOICES = (('1', '예'), ('2', '아니요'))
	answer4 = models.CharField(max_length=1, choices=ANSWER4_CHOICES, null=False)
	ANSWER5_CHOICES = (('1', '예'), ('2', '아니요'))
	answer5 = models.CharField(max_length=1, choices=ANSWER5_CHOICES, null=False)
	ANSWER6_CHOICES = (('1', '예'), ('2', '아니요'))
	answer6 = models.CharField(max_length=1, choices=ANSWER6_CHOICES, null=False)
	answer7 = models.CharField(max_length=200, null=False)
	answer8 = models.CharField(max_length=200, null=False)
	answer9 = models.CharField(max_length=200, null=False)
	APPLICATIONPASS_CHOICES = (('심사중', '심사중'), ('합격', '합격'), ('불합격', '불합격'))
	applicationpass = models.CharField(max_length=20, choices=APPLICATIONPASS_CHOICES, null=False)

	def __str__(self):
		return str(self.application_id)