from __future__ import unicode_literals

from django.contrib import admin
from petsitter.models import Petsitter

class PetsitterAdmin(admin.ModelAdmin):
   list_display = ('id', 'accountnumber', 'bankname', 'introduction')
admin.site.register(Petsitter, PetsitterAdmin)