import datetime
import random

from django.contrib import auth
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.db.models import Q
from django.http import JsonResponse, Http404
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from homepage.models import UserProfile, Board, Dog, Sitter, Reservation, Review


def review_list(request):
    userprofile = request.user.userprofile
    sitter = Sitter.objects.filter(userprofile=userprofile)
    if sitter.count() > 0:
        sitter = sitter.first()
        reviews = Review.objects.filter(Q(reservation__userprofile=userprofile) |
                                        Q(reservation__sitter=sitter))
    else:
        reviews = Review.objects.filter(reservation__userprofile=userprofile)

    context = {'reviews': reviews}
    return render(request, 'review/review_list.html', context=context)


def review_detail(request, id):
    reviews = Review.objects.get(id=id)
    context = {'review': reviews}
    return render(request, 'review/review_detail.html', context=context)


def review_write(request):
    userprofile = request.user.userprofile

    if request.method == "GET":
        rid = int(request.GET.get('rid'))

        if not rid:
            return redirect('index')

        r = Reservation.objects.get(id=rid)

        context = {'rid': r.id}

        if userprofile.id == r.userprofile.id:
            return render(request, 'review/review_write.html', context=context)

        return redirect('index')

    elif request.method == "POST":
        data = request.POST

        rid = int(data.get('rid'))
        subject = data.get('subject')
        content = data.get('content')

        r = Reservation.objects.get(id=rid)
        if not r.userprofile.id == userprofile.id:
            return redirect('index')

        review = Review()
        review.reservation = r
        review.title = subject
        review.content = content
        review.save()

        r.written_review = True
        r.save()

        return redirect('sitter_detail', r.sitter.id)


def review_edit(request, id):
    userprofile = request.user.userprofile
    review = Review.objects.get(id=id)

    if request.method == "GET":
        r = review.reservation

        context = {
            'rid': r.id,
            'review': review,
        }

        if userprofile.id == r.userprofile.id:
            return render(request, 'review/review_write.html', context=context)

        return redirect('index')

    elif request.method == "POST":
        data = request.POST

        subject = data.get('subject')
        content = data.get('content')

        if not review.reservation.userprofile.id == userprofile.id:
            return redirect('index')

        review.title = subject
        review.content = content
        review.save()

        return redirect('sitter_detail', review.reservation.sitter.id)


def review_delete(request, id):
    userprofile = request.user.userprofile
    review = Review.objects.get(id=id)

    if not review.reservation.userprofile.id == userprofile.id:
        return redirect('index')

    r = review.reservation
    r.written_review = False
    r.save()

    review.delete()
    return redirect('review_list')
