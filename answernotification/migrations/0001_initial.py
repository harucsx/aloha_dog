# Generated by Django 2.0.4 on 2018-08-20 05:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('board', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Answernotification',
            fields=[
                ('answeralarm_id', models.AutoField(primary_key=True, serialize=False)),
                ('sendemail', models.BooleanField(default=False)),
                ('board_id', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='board.Board')),
            ],
        ),
    ]
