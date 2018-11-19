from __future__ import unicode_literals

from django.contrib import admin
from sitterinforegistration.models import Sitterinforegistration

class SitterinforegistrationAdmin(admin.ModelAdmin):
   list_display = ('sitterinforegistration_id', 'owner', 'petsitter_id', 'request_id', 'posted', 'posteddate', 'caringweight_id', 'board_id', 'address', 'attachment', 'nearbysubwaystation', 'cohabitationstatus', 'childstatusunder14', 'ppp', 'introduction', 'sitterlevel')
admin.site.register(Sitterinforegistration, SitterinforegistrationAdmin)