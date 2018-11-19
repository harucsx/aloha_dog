from __future__ import unicode_literals

from django.contrib import admin
from carejournal.models import Carejournal

class CarejournalAdmin(admin.ModelAdmin):
	list_display = ('careJournal_id', 'dog_id', 'regdate', 'answer1', 'answer2', 'answer3', 'answer4', 'review', 'checklist1', 'checklist2', 'checklist3', 'checklist4', 'checklist5', 'attachment')
admin.site.register(Carejournal, CarejournalAdmin)