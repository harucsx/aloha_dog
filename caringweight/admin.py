from __future__ import unicode_literals

from django.contrib import admin
from caringweight.models import Caringweight

class CaringweightAdmin(admin.ModelAdmin):
   list_display = ('caringweight_id', 'caringweight', 'weightprice')
admin.site.register(Caringweight, CaringweightAdmin)