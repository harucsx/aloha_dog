from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from additionalservicetype.models import Additionalservicetype

@python_2_unicode_compatible
class Additionalservice(models.Model):
    additionalservice_id = models.AutoField(primary_key=True)
    additionalservicetype_id = models.ForeignKey(Additionalservicetype, on_delete=models.CASCADE)
    name = models.CharField(max_length=50,null=False)
    price = models.IntegerField(null=False)

    def __str__(self):
        return str(self.name)