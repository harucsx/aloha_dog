from __future__ import unicode_literals

from django.contrib import admin
from answernotification.models import Answernotification

class AnswernotificationAdmin(admin.ModelAdmin):
	list_display = ('answeralarm_id', 'board_id', 'sendemail')
admin.site.register(Answernotification, AnswernotificationAdmin)