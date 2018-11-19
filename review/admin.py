from __future__ import unicode_literals

from django.contrib import admin
from review.models import Review

class ReviewAdmin(admin.ModelAdmin):
   list_display = ('board_id', 'payment_id', 'grade')
admin.site.register(Review, ReviewAdmin)