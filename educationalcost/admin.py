from __future__ import unicode_literals

from django.contrib import admin
from educationalcost.models import Educationalcost

class EducationalcostAdmin(admin.ModelAdmin):
	list_display = ('unitcost_id', 'headcount', 'price')
admin.site.register(Educationalcost, EducationalcostAdmin)