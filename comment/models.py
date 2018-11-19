from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from django.contrib.auth.models import User
from board.models import Board

@python_2_unicode_compatible
class Comment(models.Model): 
	comment_id = models.AutoField(primary_key=True)
	id = models.OneToOneField(User, on_delete=models.CASCADE)
	board_id = models.OneToOneField(Board, on_delete=models.CASCADE) 
	commentdate = models.DateTimeField(auto_now_add=True, null=False) 
	comments = models.TextField(null=False, max_length=200)
   
	def __str__(self):
   		return str(self.comment_id)