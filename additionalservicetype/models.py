from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

@python_2_unicode_compatible
class Additionalservicetype(models.Model):
    additionalservicetype_id = models.AutoField(primary_key=True)
    TYPE_CHOICES = (('free', '무료'), ('charge', '유료'))
    type = models.CharField(max_length=10, choices=TYPE_CHOICES, null=False)

    def __str__(self):
    	return str(self.type)