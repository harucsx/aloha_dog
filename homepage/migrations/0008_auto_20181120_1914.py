# Generated by Django 2.1.3 on 2018-11-20 10:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0007_auto_20181120_1913'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dog',
            name='birth_date',
            field=models.DateField(null=True, verbose_name='생일'),
        ),
    ]