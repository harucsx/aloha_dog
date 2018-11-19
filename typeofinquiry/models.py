from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

@python_2_unicode_compatible
class Typeofinquiry(models.Model):
	inquirytype_id = models.AutoField(primary_key=True)
	inquirytype = models.CharField(max_length=20, null=False)
	
	def __str__(self):
		return str(self.inquirytype_id)