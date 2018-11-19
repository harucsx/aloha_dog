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
	                        <li><a href="main/home.jsp">Home</a></li>
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
	                            <h3>반려동물 추가</h3>
	                            <form method="post" action="." class="formA">
									<fieldset class="aligned">
	
										<div class="form-row">
											<span class="name">*이름</span> <input type="text" name="name" required>
										</div>
	
										<div class="form-row">
											<span class="age">*나이</span> <input type="number" step="any" name="age" required>
										</div>
	
										<div class="form-row sexA">
											<span class="sex">*성별</span> 
											<label class="radioC">f
												<input type="radio" name="sex" id="f" checked />
											  	<span class="checkmark">여자</span>
											</label>
											<label class="radioC">m
												<input type="radio" name="sex" id="m" />
												<span class="checkmark">남자</span>
											</label>
										</div>
	
										<div class="form-row">
											<span class="species">*종</span>
											<select name="species" id="species">
											    <option value="말티즈">말티즈</option>
											    <option value="시츄">시츄</option>
											    <option value="푸들">푸들</option>
											    <option value="잡종">잡종</option>
											    <option value="골든리트리버">골든리트리버</option>
											    <option value="요크셔테리어">요크셔테리어</option>
											    <option value="포메라니안">포메라니안</option>
											    <option value="치와와">치와와</option>
											    <option value="진돗개">진돗개</option>
											    <option value="닥스훈트">닥스훈트</option>
											    <option value="direct">직접입력</option>
											</select>
											<input type="text" id="selectDirect" name="selectDirect"/>
										</div>
	
										<div class="form-row">
											<span class="weight">*무게</span> <input type="number" step="any" name="weight" required>
										</div>
	
										<div class="form-row">
											<span class="dogimg">*사진</span> <input type="file" multiple="multiple" name="dogimg[]" required>
										</div>
	
										<div class="form-row neutralizationA">
											<span class="neutralization">*중성화여부</span> 
											<label class="radioC">y
												<input type="radio" name="neutralization" id="y" checked />
												<span class="checkmark">예</span>
											</label>
											<label class="radioC">n
												<input type="radio" name="neutralization" id="n" />
												<span class="checkmark">아니오</span>
											</label>
										</div>
	
									</fieldset>
									
									<div class="cuttingLine"></div>
									<h1 class="checkList"><span style="color: red">*</span>체크리스트</h1>
	
									<fieldset class="aligned">
										
										<div class="form-row qA">
											<span class="q1 question">예방접종1</span> 
											<label class="radioC">y
												<input type="radio" name="a1" id="y" />
												<span class="checkmark">예</span>
											</label>
											<label class="radioC">n
												<input type="radio" name="a1" id="n" checked />
												<span class="checkmark">아니오</span>
											</label>
										</div>
	
										<div class="form-row qA">
											<span class="q2 question">예방접종2</span>
											<label class="radioC">y
												<input type="radio" name="a2" id="y" />
												<span class="checkmark">예</span>
											</label>
											<label class="radioC">n
												<input type="radio" name="a2" id="n" checked />
												<span class="checkmark">아니오</span>
											</label>
										</div>
	
										<div class="form-row qA">
											<span class="q3 question">예방접종3</span>
											<label class="radioC">y
												<input type="radio" name="a3" id="y" />
												<span class="checkmark">예</span>
											</label>
											<label class="radioC">n
												<input type="radio" name="a3" id="n" checked />
												<span class="checkmark">아니오</span>
											</label>
										</div>
	
										<div class="form-row qA">
											<span class="q4 question">예방접종4</span>
											<label class="radioC">y
												<input type="radio" name="a4" id="y" />
												<span class="checkmark">예</span>
											</label>
											<label class="radioC">n
												<input type="radio" name="a4" id="n" checked />
												<span class="checkmark">아니오</span>
											</label>
										</div>
	
									</fieldset>
	
									<script type="text/javascript">
										//셀렉트박스직접입력
										$(function(){
											$("#selectDirect").hide();
											$("#species").change(function() {
												if($("#species").val() == "direct") {
													$("#selectDirect").show();
												}  else {
													$("#selectDirect").hide();
												}
											})
										});
									</script>
	
									<div class="clearfix">
								      	<a href="{% url 'dog_info' %}">
								      		<button class="addXbtn">취소</button>
								      	</a>
								      	<input type="submit" value="추가"class="addbtn" />
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