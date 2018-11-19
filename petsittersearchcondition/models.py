from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from django.contrib.auth.models import User

@python_2_unicode_compatible
class Petsittersearchcondition(models.Model): 
	searchterms_id = models.AutoField(primary_key=True) 
	id = models.OneToOneField(User, on_delete=models.CASCADE)
	termsname = models.CharField(max_length=50, null=False)
	
	def __str__(self):
		return str(self.searchterms_id)