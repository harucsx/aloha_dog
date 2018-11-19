from django.db import models

BANK_NAME_CHOICES = (('1', '국민은행'), ('2', '신한은행'), ('3', '우리은행'), ('4', '하나은행'),
    ('5', '케이뱅크'), ('6', '카카오뱅크'), ('7', '산업은행'), ('8', '기업은행'), ('9', '한국수출입은행'),
    ('10', '농협은행'), ('11', '신협은행'), ('12', '대구은행'), ('13', '부산은행'), ('14', '경남은행'),
    ('15', '광주은행'), ('16', '전북은행'), ('17', '제주은행'))

class Sitter(models.Model):
    user = models.OneToOneField('User', on_delete=models.CASCADE)
    account_number = models.CharField(max_length=100, null=False)
    bank_name = models.CharField(max_length=10, choices=BANK_NAME_CHOICES)
    introduction = models.CharField(max_length=200, null=False)

    def __str__(self):
        return str(self.id)