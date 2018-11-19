from __future__ import unicode_literals

from django.contrib import admin
from request.models import Request

class RequestAdmin(admin.ModelAdmin):
   list_display = ('request_id', 'id', 'dog_id', 'requestdate', 'approvalwhether', 'approvaldate', 'premeetdate', 'carestartdate', 'careenddate', 'totalprice')
admin.site.register(Request, RequestAdmin)