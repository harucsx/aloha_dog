from __future__ import unicode_literals

from django.contrib import admin
from petsittersearchcondition.models import Petsittersearchcondition

class PetsittersearchconditionAdmin(admin.ModelAdmin):
   list_display = ('searchterms_id', 'id', 'termsname')
admin.site.register(Petsittersearchcondition, PetsittersearchconditionAdmin)