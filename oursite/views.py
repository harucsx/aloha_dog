from django.views.generic.base import TemplateView

from django.views.generic.edit import CreateView
from django.contrib.auth.forms import UserCreationForm
from django.urls import reverse_lazy

from django.contrib.auth.decorators import login_required

# --- TemplateView
class HomeView(TemplateView):
	template_name = 'home.html'

# --- User Creation
class UserCreateView(CreateView):
	template_name = 'registration/register0.html'
	form_class = UserCreationForm
	success_url = reverse_lazy('register_done')

class UserCreateDoneTV(TemplateView):
	template_name = 'registration/register_done.html'

class LoginRequiredMixin(object):
	@classmethod
	def as_view(cls, **initkwargs):
		view = super(LoginRequiredMixin, cls).as_view(**initkwargs)
		return login_required(view)

# --- templateTest----------------------------------
# member (회원확인, 수정+정보, 탈퇴, 탈퇴끝)
class ModifyConfirmView(TemplateView):
	template_name = 'member/modifyConfirm.html'
class ModifyFormView(TemplateView):
	template_name = 'member/modifyForm.html'
class DeleteFormView(TemplateView):
	template_name = 'member/memberDelete.html'
class DeleteDoneView(TemplateView):
	template_name = 'member/memberDeleteDone.html'

# aboutUs (펫시터소개, 회사소개, 돌봄미리보기)
class AboutPetsitterView(TemplateView):
	template_name = 'aboutUs/aboutPetsitter.html'
class AboutUsView(TemplateView):
	template_name = 'aboutUs/aboutUs.html'
class CaringPreviewView(TemplateView):
	template_name = 'aboutUs/caringPreview.html'

# board (목록, 등록, 내용, 수정, 삭제)
class BoardListView(TemplateView):
	template_name = 'board/boardList.html'
class PostWritingView(TemplateView):
	template_name = 'board/postWriting.html'
class ViewPostView(TemplateView):
	template_name = 'board/viewPost.html'
class EditPostView(TemplateView):
	template_name = 'board/editPost.html'
class DeletePostView(TemplateView):
	template_name = 'board/deletePost.html'

# error (404에러, 500에러)
class Error404codeView(TemplateView):
	template_name = 'error/404code.html'
class Error500codeView(TemplateView):
	template_name = 'error/500code.html'

# faq
class FaqView(TemplateView):
	template_name = 'faq/faq.html'

# pet (목록, 등록, 수정+정보, 삭제)
class PetInfoListView(TemplateView):
	template_name = 'pet/petInfoList.html'
class RegisterPetInfoView(TemplateView):
	template_name = 'pet/registerPetInfo.html'
class EditPetInfoView(TemplateView):
	template_name = 'pet/editPetInfo.html'
class DeletePetInfoView(TemplateView):
	template_name = 'pet/deletePetInfo.html'

# petsitter (회원확인, 등록, 수정+정보, 탈퇴)
class ConfirmPetsitterView(TemplateView):
	template_name = 'petsitter/confirmPetsitter.html'
class RegisterPetsitterInfoView(TemplateView):
	template_name = 'petsitter/registerPetsitterInfo.html'
class EditPetsitterInfoView(TemplateView):
	template_name = 'petsitter/editPetsitterInfo.html'
class DeletePetsitterInfoView(TemplateView):
	template_name = 'petsitter/deletePetsitterInfo.html'

# mypage (관심펫시터, 1:1문의내역)
class InterestedPetsitterView(TemplateView):
	template_name = 'mypage/interestedPetsitter.html'
class OTOInquiryHistoryView(TemplateView):
	template_name = 'mypage/otoInquiryHistory.html'

# reservation (
# 예약, 예약정보+취소,
# 예약내역-회원, 예약내역-시터)
class ReservationView(TemplateView):
	template_name = 'reservation/reservation.html'
class ReservationInfoView(TemplateView):
	template_name = 'reservation/reservationInfo.html'
class RHistoryMView(TemplateView):
	template_name = 'reservation/reservationHistoryM.html'
class RHistorySView(TemplateView):
	template_name = 'reservation/reservationHistoryS.html'

# Payment (결제내역-회원, 결제내역-시터)
class PaymentHistoryMView(TemplateView):
	template_name = 'payment/paymentHistoryM.html'
class PaymentHistorySView(TemplateView):
	template_name = 'payment/paymentHistoryS.html'

# Review (리뷰내역-회원, 리뷰내역-시터)
class ReviewHistoryMView(TemplateView):
	template_name = 'review/reviewHistoryM.html'
class ReviewHistorySView(TemplateView):
	template_name = 'review/reviewHistoryS.html'

# petsitterApplication(
# 펫시터신청123, 
# 펫시터교육소개, 
# 펫시터교육소개상세)
class Application1View(TemplateView):
	template_name = 'petsitterApplication/application1.html'
class Application2View(TemplateView):
	template_name = 'petsitterApplication/application2.html'
class Application3View(TemplateView):
	template_name = 'petsitterApplication/application3.html'
class EducationIntroView(TemplateView):
	template_name = 'petsitterApplication/educationIntro.html'
class EducationDetailView(TemplateView):
	template_name = 'petsitterApplication/educationDetail.html'

# petsitterEmployment(펫시터찾기, 펫시터정보상세)
class FindPetsitterView(TemplateView):
	template_name = 'petsitterEmployment/findPetsitter.html'
class PetsitterInfoView(TemplateView):
	template_name = 'petsitterEmployment/petsitterInfo.html'

# service(유료,무료)
class FreeServiceView(TemplateView):
	template_name = 'service/freeService.html'
class PaidServiceView(TemplateView):
	template_name = 'service/paidService.html'