from __future__ import unicode_literals

from django.contrib import admin
from requestdetail.models import Requestdetail

class RequestdetailAdmin(admin.ModelAdmin):
   list_display = ('detailrequest_id', 'request_id', 'additionalservice_id', 'additionalservicedate', 'additionalrequest')
admin.site.register(Requestdetail, RequestdetailAdmin)