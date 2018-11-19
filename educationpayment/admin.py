from __future__ import unicode_literals

from django.contrib import admin
from educationpayment.models import Educationpayment

class EducationpaymentAdmin(admin.ModelAdmin):
	list_display = ('educationpayment_id', 'application_id', 'epaymentmethod_id', 'paymentdate', 'depositbank', 'depositaccount',  'approvalnumber', 'price')
admin.site.register(Educationpayment, EducationpaymentAdmin)