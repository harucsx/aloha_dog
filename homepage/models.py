from __future__ import unicode_literals

from django.conf import settings
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

SEX_CHOICES = (('M', '남자'), ('F', '여자'))
MEMBER_SHIP_LEVEL_CHOICES = (('member', '일반회원'), ('sitter', '시터'), ('manager', '관리자'))
BOARD_TYPE_CHOICE = (('qna', '1:1문의'), ('faq', 'FAQ'))
STAR_SCORE_CHOICE = (('1', '1점'), ('2', '2점'), ('3', '3점'), ('4', '4점'), ('5', '5점'))
MONTH_CHOICE = (
    ('1', '1월'), ('2', '2월'), ('3', '3월'), ('4', '4월'), ('5', '5월'), ('6', '6월'), ('7', '7월'), ('8', '8월'), ('9', '9월'),
    ('10', '10월'), ('11', '11월'), ('12', '12월'))
DAY_CHOICE = (('1', '월요일'), ('2', '화요일'), ('3', '수요일'), ('4', '목요일'), ('5', '금요일'), ('6', '토요일'), ('7', '일요일'))
BANK_NAME_CHOICES = (('1', '국민은행'), ('2', '신한은행'), ('3', '우리은행'), ('4', '하나은행'),
                     ('5', '케이뱅크'), ('6', '카카오뱅크'), ('7', '산업은행'), ('8', '기업은행'), ('9', '한국수출입은행'),
                     ('10', '농협은행'), ('11', '신협은행'), ('12', '대구은행'), ('13', '부산은행'), ('14', '경남은행'),
                     ('15', '광주은행'), ('16', '전북은행'), ('17', '제주은행'))


# 회원_User
class UserProfile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, verbose_name='유저')
    name = models.CharField(max_length=50, verbose_name='회원 이름')
    sex = models.CharField(max_length=1, choices=SEX_CHOICES, verbose_name='회원 성별', default='F')
    birth_date = models.DateField(verbose_name='회원 생일')
    phone_number = models.CharField(max_length=20, verbose_name='회원 핸드폰번호')
    email = models.EmailField(max_length=50, verbose_name='회원 이메일')
    address1 = models.CharField(max_length=50, verbose_name='회원 주소1')
    address2 = models.CharField(max_length=50, verbose_name='회원 주소2')
    profile = models.FileField(upload_to='uploads/', verbose_name='회원 사진')
    registration_datetime = models.DateTimeField(auto_now=True, verbose_name='회원가입일')
    membership_level = models.CharField(max_length=10, verbose_name='회원 등급', choices=MEMBER_SHIP_LEVEL_CHOICES,
                                        default='member')


# 예약
class Reservation(models.Model):
    userprofile = models.ForeignKey('UserProfile', on_delete=models.CASCADE, verbose_name='예약을 신청한 회원')
    dog = models.ForeignKey('Dog', on_delete=models.CASCADE, verbose_name='예약이 신청된 동물')
    sitter = models.ForeignKey('Sitter', on_delete=models.CASCADE, verbose_name='예약을 신청받은 시터')
    reservation_date = models.DateTimeField(auto_now=False, verbose_name='신청한 날짜')
    start_datetime = models.DateTimeField(verbose_name='돌봄시작날짜')
    end_datetime = models.DateTimeField(verbose_name='돌봄마침날짜')
    free_services = models.CharField(max_length=100, verbose_name='무료 서비스')
    paid_services = models.CharField(max_length=100, verbose_name='유료 서비스')
    precautions = models.CharField(max_length=100, verbose_name='돌봄 주의사항')
    progress = models.CharField(max_length=100, verbose_name='진행상황')
    total_price = models.IntegerField(default=0, verbose_name='총가격')


# 시터 지원서
class Application(models.Model):
    userprofile = models.ForeignKey('UserProfile', on_delete=models.CASCADE, verbose_name='지원서를 작성한 회원')
    job = models.CharField(max_length=50, verbose_name='회원의 현재 직업')
    permission = models.BooleanField(default=True, verbose_name='가족들의 동의를 구하셨나요?')
    whether_smoker = models.BooleanField(default=True, verbose_name='가족중에 흡연자가 있나요?')
    maximum_caring_period = models.BooleanField(default=True, verbose_name='한달 내에 최대돌봄기간은 어느정도인가요?')
    minors_status = models.BooleanField(default=True, verbose_name='식구중에 미성년자가 있습니까?')
    sitter_career = models.BooleanField(default=True, verbose_name='시터로 활동한 적이 있습니까?')
    time_together = models.IntegerField(default=True, verbose_name='반려동물과 함께한 시간은 몇개월 입니까?')
    pet_count = models.IntegerField(default=True, verbose_name='현재 키우고있는 반려동물 수')
    experience = models.TextField(max_length=1000, verbose_name='반려동물과 함께해서 좋았던 기억을 입력해주세요')
    responsibility = models.BooleanField(default=True, verbose_name='펫시터로 최선을 다할것을 약속하십니까?')


