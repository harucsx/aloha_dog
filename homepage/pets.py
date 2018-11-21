import datetime

from django.contrib import auth
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import JsonResponse, Http404
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from homepage.models import UserProfile, Board, Dog


def pet_list(request):
    context = dict()
    userprofile = request.user.userprofile
    context['pets'] = Dog.objects.filter(owner=userprofile)
    return render(request, 'pet/pet_list.html', context=context)


def pet_edit(request, id):
    if request.method == "GET":
        context = dict()
        context['pet'] = Dog.objects.get(id=id)
        return render(request, 'pet/pet_edit.html', context=context)
    elif request.method == "POST":
        try:
            data = request.POST

            dog = Dog.objects.get(id=id)

            if request.FILES.get('image'):
                dog.profile = request.FILES['image']

            dog.weight = float(data.get('weight'))
            dog.pet_q1 = data.get('pet_q1')
            dog.pet_q2 = data.get('pet_q2')
            dog.pet_q3 = True if data.get('neutralization') == "Y" else False
            dog.neutralization = True if data.get('neutralization') == "Y" else False
            dog.vaccination = True if data.get('vaccination') == "Y" else False

            dog.save()
        finally:
            return redirect('pet_list')


def pet_add(request):
    if request.method == "GET":
        return render(request, 'pet/pet_add.html')
    elif request.method == "POST":

        try:
            data = request.POST

            dog = Dog()
            dog.owner = request.user.userprofile
            dog.name = data.get('name')
            dog.age = int(data.get('age'))
            dog.sex = data.get('sex')

            species = data.get('species')

            if species == "direct":
                dog.species = data.get('selectDirect')
            else:
                dog.species = data.get('species')

            dog.weight = float(data.get('weight'))
            dog.profile = request.FILES['image']
            dog.pet_q1 = data.get('pet_q1')
            dog.pet_q2 = data.get('pet_q2')
            dog.pet_q3 = True if data.get('neutralization') == "Y" else False
            dog.neutralization = True if data.get('neutralization') == "Y" else False
            dog.vaccination = True if data.get('vaccination') == "Y" else False

            dog.save()
        finally:
            return redirect('pet_list')


def pet_delete(request, id):
    dog = Dog.objects.get(id=id)

    if request.user.userprofile.id == dog.owner.id:
        dog.delete()

    return redirect('pet_list')