from __future__ import unicode_literals

from django.contrib import admin
from additionalservicetype.models import Additionalservicetype

class AdditionalservicetypeAdmin(admin.ModelAdmin):
    list_display = ('additionalservicetype_id', 'type')
admin.site.register(Additionalservicetype, AdditionalservicetypeAdmin)