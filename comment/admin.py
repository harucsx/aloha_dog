from __future__ import unicode_literals

from django.contrib import admin
from comment.models import Comment

# Register your models here.

class CommentAdmin(admin.ModelAdmin):
	list_display = ('comment_id', 'id', 'board_id', 'commentdate', 'comments')
admin.site.register(Comment, CommentAdmin)