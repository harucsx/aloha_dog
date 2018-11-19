"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url
from sitterinforegistration.views import *

app_name='Sitterinforegistration'

urlpatterns = [
    url(r'^$', SitterinforegistrationLV.as_view(), name='index'),
    url(r'^(?P<pk>\d+)/$', SitterinforegistrationDV.as_view(), name='detail'),

    #추가, 바꾸기, 수정, 삭제
    # Example: /add/
    url(r'^add/$', SitterinforegistrationCreateView.as_view(), name="add",),

    # Example: /change/
    url(r'^change/$', SitterinforegistrationChangeLV.as_view(), name="change",),

    # Example: /99/update/
    url(r'^(?P<pk>[0-9]+)/update/$', SitterinforegistrationUpdateView.as_view(), name="update",),

    # Example: /99/delete/
    url(r'^(?P<pk>[0-9]+)/delete/$', SitterinforegistrationDeleteView.as_view(), name="delete",),
]