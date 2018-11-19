from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from board.models import Board

# Create your models here.

@python_2_unicode_compatible
class Faq(models.Model):
	board_id = models.OneToOneField(Board, primary_key=True, on_delete=models.CASCADE)

	def __str__(self):
		return str(self.board_id)