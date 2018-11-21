import datetime
import random

from django.contrib import auth
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.paginator import Paginator
from django.http import JsonResponse, Http404
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from homepage.models import UserProfile, Board, Dog, Sitter, Reservation, Review, Payment, Application


def sitter_apply(request):
    if request.method == "GET":
        pets = Dog.objects.filter(owner=request.user.userprofile)
        context = {'pets_count': pets.count()}
        return render(request, 'sitter/sitter_apply.html', context=context)
    elif request.method == "POST":
        data = request.POST
        app = Application()
        app.userprofile = request.user.userprofile
        app.job = data.get('job')
        app.permission = True if data.get('permission') == "Y" else False
        app.whether_smoker = True if data.get('whether_smoker') == "Y" else False
        app.maximum_caring_period = int(data.get('maximum_caring_period'))
        app.minors_status = True if data.get('minors_status') == "Y" else False
        app.sitter_career = True if data.get('sitter_career') == "Y" else False
        app.time_together = int(data.get('time_together'))
        app.pet_count = int(data.get('pet_count'))
        app.experience = data.get('experience')
        app.responsibility = True if data.get('responsibility') == "Y" else False
        app.save()

        return redirect('index')


# <QueryDict: {'csrfmiddlewaretoken': ['RlWZCOdvR26yRAgFo2fND1mqWfRPnUTtC20B3FUXCdsO9L0nuaLIzOZbO
# 2T0SmbS'], 'name': ['홍길동'], 'job': ['학생'], 'petsitter_job_selectDirect': [''],
# 'permission': ['N'], 'whether_smoker': ['N'], 'maximum_caring_period': ['20'],
# 'minors_status': ['N'], 'sitter_career': ['N'], 'time_together': ['50'],
# 'pet_count': ['4'], 'experience': ['tete'], 'responsibility': ['N']}>


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
        userprofile = request.user.userprofile
        context = dict()

        if Sitter.objects.filter(userprofile=userprofile).count() > 0:
            sitter = Sitter.objects.get(userprofile=userprofile)
            context['sitter'] = sitter

            free_services = ['노령견케어', '환자견케어', '자격증보유', '실외배변', '응급처치', '투약가능']
            paid_services = ['목욕가기', '병원가기', '픽업가능', '수제간식', '미용가기', ]

            for index, service in enumerate(free_services, 1):
                if service in sitter.free_services:
                    context['free_service' + str(index)] = 'checked'

            for index, service in enumerate(paid_services, 1):
                if service in sitter.paid_services:
                    context['paid_service' + str(index)] = 'checked'

        return render(request, 'sitter/sitter_join.html', context=context)
    elif request.method == "POST":
        # try:
        data = request.POST
        userprofile = request.user.userprofile

        if Sitter.objects.filter(userprofile=userprofile).count() > 0:
            sitter = Sitter.objects.get(userprofile=userprofile)
            if request.FILES.get('profile'):
                sitter.profile = request.FILES['profile']
        else:
            sitter = Sitter()
            sitter.userprofile = userprofile

        free_service = list()
        free_service.append(data.get('free_service1'))
        free_service.append(data.get('free_service2'))
        free_service.append(data.get('free_service3'))
        free_service.append(data.get('free_service4'))
        free_service.append(data.get('free_service5'))
        free_service.append(data.get('free_service6'))

        free_service = [x for x in free_service if x is not None]

        paid_service = list()
        paid_service.append(data.get('paid_service1'))
        paid_service.append(data.get('paid_service2'))
        paid_service.append(data.get('paid_service3'))
        paid_service.append(data.get('paid_service4'))
        paid_service.append(data.get('paid_service5'))

        paid_service = [x for x in paid_service if x is not None]

        sitter.profile = request.FILES['profile']
        sitter.account_number = data.get('account_number')
        sitter.bank_name = data.get('bank_name')
        sitter.introduction = data.get('introduction')
        sitter.free_services = ','.join(free_service)
        sitter.paid_services = ','.join(paid_service)
        sitter.day_price = int(data.get('day_price'))
        sitter.care_zone = data.get('care_zone')
        sitter.housemate_situation = data.get('housemate_situation')
        sitter.pet_situation = data.get('pet_situation')
        sitter.qna = data.get('qna')
        sitter.save()
        # finally:
        return redirect('sitter_list')


