from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

@python_2_unicode_compatible
class Educationalcost(models.Model):
	unitcost_id = models.AutoField(primary_key=True)
	headcount = models.IntegerField(default=0, null=False)
	price = models.IntegerField(default=0, null=False)
	
	def __str__(self):
		return str(self.unitcost_id)