from __future__ import unicode_literals

from django.contrib import admin
from board.models import Board

class BoardAdmin(admin.ModelAdmin):
	list_display = ('board_id', 'id', 'boardtype_id', 'title', 'contents', 'creatingdate', 'attachments', 'hit')
admin.site.register(Board, BoardAdmin)