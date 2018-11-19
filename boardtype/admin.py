from __future__ import unicode_literals

from django.contrib import admin
from boardtype.models import Boardtype

class BoardtypeAdmin(admin.ModelAdmin):
	list_display = ('boardtype_id', 'boardname')
admin.site.register(Boardtype, BoardtypeAdmin)