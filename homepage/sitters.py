import datetime

from django.contrib import auth
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import JsonResponse, Http404
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from homepage.models import UserProfile, Board, Dog, Sitter


def sitter_check(request):
    if request.method == "GET":
        return render(request, 'sitter/sitter_check.html')
    elif request.method == "POST":
        pw = request.POST.get('pw')
        if request.user.check_password(pw):
            return redirect('sitter_join')
        return render(request, 'sitter/sitter_check.html')


def sitter_join(request):
    if request.method == "GET":
        return render(request, 'sitter/sitter_join.html')
    elif request.method == "POST":

        try:
            data = request.POST

            sitter = Sitter()
            sitter.userprofile = request.user.userprofile
            sitter.account_number = data.get('account_number')
            sitter.profile = request.FILES['profile']
            sitter.bank_name = data.get('bank_name')
            sitter.introduction = data.get('intro')
            sitter.free_services = ','.join(data.get('free_service'))
            sitter.paid_service = ','.join(data.get('paid_service'))
            sitter.day_price = int(data.get('day_price'))
            sitter.care_zone = data.get('care_zone')
            sitter.housemate_situation = data.get('housemate_situation')
            sitter.pet_situation = data.get('pet_situation')
            sitter.qna = data.get('qna')
            sitter.save()
        finally:
            return redirect('pet_list')



# <QueryDict: {'csrfmiddlewareto/ken': ['QcMgu7rZ7jow4Zn76CCTjL'],
#  'id': ['${id}'], 'name': ['${m.name}'], 'profile': [''],
# 'address': ['${m.address1}'], 'bank_name': ['신한은행'],
#  'account_number': [''], 'day_price': [''], 'intro': [''],
# 'qna': ['Q. 왜 알로하도그 펫시터를 하게 되었나요?\r\nA.\r\n\r\nQ. \r\nA.\r\n\r\n※ 아래 유형의 아이들은 돌봄이 어려울 수 있습니다.\r\n-\r\n                                    ']}>
