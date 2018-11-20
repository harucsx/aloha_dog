import datetime

from django.contrib import auth
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import JsonResponse, Http404
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from homepage.models import UserProfile, Board, Dog


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
        print(request.POST)
        return render(request, 'sitter/sitter_join.html')


# <QueryDict: {'csrfmiddlewaretoken':
# ['6TRYwYGh7wtoZGLV7HrgS7UoSGtrc3SFqiiXyQwatBEsGUQdULnaiDgjcDKdotzU'],
# 'inputContent': ['${id}', '${m.name}', '${m.address1}'],
#  'profilePhoto': [''], 'accountnumber': ['신한은행', ''],
# 'time_price': [''], 'petsitter_intro': [''],
#  'petsitter_qna': ['Q. 왜 알로하도그 펫시터를 하게 되었나요?\.\r\n-']}>
