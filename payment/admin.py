from __future__ import unicode_literals

from django.contrib import admin
from payment.models import Payment

class PaymentAdmin(admin.ModelAdmin):
   list_display = ('payment_id', 'request_id', 'paymentmethod_id', 'paymentdate', 'approvalnumber', 'depositnumber', 'depositbank', 'totalprice')
admin.site.register(Payment, PaymentAdmin)