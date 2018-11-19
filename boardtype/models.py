from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

@python_2_unicode_compatible
class Boardtype(models.Model):
	boardtype_id = models.AutoField(primary_key=True)
	BOARDNAME_CHOICES = (('1:1문의', '1:1문의'), ('리뷰', '리뷰'), ('faq', 'faq'))
	boardname = models.CharField(max_length=10, choices=BOARDNAME_CHOICES, null=False)

	def __str__(self):
                return str(self.boardtype_id)