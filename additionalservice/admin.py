from __future__ import unicode_literals

from django.contrib import admin
from additionalservice.models import Additionalservice

class AdditionalserviceAdmin(admin.ModelAdmin):
	list_display = ('additionalservice_id', 'additionalservicetype_id', 'name', 'price')
admin.site.register(Additionalservice, AdditionalserviceAdmin)