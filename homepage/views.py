import datetime

from django.contrib import auth
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import JsonResponse, Http404
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from homepage.models import UserProfile, Board


def index(request):
    return render(request, 'home.html')


def sitter_intro(request):
    return render(request, 'sitter/sitter_intro.html')


def sitter_intro2(request):
    return render(request, 'sitter/sitter_intro2.html')


def sitter_apply1(request):
    return render(request, 'sitter/sitter_apply1.html')


def sitter_apply2(request):
    return render(request, 'sitter/sitter_apply2.html')


def about_us(request):
    return render(request, 'etc/about_us.html')


def about_sitter(request):
    return render(request, 'etc/about_sitter.html')


def caring_preview(request):
    return render(request, 'etc/caring_preview.html')


def faq(request):
    return render(request, 'etc/faq.html')


def free_service(request):
    return render(request, 'etc/free_service.html')


def paid_service(request):
    return render(request, 'etc/paid_service.html')
