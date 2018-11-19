from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse
from django.contrib.auth.models import User
from django.db.models.signals import post_save  
from django.dispatch import receiver

@python_2_unicode_compatible
class Member(models.Model):
        user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
        name = models.CharField(max_length=50, null=False) 
        SEX_CHOICES = (('M', 'Male'), ('F', 'Female'))
        sex = models.CharField(max_length=1, choices=SEX_CHOICES, null=False, default='F')
        birthdate = models.DateField(null=True)
        phonenumber = models.CharField(max_length=20, null=False)
        email = models.EmailField(max_length=50, null=False)
        address1 = models.CharField(max_length=50, null=False)
        address2 = models.CharField(max_length=50, null=False)
        address3 = models.CharField(max_length=50, null=False)
        profile = models.FileField(upload_to='uploads/', null=True)
        regdate = models.DateTimeField(auto_now=True, null=False) 
        joinapproval = models.BooleanField(default=True)
        MEMBERSHIPLEVEL_CHOICES = (('member', 'Member'), ('sitter', 'Sitter'), ('manager', 'Manager'))
        membershiplevel = models.CharField(max_length=10, choices=MEMBERSHIPLEVEL_CHOICES, null=False, default='member')

        def __str__(self):
                return str(self.user)

@receiver(post_save, sender=User)
def create_user_member(sender, instance, created, **kwargs):  
    if created:
        Member.objects.create(user=instance)

@receiver(post_save, sender=User)
def save_user_member(sender, instance, **kwargs):  
    instance.member.save()