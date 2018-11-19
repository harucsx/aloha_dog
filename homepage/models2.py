from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse

board_type_choice = (('1', '1:1문의'), ('2', 'faq'))


class Board(models.Model):
    board = models.AutoField(primary_key=True, verbose_name="게시판")
    user = models.Foreignkey('User', on_delete=models.CASCADE, verbose_name="글쓴이")
    board_type = models.CharField(max_length=10, choices=board_type_choice, verbose_name="게시판종류")
    title = models.CharField(max_length=100, verbose_name="게시판제목")
    contents = models.TextField(max_length=1000, verbose_name="게시판내용")
    creating_date = models.DateTimeField(auto_now_add=True, verbose_name="게시판작성일")
    attachments = models.FileField(upload_to='uploads/', verbose_name="첨부파일")
    hit = models.IntegerField(default=0, verbose_name="게시판조회수")


star_score_choice = (('1', '1점'), ('2', '2점'), ('3', '3점'), ('4', '4점'), ('5', '5점'))


class Review(models.Model):
    user = models.Foreignkey('User', on_delete=models.CASCADE, verbose_name="리뷰작성자")
    sitter = models.Foreignkey('Sitter', on_delete=models.CASCADE, verbose_name="시터")
    title = models.CharField(max_length=100, verbose_name="게시판제목")
    contents = models.TextField(max_length=1000, verbose_name="게시판내용")
    star_score = models.CharField(max_length=1, choices=star_score_choice, verbose_name="별점")
    # 댓글


month_choice = (('1', '1월'), ('2', '2월'), ('3', '3월'), ('4', '4월'), ('5', '5월'), ('6', '6월'), ('7', '7월'), ('8', '8월'), ('9', '9월'), ('10', '10월'), ('11', '11월'), ('12', '12월'))
day_choice = (('1', '월요일'), ('2', '화요일'), ('3', '수요일'), ('4', '목요일'), ('5', '금요일'), ('6', '토요일'), ('7', '일요일'))

class Sitter_schedule(models.Model):
    sitter = models.Foreignkey('Sitter', on_delete=models.CASCADE, verbose_name="시터")
    month = models.ChoiceField(max_length=100, choices=month_choice,verbose_name="시터가능달")
    day = models.ChoiceField(max_length=100, choices=day_choice, verbose_name="시터가능요일")