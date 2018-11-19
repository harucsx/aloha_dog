from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from board.models import Board
from typeofinquiry.models import Typeofinquiry

@python_2_unicode_compatible
class Onetoonecontact(models.Model):
	board_id = models.OneToOneField(Board, primary_key=True, on_delete=models.CASCADE)
	inquirytype_id = models.ForeignKey(Typeofinquiry, on_delete=models.CASCADE, null=False)
	
	def __str__(self):
		return str(self.board_id)