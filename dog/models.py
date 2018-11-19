from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from django.contrib.auth.models import User

@python_2_unicode_compatible
class Dog(models.Model):
    dog_id = models.AutoField(primary_key=True)
    id  =  models.ForeignKey(User, on_delete=models.CASCADE, null=False)
    dogname = models.CharField(max_length=50, null=False)
    species = models.CharField(max_length=50, null=False)
    birthdate = models.DateField()
    weight = models.IntegerField(default=10)
    SEX_CHOICES = (('M', 'Male'), ('F', 'Female'))
    sex = models.CharField(max_length=1, choices=SEX_CHOICES, null=False)
    neutralization = models.BooleanField(default=True)
    profile = models.FileField(upload_to='uploads/')
    vaccination= models.BooleanField(default=True)

    def __str__(self):
        return str(self.dog_id)