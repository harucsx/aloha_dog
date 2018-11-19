"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from django.conf.urls.static import static
from django.conf import settings

from oursite.views import HomeView
from oursite.views import UserCreateView
from oursite.views import UserCreateDoneTV
# registration--
from oursite.views import ModifyConfirmView
from oursite.views import ModifyFormView
from oursite.views import DeleteFormView
from oursite.views import DeleteDoneView
# member--
from oursite.views import AboutPetsitterView
from oursite.views import AboutUsView
from oursite.views import CaringPreviewView
# aboutUs--
from oursite.views import BoardListView
from oursite.views import PostWritingView
from oursite.views import ViewPostView
from oursite.views import EditPostView
from oursite.views import DeletePostView
# board
from oursite.views import Error404codeView
from oursite.views import Error500codeView
# error
from oursite.views import FaqView
# faq--
from oursite.views import PetInfoListView
from oursite.views import RegisterPetInfoView
from oursite.views import EditPetInfoView
from oursite.views import DeletePetInfoView
# pet
from oursite.views import ConfirmPetsitterView
from oursite.views import RegisterPetsitterInfoView
from oursite.views import EditPetsitterInfoView
from oursite.views import DeletePetsitterInfoView
# petsitter
from oursite.views import InterestedPetsitterView
from oursite.views import OTOInquiryHistoryView
# mypage
from oursite.views import ReservationView
from oursite.views import ReservationInfoView
from oursite.views import RHistoryMView
from oursite.views import RHistorySView
# reservation
from oursite.views import PaymentHistoryMView
from oursite.views import PaymentHistorySView
# Payment
from oursite.views import ReviewHistoryMView
from oursite.views import ReviewHistorySView
# Review
from oursite.views import Application1View
from oursite.views import Application2View
from oursite.views import Application3View
from oursite.views import EducationIntroView
from oursite.views import EducationDetailView
# petsitterApplication--
from oursite.views import FindPetsitterView
from oursite.views import PetsitterInfoView
# petsitterEmployment
from oursite.views import FreeServiceView
from oursite.views import PaidServiceView
# service--

# from django.views.generic import ListView, DetailView
# from bookmark.models import Bookmark

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^accounts/', include('django.contrib.auth.urls')),
    url(r'^accounts/register/$', UserCreateView.as_view(), name='register'),
    url(r'^accounts/register/done/$', UserCreateDoneTV.as_view(), name='register_done'),
    url(r'^$', HomeView.as_view(), name='home'),

    url(r'^member/modifyConfirm', ModifyConfirmView.as_view(), name='confirm'),
    url(r'^member/modifyForm', ModifyFormView.as_view(), name='modifyForm'),
    url(r'^member/memberDelete', DeleteFormView.as_view(), name='memberDelete'),
    url(r'^member/deleteDone', DeleteDoneView.as_view(), name='deleteDone'),
    # memberDONE
    url(r'^aboutUs/aboutPetsitter', AboutPetsitterView.as_view(), name='aboutPetsitter'),
    url(r'^aboutUs/aboutUs', AboutUsView.as_view(), name='aboutUs'),
    url(r'^aboutUs/caringPreview', CaringPreviewView.as_view(), name='caringPreview'),
    # aboutUsDONE
    url(r'^board/boardList', BoardListView.as_view(), name='boardList'),
    url(r'^board/postWriting', PostWritingView.as_view(), name='postWriting'),
    url(r'^board/viewPost', ViewPostView.as_view(), name='viewPost'),
    url(r'^board/editPost', EditPostView.as_view(), name='editPost'),
    url(r'^board/deletePost', DeletePostView.as_view(), name='deletePost'),
    # boardDONE
    url(r'^error/404code', Error404codeView.as_view(), name='404code'),
    url(r'^error/500code', Error500codeView.as_view(), name='500code'),
    # errorDONE
    url(r'^faq/faq', FaqView.as_view(), name='faq'),
    # faqDONE
    url(r'^pet/petInfoList', PetInfoListView.as_view(), name='petInfoList'),
    url(r'^pet/registerPetInfo', RegisterPetInfoView.as_view(), name='registerPetInfo'),
    url(r'^pet/editPetInfo', EditPetInfoView.as_view(), name='editPetInfo'),
    url(r'^pet/deletePetInfo', DeletePetInfoView.as_view(), name='deletePetInfo'),
    # petDONE
    url(r'^petsitter/confirmPetsitter', ConfirmPetsitterView.as_view(), name='confirmPetsitter'),
    url(r'^petsitter/registerPetsitterInfo', RegisterPetsitterInfoView.as_view(), name='registerPetsitterInfo'),
    url(r'^petsitter/editPetsitterInfo', EditPetsitterInfoView.as_view(), name='editPetsitterInfo'),
    url(r'^petsitter/deletePetsitterInfo', DeletePetsitterInfoView.as_view(), name='deletePetsitterInfo'),
    # petsitterDONE
    url(r'^mypage/interestedPetsitter', InterestedPetsitterView.as_view(), name='interestedPetsitter'),
    url(r'^mypage/otoInquiryHistory', OTOInquiryHistoryView.as_view(), name='otoInquiryHistory'),
    # mypageDONE
    url(r'^reservation/reservation', ReservationView.as_view(), name='reservation'),
    url(r'^reservation/reservationInfo', ReservationInfoView.as_view(), name='reservationInfo'),
    url(r'^reservation/rHistoryM', RHistoryMView.as_view(), name='rHistoryM'),
    url(r'^reservation/rHistoryS', RHistorySView.as_view(), name='rHistoryS'),
    # reservationDONE
    url(r'^payment/paymentHistoryM', PaymentHistoryMView.as_view(), name='paymentHistoryM'),
    url(r'^payment/paymentHistoryS', PaymentHistorySView.as_view(), name='paymentHistoryS'),
    # PaymentDONE
    url(r'^review/reviewHistoryM', ReviewHistoryMView.as_view(), name='reviewHistoryM'),
    url(r'^review/reviewHistoryS', ReviewHistorySView.as_view(), name='reviewHistoryS'),
    # reviewDONE
    url(r'^petsitterApplication/application1', Application1View.as_view(), name='application1'),
    url(r'^petsitterApplication/application2', Application2View.as_view(), name='application2'),
    url(r'^petsitterApplication/application3', Application3View.as_view(), name='application3'),
    url(r'^petsitterApplication/educationIntro', EducationIntroView.as_view(), name='educationIntro'),
    url(r'^petsitterApplication/educationDetail', EducationDetailView.as_view(), name='educationDetail'),
    # petsitterApplicationDONE
    url(r'^petsitterEmployment/findPetsitter', FindPetsitterView.as_view(), name='findPetsitter'),
    url(r'^petsitterEmployment/petsitterInfo', PetsitterInfoView.as_view(), name='petsitterInfo'),
    # petsitterEmploymentDONE
    url(r'^service/freeService', FreeServiceView.as_view(), name='freeService'),
    url(r'^service/paidService', PaidServiceView.as_view(), name='paidService'),
    # serviceDONE

    # # Class-based views
    # url(r'^bookmark/$', ListView.as_view(model=Bookmark), name='index'),
    # url(r'^bookmark/(?P<pk>\d+)/$', DetailView.as_view(model=Bookmark), name='detail'),
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)