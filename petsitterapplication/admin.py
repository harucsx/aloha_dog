from __future__ import unicode_literals

from django.contrib import admin
from petsitterapplication.models import Petsitterapplication

class PetsitterapplicationAdmin(admin.ModelAdmin):
	list_display = ('application_id', 'id', 'informationapproval', 'answer1', 'answer2', 'answer3', 'answer4', 'answer5', 'answer6', 'answer7', 'answer8', 'answer9', 'applicationpass')
admin.site.register(Petsitterapplication, PetsitterapplicationAdmin)