# Generated by Django 2.1.3 on 2018-11-20 09:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0004_auto_20181120_1851'),
    ]

    operations = [
        migrations.AddField(
            model_name='dog',
            name='pet_32',
            field=models.BooleanField(default=False, verbose_name='Q3. 강아지의 공격성'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='dog',
            name='pet_q1',
            field=models.CharField(max_length=50, verbose_name='Q1. 다른 강아지에 대한 반응'),
        ),
        migrations.AlterField(
            model_name='dog',
            name='pet_q2',
            field=models.CharField(max_length=50, verbose_name='Q2. 다른 사람에 대한 반응'),
        ),
    ]
