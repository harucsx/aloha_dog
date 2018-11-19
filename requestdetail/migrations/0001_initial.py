# Generated by Django 2.0.4 on 2018-08-20 05:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('request', '0001_initial'),
        ('additionalservice', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Requestdetail',
            fields=[
                ('detailrequest_id', models.AutoField(primary_key=True, serialize=False)),
                ('additionalservicedate', models.DateTimeField()),
                ('additionalrequest', models.CharField(max_length=200)),
                ('additionalservice_id', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='additionalservice.Additionalservice')),
                ('request_id', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='request.Request')),
            ],
        ),
    ]
