from __future__ import unicode_literals

from django.contrib import admin
from petsittertraining.models import Petsittertraining

class PetsittertrainingAdmin(admin.ModelAdmin):
	list_display = ('training_id', 'application_id', 'whether', 'area', 'date')
admin.site.register(Petsittertraining, PetsittertrainingAdmin)