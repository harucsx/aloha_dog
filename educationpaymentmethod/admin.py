from __future__ import unicode_literals

from django.contrib import admin
from educationpaymentmethod.models import Educationpaymentmethod

class EducationpaymentmethodAdmin(admin.ModelAdmin):
    list_display = ('epaymentmethod_id', 'method')
admin.site.register(Educationpaymentmethod, EducationpaymentmethodAdmin)