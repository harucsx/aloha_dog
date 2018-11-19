from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from petsitter.models import Petsitter
from request.models import Request
from caringweight.models import Caringweight
from review.models import Review
from django.contrib.auth.models import User

@python_2_unicode_compatible
class Sitterinforegistration(models.Model):
        sitterinforegistration_id = models.AutoField(primary_key=True)
        owner = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
        petsitter_id = models.OneToOneField(Petsitter, on_delete=models.CASCADE, null=False)
        request_id = models.ForeignKey(Request, on_delete=models.CASCADE, null=False)
        posted = models.BooleanField(default=True)
        posteddate = models.DateTimeField(auto_now_add=True, null=False)
        caringweight_id = models.ForeignKey(Caringweight, on_delete=models.CASCADE, null=False)
        board_id = models.ForeignKey(Review, on_delete=models.CASCADE, null=False)
        attachment = models.FileField(upload_to='uploads/')
        address = models.CharField(max_length=50, null=True)
        nearbysubwaystation = models.CharField(max_length=100, null=False)
        cohabitationstatus = models.BooleanField(default=True)
        childstatusunder14 = models.BooleanField(default=True)
        ppp = models.CharField(max_length=50, null=True)
        introduction = models.TextField(null=False)
        SITTERLEVEL_CHOICES = (('우수', '우수'), ('보통', '보통'), ('신규', '신규'))
        sitterlevel = models.CharField(max_length=10, choices=SITTERLEVEL_CHOICES, null=True)

        def __str__(self):
                return str(self.sitterinforegistration_id)