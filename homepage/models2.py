from __future__ import unicode_literals
from django.utils.encoding import python_2_unicode_compatible

from django.db import models
from django.urls import reverse


class Board(models.Model):
    board_id = models.AutoField(primary_key=True, verbose_name="게시판")
    id = models.Foreignkey('User', on_delete=models.CASCADE, verbose_name="글쓴이")
    board_type = models.ChoiceField(on_delete=models.CASCADE, verbose_name="게시판종류")
    title = models.CharField(max_length=100, verbose_name="게시판제목")
    contents = models.TextField(max_length=1000, verbose_name="게시판내용")
    creating_date = models.DateTimeField(auto_now_add=True, verbose_name="게시판작성일")
    attachments = models.FileField(upload_to='uploads/', verbose_name="첨부파일")
    hit = models.IntegerField(default=0, verbose_name="게시판조회수")

    def __str__(self):
        return str(self.board)