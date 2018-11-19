from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from django.contrib.auth.models import User
from boardtype.models import Boardtype

@python_2_unicode_compatible
class Board(models.Model): 
   board_id = models.AutoField(primary_key=True)
   id = models.OneToOneField(User, on_delete=models.CASCADE, null=False)
   boardtype_id = models.OneToOneField(Boardtype, on_delete=models.CASCADE, null=False)
   title = models.CharField(max_length=400, null=False) 
   contents = models.TextField(null=False)
   creatingdate = models.DateTimeField(auto_now_add=True, null=False)
   attachments = models.FileField(upload_to='uploads/', null=True)
   hit = models.IntegerField(default=0, null=False)
    
   def __str__(self):
   	return str(self.board_id)