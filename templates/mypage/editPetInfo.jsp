<!-- ok -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/common.jspf" %>
<%@ include file="../main/base.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>ALOHA DOG!</title>
	<meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="robots" content="noindex, follow" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- css -->
	<style type="text/css">/*font-family*/
		@font-face {/*nanum*/
		   font-family: 'nanum';
		   src: url('<%= CTX %>/resources/font/NanumGothic/NanumGothic.eot'),
		        url('<%= CTX %>/resources/font/NanumGothic/나눔고딕.ttf'),
		        url('<%= CTX %>/resources/font/NanumGothic/NanumGothic.otf'),
		        url('<%= CTX %>/resources/font/NanumGothic/NanumGothic.woff');
		}
		@font-face {/*squareR*/
		   font-family: 'squareR';
		   src: url('<%= CTX %>/resources/font/SquareR/NanumSquareR.eot'),
		        url('<%= CTX %>/resources/font/SquareR/NanumSquareR.ttf'),
		        url('<%= CTX %>/resources/font/SquareR/NanumSquareR.otf'),
		        url('<%= CTX %>/resources/font/SquareR/NanumSquareR.woff');
		}
		@font-face {/*squareB*/
		   font-family: 'squareB';
		   src: url('<%= CTX %>/resources/font/SquareB/NanumSquareB.eot'),
		        url('<%= CTX %>/resources/font/SquareB/NanumSquareB.ttf'),
		        url('<%= CTX %>/resources/font/SquareB/NanumSquareB.otf'),
		        url('<%= CTX %>/resources/font/SquareB/NanumSquareB.woff');
		}
	</style>
	<link rel="stylesheet" type="text/css" href="<%= CTX %>/style.css">
	<link rel="stylesheet" type="text/css" href="<%= CTX %>/resources/css/submenu.css">
	<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<script>
	$(document).ready(function(){
	    $("#uSignup").click(function(){//[회원가입]버튼 클릭
	        window.location.href = "<%= CTX %>/signupForm.do";
	    });
	    
	    $("#uLogin").click(function(){//[로그인]버튼 클릭
	        window.location.href = "<%= CTX %>/loginForm.do";
	    });
	    
	    $("#uUpdate").click(function(){//[회원 정보 변경]버튼 클릭
	        window.location.href = "<%= CTX %>/modify.do";
	    });
	    
	    $("#uLogout").click(function(){//[로그아웃]버튼 클릭
	        $.ajax({
	           type: "POST",
	           url: "<%= CTX %>/logout.do",
	           success: function(data){
	               window.location.href = "<%= CTX %>/index.do";
	           }
	        });
	    });
	});
	</script>
</head>

