from __future__ import unicode_literals

from django.contrib import admin
from petsittermoneytransfer.models import Petsittermoneytransfer

class PetsittermoneytransferAdmin(admin.ModelAdmin):
   list_display = ('petsittermoneytransfer_id', 'payment_id', 'request_id', 'id', 'calculatedate', 'calculateprice', 'calculatebank')
admin.site.register(Petsittermoneytransfer, PetsittermoneytransferAdmin)