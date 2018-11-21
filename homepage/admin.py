from django.contrib import admin

# Register your models here.
from homepage.models import *

admin.site.register(UserProfile)
admin.site.register(Reservation)
admin.site.register(Application)
admin.site.register(Board)
admin.site.register(Review)
admin.site.register(SitterSchedule)
admin.site.register(Sitter)
admin.site.register(Dog)
admin.site.register(Payment)