<body>
	<div class="location-tow mb-120">
	    <div class="container">
	        <div class="row">
	            <div class="col-12">
	                <div class="location-title">
	                    <h1>마이페이지</h1>
	                </div>
	                <div class="location-content location-content-tow">
	                    <ul>
	                        <li><a href="/main/home.jsp">Home</a></li>
	                        <li><a href="#">마이페이지</a></li>
	                        <li class="active">반려동물 정보</li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="my-account white-bg mb-110">
	    <div class="container">
	        <div class="account-dashboard">
	            <div class="row">
	                <div class="col-md-12 col-lg-2">
	                    <ul class="nav flex-column dashboard-list" role="tablist">
	                        <li> <a class="nav-link" href="<%= CTX %>/modify.do">개인정보</a></li>
	                        <li><a class="nav-link" href="../member/changePassword.jsp">비밀번호 변경</a></li>
	                        <li><a class="nav-link active" href="petInfo.jsp">반려동물 정보</a></li>
	                        <li><a class="nav-link" href="petsitterInfo.jsp">펫시터 정보</a></li>
	                        <li><a class="nav-link" href="reservationHistory.jsp">예약내역</a></li>
	                        <li><a class="nav-link" href="paymentHistory.jsp">결제 내역</a></li>
	                        <li><a class="nav-link" href="interestedPetsitter.jsp">관심 펫시터</a></li>
	                        <li><a class="nav-link" href="../main/main-board.jsp">1:1문의 내역</a></li>
	                        <li><a class="nav-link" href="reviewHistory.jsp">리뷰 내역</a></li>
	                        <li><a class="nav-link" href="../member/withdrawal.jsp">회원탈퇴</a></li>
	                    </ul>
	                </div>
	                <div class="col-md-12 col-lg-10">
	                    <div class="tab-content dashboard-content">
	                        <div id="dashboard" class="tab-pane fade show active">
	                            <h3>반려동물 수정</h3>
	
	                            <form method="post" action="." class="formA">
									<fieldset class="aligned">
										    <div class="form-row">
										    <div class="dogimgBox">
											<img id="dogimg1" src="../resources/img/section2-img1.jpg">
											<img id="dogimg2" src="../resources/img/section2-img2.jpg">
											<img  id="dogimg3" src="../resources/img/section2-img3.jpg">
											<div id="di-modal" class="di-modal">
												<span class="di-close">&times;</span>
												<img class="di-modal-content" id="img01">
											</div>
											<script>
												var modal = document.getElementById('di-modal');
												var img1 = document.getElementById('dogimg1');
												var img2 = document.getElementById('dogimg2');
												var img3 = document.getElementById('dogimg3');
												var modalImg = document.getElementById("img01");
												img1.onclick = function(){
												    modal.style.display = "block";
												    modalImg.src = this.src;
												}
												img2.onclick = function(){
												    modal.style.display = "block";
												    modalImg.src = this.src;
												}
												img3.onclick = function(){
												    modal.style.display = "block";
												    modalImg.src = this.src;
												}
												var span = document.getElementsByClassName("di-close")[0];
												span.onclick = function() { 
												    modal.style.display = "none";
												}
											</script>
										</div>
                                    <span class="pet_kind">견종</span>
                           <select name="pet_kind" id="pet_kind">
                               <option value="요크셔테리어">요크셔테리어</option>
                               <option value="말티즈">말티즈</option>
                               <option value="시츄">시츄</option>

                           </select></div></fieldset></form>
                           <input type="text" id="pet_kind_selectDirect" name="pet_kind_selectDirect"/><script type="text/javascript">
                              //셀렉트박스직접입력
                              $(function(){
                                 $("#pet_kind_selectDirect").hide();
                                 $("#pet_kind").change(function() {
                                    if($("#pet_kind").val() == "direct") {
                                       $("#pet_kind_selectDirect").show();
                                    }  else {
                                       $("#pet_kind_selectDirect").hide();
                                    }
                                 })
                              });
                           </script>
                                </div>
   
                        <div class="form-row">
                           <span class="pet_gender_span">성별</span> 
                           <label class="radioC">F
                              <input type="radio" name="pet_gender" class="pet_gender" value="F"/>
                                <span class="checkmark">암컷</span>
                           </label>
                           <label class="radioC">M
                              <input type="radio" name="pet_gender" class="pet_gender" value="M"/>
                              <span class="checkmark">수컷</span>
                           </label>
                        </div>
   
                                <div class="form-row">
                                    <span class="pet_weight_span">강아지의 몸무게는 몇 kg 인가요?</span>
                                    <input type="number" name="pet_weight" min="0" required><span style="padding: 15px 0;">kg</span>
                                    <span style="padding: 15px 0;"></span>
                                </div>
                                
                                <div class="form-row">
                                    <span class="pet_name_span">강아지의 이름을 알려주세요.</span>
                                    <textarea rows="2" cols="50" name="pet_name" class="pet_name_textarea"></textarea>
                                </div>
                                
                                
                           <div class="form-row">
                           <span class="pet_neutralization_span">강아지는 중성화 수술을 했습니까?</span> 
                           <label class="radioC">Y
                              <input type="radio" name="pet_neutralization" class="pet_neutralization" value="Y"/>
                                <span class="checkmark">Yes</span>
                           </label>
                           <label class="radioC">N
                              <input type="radio" name="pet_neutralization" class="pet_neutralization" value="N"/>
                              <span class="checkmark">No</span>
                           </label>
                        </div>


                   <div class="form-row">
                                    <span class="registerBirth">생년월일</span>
                                    <script type="text/javascript">
                                        var today = new Date(); 
                                        var toyear = parseInt(today.getFullYear()); 
                                        var start = toyear - 5 
                                        var end = toyear - 70; 

                                        document.write("<font size=2><select name=birthyy>"); 
                                        document.write("<option value='' selected>"); 
                                        for (i=start;i>=end;i--) document.write("<option>"+i); 
                                        document.write("</select>년  "); 

                                        document.write("<select name=birthmm>"); 
                                        document.write("<option value='' selected>"); 
                                        for (i=1;i<=12;i++) document.write("<option>"+i); 
                                        document.write("</select>월  "); 

                                        document.write("<select name=birthdd>"); 
                                        document.write("<option value='' selected>"); 
                                        for (i=1;i<=31;i++) document.write("<option>"+i); 
                                        document.write("</select>일  </font>"); //생년월일select//생년월일
                                    </script>
                                </div>
    
                                <div class="form-row">
                                    <span class="pet_q1">다른 강아지들을 만났을 때의 반응을 알려주세요</span>
                                    <select name="pet_q1" id="pet_q1"> 
                                        <option value="1" selected>무서워하며 경계해요</option> 
                                        <option value="2">짖거나 달려들어요</option>
                                        <option value="3">반가워하며 함께 놀아요</option>
                                        <option value="4">별로 관심을 두지 않아요</option>
                                        <option value="5">죽일 듯이 싸워요</option>
                                    </select>
                                    </div>
                                <div class="form-row">
                                <span class="pet_q2_span">다른 사람들을 만났을 때의 반응을 알려주세요</span>
                                <select name="pet_q2" id="pet_q2"> 
                                        <option value="1" selected>무서워하며 경계해요</option> 
                                        <option value="2">짖거나 달려들어요</option>
                                        <option value="3">반가워하며 함께 놀아요</option>
                                        <option value="4">별로 관심을 두지 않아요</option>
                                        <option value="5">죽일 듯이 싸워요</option>
                                    </select>
                                    </div>
                                    
                          <div class="form-row">
                           <span class="pet_p3_span">다른 사람이나 강아지를 공격하여 상해를 입힌 적이 있나요?</span> 
                           <label class="radioC">
                              <input type="radio" id="pet_q3" name="pet_p3" class="pet_p3" value="Y"/>
                                <span class="checkmark">네</span>
                           </label>
                           <label class="radioC">M
                              <input type="radio" id="pet_q3" name="pet_p3" class="pet_p3" value="N"/>
                              <span class="checkmark">아니오</span>
                           </label>
                        </div>
                        
                        
                         <div class="form-row">
                           <span class="pet_q4_span">예방 접종을 완료하셨나요?</span> 
                           <label class="radioC">
                              <input type="radio" id="pet_q4" name="pet_q4" class="pet_q4" value="Y"/>
                                <span class="checkmark">네</span>
                           </label>
                           <label class="radioC">
                              <input type="radio" id="pet_q4" name="pet_q4" class="pet_q4" value="N"/>
                              <span class="checkmark">아니오</span>
                           </label>
                        </div>

	

									</fieldset>
									
									<div class="clearfix modifyClearfix">
								      	<a href="../mypage/petInfo.jsp">
								      		<button class="modifyXbtn">취소</button>
								      	</a>
								      	<input type="submit" value="수정"class="modifybtn" />
								      	<input type="submit" value="삭제"class="modifyDeletebtn" />
								    </div>
	
								</form>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

	<!-- script -->
	<script src="<%= CTX %>/resources/js/js/bootstrap.min.js"></script><!-- main불필요, sub필요 -->
	<script src="<%= CTX %>/resources/js/js/jquery.counterup.min.js"></script>
	<script src="<%= CTX %>/resources/js/js/owl.carousel.min.js"></script>
	<script src="<%= CTX %>/resources/js/js/slick.min.js"></script>
	<script src="<%= CTX %>/resources/js/js/jquery.meanmenu.min.js"></script>
	<script src="<%= CTX %>/resources/js/js/jquery.scrollUp.min.js"></script>
	<script src="<%= CTX %>/resources/js/js/main.js"></script>
	<script src="<%= CTX %>/resources/js/alohadog.js"></script>
</body>
<%@ include file="/main/footer.jsp" %>
</html>