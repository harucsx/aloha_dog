import datetime

from django.contrib import auth
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import JsonResponse, Http404
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from homepage.models import UserProfile, Board


def board_list(request, board_type):
    context = dict()
    context['board_type'] = board_type
    context['articles'] = Board.objects.all().filter(board_type=board_type).order_by('-created_date')
    return render(request, 'board/board_list.html', context=context)


@csrf_exempt
def board_write(request, board_type):
    if request.method == "GET":
        context = dict()
        context['board_type'] = board_type
        return render(request, 'board/board_edit.html', context=context)

    elif request.method == "POST":
        data = request.POST
        subject = data.get('subject')
        content = data.get('content')

        article = Board()
        article.userprofile = request.user.userprofile
        article.board_type = board_type
        article.title = subject
        article.contents = content
        article.save()

        return JsonResponse({})


@csrf_exempt
def board_edit(request, board_type, id):
    if request.method == "GET":
        context = dict()
        context['board_type'] = board_type
        context['article'] = Board.objects.get(id=id)
        return render(request, 'board/board_edit.html', context=context)

    elif request.method == "POST":
        data = request.POST
        subject = data.get('subject')
        content = data.get('content')

        article = Board.objects.get(id=id)
        article.title = subject
        article.contents = content
        article.save()

        return JsonResponse({})


def board_detail(request, board_type, id):
    context = dict()
    context['board_type'] = board_type
    context['article'] = Board.objects.get(id=id)
    return render(request, 'board/board_detail.html', context=context)
