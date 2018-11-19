from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from board.models import Board

@python_2_unicode_compatible
class Answernotification(models.Model):
	answeralarm_id = models.AutoField(primary_key=True)
	board_id =  models.OneToOneField(Board, on_delete=models.CASCADE, null=False)
	sendemail = models.BooleanField(default=False)

	def __str__(self):
		return str(self.answeralarm_id)