class Board(models.Model):
    userprofile = models.ForeignKey('UserProfile', on_delete=models.CASCADE, verbose_name="글쓴이")
    board_type = models.CharField(max_length=10, choices=BOARD_TYPE_CHOICE, verbose_name="게시판 종류")
    title = models.CharField(max_length=100, verbose_name="게시판제목")
    contents = models.TextField(max_length=1000, verbose_name="게시판내용")
    created_date = models.DateTimeField(auto_now_add=True, verbose_name="작성일")
    attachments = models.FileField(upload_to='uploads/', verbose_name="첨부파일", null=True)
    hit = models.IntegerField(default=0, verbose_name="게시판 조회수")


class Review(models.Model):
    userprofile = models.ForeignKey('UserProfile', on_delete=models.CASCADE, verbose_name="리뷰작성자")
    sitter = models.ForeignKey('Sitter', on_delete=models.CASCADE, verbose_name="시터")
    title = models.CharField(max_length=100, verbose_name="게시판제목")
    contents = models.TextField(max_length=1000, verbose_name="게시판내용")
    star_score = models.CharField(max_length=1, choices=STAR_SCORE_CHOICE, verbose_name="별점")
    # 댓글


class SitterSchedule(models.Model):
    sitter = models.ForeignKey('Sitter', on_delete=models.CASCADE, verbose_name="시터")
    month = models.CharField(max_length=100, choices=MONTH_CHOICE, verbose_name="시터가능달")
    day = models.CharField(max_length=100, choices=DAY_CHOICE, verbose_name="시터가능요일")


class Sitter(models.Model):
    userprofile = models.OneToOneField('UserProfile', on_delete=models.CASCADE, verbose_name="시터이름")
    account_number = models.CharField(max_length=100, verbose_name="계좌번호")
    bank_name = models.CharField(max_length=10, choices=BANK_NAME_CHOICES, verbose_name="은행명")
    introduction = models.CharField(max_length=200, verbose_name="시터소개")
    free_services = models.CharField(max_length=100, verbose_name='무료 서비스')
    paid_services = models.CharField(max_length=100, verbose_name='유료 서비스')
    day_price = models.IntegerField(default=0, verbose_name='일당')
    care_zone = models.CharField(max_length=100, verbose_name='돌봄 공간')
    housemate_situation = models.CharField(max_length=100, verbose_name='가족 동거 유무')
    pet_situation = models.CharField(max_length=100, verbose_name='다른 반려동물 유무')
    qna = models.TextField(max_length=1000, verbose_name="QnA")

    def __str__(self):
        return str(self.id)


class Dog(models.Model):
    owner = models.ForeignKey('UserProfile', on_delete=models.CASCADE, verbose_name="견주")
    name = models.CharField(max_length=50, verbose_name="펫 이름")
    species = models.CharField(max_length=50, verbose_name="견종")
    birth_date = models.DateField(verbose_name="생일", null=True)
    age = models.IntegerField(verbose_name="나이")
    weight = models.FloatField( verbose_name="몸무게")
    sex = models.CharField(max_length=5, choices=SEX_CHOICES, verbose_name="성별")
    neutralization = models.BooleanField(default=True, verbose_name="중성화 여부")
    profile = models.ImageField(upload_to='dog_images/', verbose_name="프로필 사진")
    vaccination = models.BooleanField(verbose_name="예방접종유무")
    pet_q1 = models.CharField(max_length=50, verbose_name="Q1. 다른 강아지에 대한 반응")
    pet_q2 = models.CharField(max_length=50, verbose_name="Q2. 다른 사람에 대한 반응")
    pet_q3 = models.BooleanField(verbose_name="Q3. 강아지의 공격성")

    def __str__(self):
        return str(self.id)