def sitter_list(request):
    search_keyword = request.GET.get('keyword')
    search_city = request.GET.get('city')
    page = request.GET.get('page')

    context = dict()

    if search_keyword and search_city:
        context['search_keyword'] = search_keyword
        context['search_city'] = search_city

        sitter = Sitter.objects.all().filter(userprofile__name__contains=search_keyword)

        if not search_city == "전체":
            sitter = sitter.filter(userprofile__address1__contains=search_city)

        context['search_message'] = str(sitter.count()) + '개의 검색 결과가 있습니다.'
    else:
        sitter = Sitter.objects.all()

    paginator = Paginator(sitter, 5)
    sitter = paginator.get_page(page)

    context['sitters'] = sitter
    return render(request, 'sitter/sitter_list.html', context=context)


def sitter_detail(request, id):
    sitter = Sitter.objects.get(id=id)
    context = dict()
    context['sitter'] = sitter
    context['dogs'] = Dog.objects.filter(owner=sitter.userprofile)
    context['reviews'] = Review.objects.filter(reservation__sitter=sitter)
    return render(request, 'sitter/sitter_detail.html', context=context)


def reservation(request, sitter_id):
    userprofile = request.user.userprofile
    sitter = Sitter.objects.get(id=sitter_id)

    if request.method == "GET":
        pets = Dog.objects.filter(owner=userprofile)

        context = dict()
        context['sitter'] = sitter
        context['pets'] = pets
        return render(request, 'reservation/reservation.html', context=context)
    elif request.method == "POST":
        data = request.POST

        pet_id = int(data.get('pet'))

        r = Reservation()
        r.reservation_no = random.randint(10000000, 99999999)
        r.userprofile = userprofile
        r.sitter = sitter
        r.dog = Dog.objects.get(id=pet_id)
        r.precautions = data.get('precautions')
        r.start_date = datetime.datetime.strptime(data.get('start_date'), '%Y-%m-%d')
        r.end_date = datetime.datetime.strptime(data.get('end_date'), '%Y-%m-%d')
        r.total_price = int(data.get('payment'))
        r.progress = '예약신청'
        r.save()

        return redirect('reservation_list')


# <QueryDict: {'csrfmiddlewaretoken': [''],
# 'sitter_id': ['3'], 'sitter': ['김아연 시터님'], 'pet': ['2'],
# 'precautions': ['ergegegaegerg'],
# 'start_date': ['2018-11-09'], 'end_date': ['2018-11-13'],
# 'payment': ['75000'], 'homeaddress': ['서울 강남구 봉은사로 419 (삼성동, 삼성2동주민센터)'],
#  'progress': ['예약신청']}>


def reservation_list(request):
    sitter_mode = request.GET.get('sitter') is not None

    userprofile = request.user.userprofile

    if not sitter_mode:
        rs = Reservation.objects.filter(userprofile=userprofile)
    else:
        try:
            sitter = Sitter.objects.get(userprofile=userprofile)
        except:
            return redirect('reservation_list')

        rs = Reservation.objects.filter(sitter=sitter)

    context = dict()
    context['rs'] = rs
    context['total_count'] = rs.count()
    context['sitter_mode'] = sitter_mode
    return render(request, 'reservation/reservation_list.html', context=context)


def reservation_detail(request, id):
    r = Reservation.objects.get(id=id)

    context = dict()
    context['r'] = r
    return render(request, 'reservation/reservation_detail.html', context=context)


def reservation_progress(request, id):
    progress = request.GET.get('progress')
    r = Reservation.objects.get(id=id)

    if not progress:
        return redirect('index')

    if not request.user.userprofile.id == r.sitter.userprofile.id:
        return redirect('index')

    r.progress = progress
    r.save()

    return redirect('reservation_detail', id)


@csrf_exempt
def payment_complete(request):
    data = request.POST
    id = int(data.get('id'))  # 예약 인스턴스의 PK
    rid = data.get('rid')  # 예약번호
    mid = data.get('mid')  # 거래번호 (중복 불가)
    uid = data.get('uid')  # imp uid
    amount = data.get('amount')  # 결제 금액
    apply_num = data.get('apply_num')  # 승인 번호

    print(data)
    r = Reservation.objects.get(id=id)

    payment = Payment()
    payment.reservation = r
    payment.merchant_uid = mid
    payment.amount = int(amount)
    payment.apply_num = apply_num
    payment.save()

    r.progress = "결제완료"
    r.save()
    return JsonResponse({'result': 'success'})


def payment_list(request):
    userprofile = request.user.userprofile
    payments = Payment.objects.filter(reservation__userprofile=userprofile)
    context = {'payments': payments}
    return render(request, 'payment/payment_list.html', context=context)
