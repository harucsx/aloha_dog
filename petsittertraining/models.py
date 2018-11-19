from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from petsitterapplication.models import Petsitterapplication

# Create your models here.

@python_2_unicode_compatible
class Petsittertraining(models.Model):
        training_id = models.AutoField(primary_key=True)
        application_id =  models.ForeignKey(Petsitterapplication, on_delete=models.CASCADE, null=False)
        WHETHER_CHOICES = (('이수중', '이수중'), ('합격', '합격'), ('불합격', '불합격'))
        whether = models.CharField(max_length=10, choices=WHETHER_CHOICES, null=False)
        AREA_CHOICES = (('서울', '서울'), ('경기', '경기'), ('인천', '인천'))
        area = models.CharField(max_length=10, choices=AREA_CHOICES, null=False)
        date = models.DateField(null=False)

        def __str__(self):
                return str(self.training_id)
