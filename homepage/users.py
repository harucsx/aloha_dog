import datetime

from django.contrib import auth
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import JsonResponse, Http404
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from homepage.models import UserProfile, Board


def save_userprofile(user_profile, data):
    user_profile.name = data.get('name')

    if data.get('name') == "남자":
        user_profile.gender = 'M'
    else:
        user_profile.gender = 'F'

    birthday = datetime.date(int(data.get('birth_year')),
                             int(data.get('birth_month')),
                             int(data.get('birth_day')))
    user_profile.birth_date = birthday

    user_profile.phone_number = data.get('phone1') + '-' + \
                                data.get('phone2') + '-' + \
                                data.get('phone3')

    user_profile.email = data.get('email1') + '@' + \
                         data.get('email2')

    user_profile.address1 = data.get('address1')
    user_profile.address2 = data.get('address2')

    user_profile.save()


@csrf_exempt
def join(request):
    if request.method == "GET":
        return render(request, 'user/join.html')
    elif request.method == "POST":
        data = request.POST

        # 유저 모델 생성
        user = User()
        user.username = data.get('id')
        user.set_password(data.get('pw'))
        user.save()

        # 유저 프로필 모델 생성
        user_profile = UserProfile()
        user_profile.user = user

        save_userprofile(user_profile, data)

        return JsonResponse({'result': 'success'})


@csrf_exempt
def login(request):
    if request.method == "GET":
        return render(request, 'user/login.html')
    elif request.method == "POST":
        id = request.POST.get('id')
        pw = request.POST.get('pw')

        try:
            user = User.objects.get(username=id)

            if user.check_password(pw):
                auth.login(request, user)
                return redirect('index')
        except Exception:
            return Http404('')
        finally:
            return render(request, 'user/login.html')


def logout(request):
    auth.logout(request)
    return redirect('index')


@login_required
@csrf_exempt
def profile(request):
    if request.method == "GET":
        userprofile = request.user.userprofile

        context = dict()
        context["birth_year"] = userprofile.birth_date.year
        context["birth_month"] = userprofile.birth_date.month
        context["birth_day"] = userprofile.birth_date.day

        phone = userprofile.phone_number.split('-')
        context["phone1"] = phone[0]
        context["phone2"] = phone[1]
        context["phone3"] = phone[2]

        email = userprofile.email.split('@')
        context["email1"] = email[0]
        context["email2"] = email[1]

        context['gender'] = userprofile.get_sex_display()

        return render(request, 'user/join.html', context=context)
    elif request.method == "POST":
        data = request.POST
        user = request.user

        user_profile = user.userprofile
        save_userprofile(user_profile, data)

        pw = data.get('pw')
        if pw:
            user.set_password(pw)
            user.save()

        return render(request, 'user/join.html')


def user_delete(request):
    if request.method == "GET":
        return render(request, 'user/user_delete.html')
    else:
        data = request.POST

        pw = data.get('pw')
        delete_agree = data.get('delete_agree')

        user = request.user

        if user.check_password(pw) and delete_agree is not None and delete_agree == 'agree':
            user.delete()
            auth.logout(request)
            return render(request, 'user/user_delete_done.html')

        return render(request, 'user/user_delete.html')
