# Generated by Django 2.0.4 on 2018-08-20 04:37

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Educationalcost',
            fields=[
                ('unitcost_id', models.AutoField(primary_key=True, serialize=False)),
                ('headcount', models.IntegerField(default=0)),
                ('price', models.IntegerField(default=0)),
            ],
        ),
    ]
