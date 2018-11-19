from __future__ import unicode_literals

from django.contrib import admin
from paymentmethod.models import Paymentmethod

class PaymentmethodAdmin(admin.ModelAdmin):
	list_display = ('paymentmethod_id', 'method')
admin.site.register(Paymentmethod, PaymentmethodAdmin)