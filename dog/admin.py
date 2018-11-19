from __future__ import unicode_literals

from django.contrib import admin
from dog.models import Dog

class DogAdmin(admin.ModelAdmin):
   list_display = ('dog_id', 'id', 'dogname', 'species', 'birthdate', 'weight', 'sex', 'neutralization', 'profile', 'vaccination')
admin.site.register(Dog, DogAdmin)