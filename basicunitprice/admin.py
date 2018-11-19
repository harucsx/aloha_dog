from __future__ import unicode_literals

from django.contrib import admin
from basicunitprice.models import Basicunitprice

class BasicunitpriceAdmin(admin.ModelAdmin):
	list_display = ('unitprice_id', 'time', 'price', 'fee')
admin.site.register(Basicunitprice, BasicunitpriceAdmin)