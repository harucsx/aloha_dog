# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render

from django.views.generic import ListView, DetailView
from sitterinforegistration.models import Sitterinforegistration

from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from oursite.views import LoginRequiredMixin

# Create your views here.

# ---ListView
class SitterinforegistrationLV(ListView):
    model = Sitterinforegistration

# ---DetailView
class SitterinforegistrationDV(DetailView):
    model = Sitterinforegistration

# 추가, 바꾸기, 수정, 삭제
class SitterinforegistrationCreateView(LoginRequiredMixin, CreateView):
	model = Sitterinforegistration
	fields = ['sitterinforegistration_id', 'owner', 'petsitter_id', 'request_id', 'posted', 'posteddate', 'caringweight_id', 'board_id', 'address', 'attachment', 'nearbysubwaystation', 'cohabitationstatus', 'childstatusunder14', 'ppp', 'introduction', 'sitterlevel']
	success_url = reverse_lazy('sitterinforegistration:index')

	def form_valid(self, form):
		form.instance.owner = self.request.user
		return super(sitterinforegistrationCreateView, self).form_valid(form)

class SitterinforegistrationChangeLV(LoginRequiredMixin, ListView):
	template_name = 'sitterinforegistration/sitterinforegistration_change_list.html'

	def get_queryset(self):
		return sitterinforegistration.objects.filter(owner=self.request.user)

class SitterinforegistrationUpdateView(LoginRequiredMixin, UpdateView):
	model = Sitterinforegistration
	fields = ['sitterinforegistration_id', 'owner', 'petsitter_id', 'request_id', 'posted', 'posteddate', 'caringweight_id', 'board_id', 'address', 'attachment', 'nearbysubwaystation', 'cohabitationstatus', 'childstatusunder14', 'ppp', 'introduction', 'sitterlevel']
	success_url = reverse_lazy('sitterinforegistration:index')

class SitterinforegistrationDeleteView(LoginRequiredMixin, DeleteView):
	model = Sitterinforegistration
	success_url = reverse_lazy('sitterinforegistration:index')