from __future__ import unicode_literals

from django.contrib import admin
from onetoonecontact.models import Onetoonecontact

class OnetoonecontactAdmin(admin.ModelAdmin):
	list_display = ('board_id', 'inquirytype_id')
admin.site.register(Onetoonecontact, OnetoonecontactAdmin)