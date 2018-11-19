from __future__ import unicode_literals

from django.contrib import admin
from typeofinquiry.models import Typeofinquiry

class TypeofinquiryAdmin(admin.ModelAdmin):
	list_display = ('inquirytype_id', 'inquirytype')
admin.site.register(Typeofinquiry, TypeofinquiryAdmin)