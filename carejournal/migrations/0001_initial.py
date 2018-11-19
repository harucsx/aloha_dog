# Generated by Django 2.0.4 on 2018-08-20 04:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('dog', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Carejournal',
            fields=[
                ('careJournal_id', models.AutoField(primary_key=True, serialize=False)),
                ('regdate', models.DateTimeField(auto_now=True)),
                ('answer1', models.TextField()),
                ('answer2', models.TextField()),
                ('answer3', models.TextField()),
                ('answer4', models.TextField()),
                ('review', models.TextField()),
                ('checklist1', models.BooleanField(default=False)),
                ('checklist2', models.BooleanField(default=False)),
                ('checklist3', models.BooleanField(default=False)),
                ('checklist4', models.BooleanField(default=False)),
                ('checklist5', models.BooleanField(default=False)),
                ('attachment', models.FileField(upload_to='uploads/')),
                ('dog_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='dog.Dog')),
            ],
        ),
    ]
