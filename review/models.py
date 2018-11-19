from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from board.models import Board
from request.models import Request

@python_2_unicode_compatible
class Review(models.Model):
	board_id = models.OneToOneField(Board, primary_key=True, on_delete=models.CASCADE)
	payment_id = models.OneToOneField(Request, on_delete=models.CASCADE, null=False)
	GRADE_CHOICES = (('1', '1점'), ('2', '2점'), ('3', '3점'), ('4', '4점'), ('5', '5점'))
	grade = models.CharField(max_length=1, choices=GRADE_CHOICES, null=False)

	def __str__(self):
		return str(self.board_id)