from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

from dog.models import Dog

@python_2_unicode_compatible
class Carejournal(models.Model):
    careJournal_id = models.AutoField(primary_key=True)
    dog_id = models.ForeignKey(Dog, on_delete=models.CASCADE)
    regdate = models.DateTimeField(auto_now=True, null=False)
    answer1 = models.TextField(null=False)
    answer2 = models.TextField(null=False)
    answer3 = models.TextField(null=False)
    answer4 = models.TextField(null=False)
    review = models.TextField(null=False)
    checklist1 = models.BooleanField(default=False, null=False)
    checklist2 = models.BooleanField(default=False, null=False)
    checklist3 = models.BooleanField(default=False, null=False)
    checklist4 = models.BooleanField(default=False, null=False)
    checklist5 = models.BooleanField(default=False, null=False)
    attachment = models.FileField(upload_to='uploads/')

    def __str__(self):
        return str(self.careJournal_id)
