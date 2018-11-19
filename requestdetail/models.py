from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from request.models import Request
from additionalservice.models import Additionalservice

@python_2_unicode_compatible
class Requestdetail(models.Model):
    detailrequest_id = models.AutoField(primary_key=True)
    request_id = models.OneToOneField(Request, on_delete=models.CASCADE, null=False)
    additionalservice_id = models.OneToOneField(Additionalservice, on_delete=models.CASCADE, null=False)
    additionalservicedate = models.DateTimeField(null=False)
    additionalrequest = models.CharField(max_length=200, null=False)

    def __str__(self):
        return str(self.detailrequest_id)