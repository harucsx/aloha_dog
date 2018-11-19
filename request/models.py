from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from django.contrib.auth.models import User
from dog.models import Dog

@python_2_unicode_compatible
class Request(models.Model):
	request_id = models.AutoField(primary_key=True)
	id = models.OneToOneField(User, on_delete=models.CASCADE, null=False)
	dog_id = models.OneToOneField(Dog, on_delete=models.CASCADE, null=False)
	requestdate = models.DateTimeField(auto_now=False, null=False)
	approvalwhether = models.BooleanField(default=False)
	approvaldate = models.DateTimeField(null=False)
	premeetdate = models.DateTimeField(null=False) 
	carestartdate = models.DateTimeField(null=False)
	careenddate = models.DateTimeField(null=False)
	totalprice = models.IntegerField(default=0)	
	
	def __str__(self):
		return str(self.request_id)