# Generated by Django 2.0.4 on 2018-08-25 13:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sitterinforegistration', '0002_auto_20180825_2151'),
    ]

    operations = [
        migrations.AddField(
            model_name='sitterinforegistration',
            name='address',
            field=models.CharField(max_length=50, null=True),
        ),
    ]
