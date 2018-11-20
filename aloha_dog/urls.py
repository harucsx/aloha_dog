"""aloha_dog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from homepage import views
from homepage import users
from homepage import boards

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('join', users.join, name='join'),
    path('login', users.login, name='login'),
    path('logout', users.logout, name='logout'),
    path('profile', users.profile, name='profile'),

    path('sitter', views.sitter_list, name='sitter_list'),
    path('sitter/apply', views.sitter_apply, name='sitter_apply'),
    path('sitter/intro', views.sitter_intro, name='sitter_intro'),
    path('sitter/<int:id>', views.sitter_detail, name='sitter_detail'),

    path('board/<str:board_type>', boards.board_list, name='board_list'),
    path('board/<str:board_type>/<int:id>', boards.board_detail, name='board_detail'),
    path('board/<str:board_type>/<int:id>/edit', boards.board_edit, name='board_edit'),
    path('board/<str:board_type>/write', boards.board_write, name='board_write'),

    path('free-service', views.free_service, name='free-service'),
    path('paid-service', views.paid_service, name='paid-service'),
    path('faq', views.faq, name='faq'),
]
