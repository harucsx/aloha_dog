from __future__ import unicode_literals

from django.contrib import admin
from faq.models import Faq

# Register your models here.

class FaqAdmin(admin.ModelAdmin):
	list_display = ('board_id', 'board_id')
admin.site.register(Faq, FaqAdmin)