from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

@python_2_unicode_compatible
class Caringweight(models.Model):
	caringweight_id = models.AutoField(primary_key=True)
	CARINGWEIGHT_CHOICES = (('10kg미만', '~10kg'), ('20kg미만', '~20kg'), ('20kg이상', '20kg~'))
	caringweight = models.CharField(max_length=10, choices=CARINGWEIGHT_CHOICES, null=False)
	weightprice = models.IntegerField(default=0, null=False)
	
	def __str__(self):
		return str(self.caringweight_id)