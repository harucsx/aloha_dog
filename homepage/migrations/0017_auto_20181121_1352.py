# Generated by Django 2.1.3 on 2018-11-21 04:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0016_auto_20181121_1346'),
    ]

    operations = [
        migrations.RenameField(
            model_name='review',
            old_name='contents',
            new_name='content',
        ),
    ]