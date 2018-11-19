# Generated by Django 2.0.4 on 2018-08-20 05:51

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('request', '0001_initial'),
        ('payment', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Petsittermoneytransfer',
            fields=[
                ('petsittermoneytransfer_id', models.AutoField(max_length=30, primary_key=True, serialize=False)),
                ('calculatedate', models.DateTimeField(auto_now_add=True)),
                ('calculateprice', models.IntegerField(default=0)),
                ('calculatebank', models.CharField(choices=[('1', '국민은행'), ('2', '신한은행'), ('3', '우리은행'), ('4', '하나은행'), ('5', '케이뱅크'), ('6', '카카오뱅크'), ('7', '산업은행'), ('8', '기업은행'), ('9', '한국수출입은행'), ('10', '농협은행'), ('11', '신협은행'), ('12', '대구은행'), ('13', '부산은행'), ('14', '경남은행'), ('15', '광주은행'), ('16', '전북은행'), ('17', '제주은행')], max_length=1)),
                ('calculatebankcalculatebank', models.CharField(max_length=30)),
                ('id', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('payment_id', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='payment.Payment')),
                ('request_id', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='request.Request')),
            ],
        ),
    ]
