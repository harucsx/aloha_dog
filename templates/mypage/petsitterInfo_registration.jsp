<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="alohadog.bean.PetsitterDataBean"
%>
<%@ include file="/common/common.jspf" %>

<c:if test="${empty sessionScope.id}">
<script>
window.location.href = "<%= CTX %>/index.do";
</script>
</c:if>

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
	    $("#register").click(function(){//[가입하기]버튼 클릭
	            var query = {
	    			id:$("#id").val(),
	    			name:$("#name").val(),
                    profilePhoto:$('#profilePhoto').val(),
                    housephoto:$("#housephoto").val(),
                    address:$("#address").val(),
                    time_price:$("#time_price").val(),
                    free_service1:$("input[name=free_service1]:checked").val(),
                    free_service2:$("input[name=free_service2]:checked").val(),
                    free_service3:$("input[name=free_service3]:checked").val(),
                    free_service4:$("input[name=free_service4]:checked").val(),
                    free_service5:$("input[name=free_service5]:checked").val(),
                    free_service6:$("input[name=free_service6]:checked").val(),
                    paid_service1:$("input[name=paid_service1]:checked").val(),
                    paid_service2:$("input[name=paid_service2]:checked").val(),
                    paid_service3:$("input[name=paid_service3]:checked").val(),
                    paid_service4:$("input[name=paid_service4]:checked").val(),
                    paid_service5:$("input[name=paid_service5]:checked").val(),
                    caringWeight:$("input[name=caringWeight]").val(),
                    ageAvailable:$("input[name=ageAvailable]").val(),
                    checkInTime_select:$("select[name=checkInTime_select]").val(),
                    checkInTime:$("input[name=checkInTime]").val(),
                    checkOutTime_select:$("select[name=checkOutTime_select]").val(),
                    checkOutTime:$("input[name=checkOutTime]").val(),
                    careEnvironment_space:$("input[name=careEnvironment_space]").val(),
                    careEnvironment_nearbySubway:$("input[name=careEnvironment_nearbySubway]").val(),
                    careEnvironment_yard:$("input[name=careEnvironment_yard]").val(),
                    petsitter_under14:$("input[name=petsitter_under14]").val(),
                    petsitter_family:$("input[name=petsitter_family]").val(),
                    careEnvironment_other:$("input[name=careEnvironment_other]").val(),
                    petsitter_intro:$("#petsitter_intro").val(),
                    petsitter_qna:$("#petsitter_qna").val(),
                    modify:$("#modify").val(),
                    };
	    
// 	            alert(JSON.stringify(query));
	            $.ajax({
	                type:"post",
	                url:"<%= CTX %>/petsitterInfoRegisterPro.do",
	                data:query,
	                success : function(data) {
	                	alert("펫시터 정보가 등록되었습니다.");
	                    window.location.href = "<%= CTX %>/index.do";
	                }
	            });
	      });
	      $("#cancle").click(function(){//[취소]버튼 클릭
	          window.location.href = "<%= CTX %>/index.do";
	      });
	});
	</script>
</head>
<%
   PetsitterDataBean p = (PetsitterDataBean) request.getAttribute("p");
	boolean modify = false;
	if (p != null){
		modify = true;
	} else {
		p = new PetsitterDataBean();
		p.setTime_price("");
		p.setCaringWeight("");
		p.setAgeAvailable("");
		p.setCheckInTime("   ");
		p.setCheckOutTime("   ");
		p.setCareEnvironment_space("");
		p.setCareEnvironment_yard("");
		p.setPetsitter_under14("");
		p.setPetsitter_family("");
		p.setCareEnvironment_other("");
		
	}
%>
<body>
	<div class="location-tow mb-70">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="location-title">
                        <h1>펫시터 정보 등록</h1>
                    </div>
                    <div class="location-content location-content-tow">
                        <ul>
                            <li><a href="<%=CTX%>/index.do">Home</a></li>
                            <li><a href="<%=CTX%>/petsitterInfo.do">펫시터 정보</a></li>
                            <li class="active">펫시터 정보 등록</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="blog-area white-bg pt-0 pb-0 mb-70">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 ml-auto mr-auto">
                    <div class="blog_area">
                    	<form method="post" action="<%= CTX %>/petsitterInfoRegisterPro.do" class="formA" name="petsitterInfoRegisterForm">
							<input type="hidden" id="modify" name="modify" value="<%= modify %>"/>
    						<fieldset class="aligned">

    							<div class="form-row">
    								<span class="petsitter_id">ID</span>
    								<input name="inputContent" type="text" class="inputContent" id="id" value="${id}" readonly>
    							</div>

    							<div class="form-row">
    								<span class="petsitter_name">이름</span>
    								<input name="inputContent" type="text" class="inputContent" id="name" value="${m.name}" readonly>
    							</div>

    							<div class="form-row">
    								<span class="petsitter_profilePhoto">프로필사진</span>
    								<input name="profilePhoto" type="file" class="profilePhoto petsitterPhoto" id="profilePhoto" accept="image/*" value=${p.profilePhoto}>
    							</div>

    							<div class="form-row">
    								<span class="petsitter_housephoto">집과 집주변사진</span>
    								<input name="housephoto" type="file" class="housephoto petsitterPhoto" id="housephoto" accept="image/*">
    							</div>

    							<div class="form-row">
    								<span class="petsitter_address1">주소</span>
    								<input style="width: 400px;" name="inputContent" type="text" class="inputContent" id="address" value="${m.address1}" readonly>
    							</div>
    							
								<div class="form-row">
									<span class="petsitter_address1">일당</span> 
									<input type="number" name="time_price" id="time_price" min="0" max="10000000" value="<%= p.getTime_price() %>"/><span style="margin: 5px 0">원</span>
								</div>
    							
								<div class="form-row">
									<span class="petsitter_free_service">무료 서비스 선택</span> 
									<div class="free_service_all">
										<label class="radioC free_service" style="margin-left: 0;">노령견케어
											<input type="checkbox" name="free_service1" value="노령견케어" <%= p.getFree_service1() != null ? "checked" : "" %>/>
										  	<span class="checkmark">노령견케어</span>
										</label>
										<label class="radioC free_service">환자견케어
											<input type="checkbox" name="free_service2" value="환자견케어" <%= p.getFree_service2() != null ? "checked" : "" %>/>
											<span class="checkmark">환자견케어</span>
										</label>
										<label class="radioC free_service">자격증보유
											<input type="checkbox" name="free_service3" value="자격증보유" <%= p.getFree_service3() != null ? "checked" : "" %>/>
											<span class="checkmark">자격증보유</span>
										</label>
										<br>
										<label class="radioC free_service" style="margin: 0 10px 10px 0;">실외배변
											<input type="checkbox" name="free_service4" value="실외배변" <%= p.getFree_service4()!= null ? "checked" : "" %>/>
											<span class="checkmark">실외배변</span>
										</label>
										<label class="radioC free_service" style="margin: 0 10px 10px 25px;">응급처치
											<input type="checkbox" name="free_service5" value="응급처치" <%= p.getFree_service5()!= null ? "checked" : "" %>/>
											<span class="checkmark">응급처치</span>
										</label>
										<label class="radioC free_service" style="margin: 0 10px 10px 25px;">투약가능
											<input type="checkbox" name="free_service6" value="투약가능" <%= p.getFree_service6()!= null ? "checked" : "" %>/>
											<span class="checkmark">투약가능</span>
										</label>
									</div>
								</div>
	
								<div class="form-row">
									<span class="petsitter_paid_service">유료 서비스 선택</span>
									<div class="paid_service_all">
										<label class="radioC paid_service" style="margin-left: 0; margin-right: 25px;">목욕가기
											<input type="checkbox" name="paid_service1" value="목욕가기" <%= p.getPaid_service1()!= null ? "checked" : "" %>/>
											<span class="checkmark">목욕가기</span>
										</label>
										<label class="radioC paid_service" style="margin-right: 25px;">병원가기
											<input type="checkbox" name="paid_service2" value="병원가기" <%= p.getPaid_service2()!= null ? "checked" : "" %>/>
											<span class="checkmark">병원가기</span>
										</label>
										<label class="radioC paid_service">픽업가능
											<input type="checkbox" name="paid_service3" value="픽업가능" <%= p.getPaid_service3()!= null ? "checked" : "" %>/>
											<span class="checkmark">픽업가능</span>
										</label>
										<br/>
										<label class="radioC paid_service" style="margin: 0 10px 10px 9px;margin-left: 0;">수제간식
											<input type="checkbox" name="paid_service4" value="수제간식" <%= p.getPaid_service4()!= null ? "checked" : "" %>/>
											<span class="checkmark">수제간식</span>
										</label>
										<label class="radioC paid_service" style="margin: 0 10px 10px 25px;">미용가기
											<input type="checkbox" name="paid_service5" value="미용가기" <%= p.getPaid_service5()!= null ? "checked" : "" %>/>
											<span class="checkmark">미용가기</span>
										</label>
									</div>
								</div>
	
								<div class="form-row">
									<span class="petsitter_caringWeight">돌봄 가능한 반려견 크기</span> 
									<div class="caringWeight_all">
										<label class="radioC caringWeight" style="margin-right: 27px;margin-left: 0;">5kg미만
											<input type="radio" name="caringWeight" value="5kg미만" 
											onClick="javascript:$('input[name=caringWeight]').attr('value', '5kg미만');"
											<%= p.getCaringWeight().equals("5kg미만") ? "checked" : "" %>/>
										  	<span class="checkmark">5kg미만</span>
										</label>
										<label class="radioC caringWeight" style="margin-right: 17px;">20kg미만
											<input type="radio" name="caringWeight" value="20kg미만" 
											onClick="javascript:$('input[name=caringWeight]').attr('value', '20kg미만');"
											<%= p.getCaringWeight().equals("20kg미만") ? "checked" : "" %>/>
											<span class="checkmark">20kg미만</span>
										</label>
										<label class="radioC caringWeight">40kg미만
											<input type="radio" name="caringWeight" value="40kg미만" 
											onClick="javascript:$('input[name=caringWeight]').attr('value', '40kg미만');"
											<%= p.getCaringWeight().equals("40kg미만") ? "checked" : "" %>/>
											<span class="checkmark">40kg미만</span>
										</label>
									</div>
								</div>
	
								<div class="form-row">
									<span class="petsitter_ageAvailable">돌봄 가능한 반려견 나이</span> 
									<div class="ageAvailable_all">
										<label class="radioC ageAvailable" style="margin-right: 29px;margin-left: 0;">1살미만
											<input type="radio" name="ageAvailable" value="1살미만" 
											onClick="javascript:$('input[name=ageAvailable]').attr('value', '1살미만');"
											<%= p.getAgeAvailable().equals("1살미만") ? "checked" : "" %>/>
										  	<span class="checkmark">1살미만</span>
										</label>
										<label class="radioC ageAvailable">6살미만
											<input type="radio" name="ageAvailable" value="6살미만" 
											onClick="javascript:$('input[name=ageAvailable]').attr('value', '6살미만');"
											<%= p.getAgeAvailable().equals("6살미만") ? "checked" : "" %>/>
										  	<span class="checkmark">6살미만</span>
										</label>
										<br/>
										<label class="radioC ageAvailable" style="margin: 0 30px 10px 0px;">12살미만
											<input type="radio" name="ageAvailable" value="12살미만" 
											onClick="javascript:$('input[name=ageAvailable]').attr('value', '12살미만');"
											<%= p.getAgeAvailable().equals("12살미만") ? "checked" : "" %>/>
										  	<span class="checkmark">12살미만</span>
										</label>
										<label class="radioC ageAvailable" style="margin: 0 10px 10px 0px;">20살미만
											<input type="radio" name="ageAvailable" value="20살미만" 
											onClick="javascript:$('input[name=ageAvailable]').attr('value', '20살미만');"
											<%= p.getAgeAvailable().equals("20살미만") ? "checked" : "" %>/>
										  	<span class="checkmark">20살미만</span>
										</label>
									</div>
								</div>
	
								<div class="form-row">
									<span class="petsitter_checkTime">체크인 & 체크아웃 시간</span> 
									<div class="checkTime_all">
										<label class="checkTime">
											<span>체크인</span>
											<select class="checkTime_select" name="checkInTime_select">
												<option value="오전" <%= p.getCheckInTime().contains("오전") ? "checked" : "" %>>오전</option>
												<option value="오후" <%= p.getCheckInTime().contains("오후") ? "checked" : "" %>>오후</option>
											</select>
											<input type="number" name="checkInTime" min="0" max="12" value="<%= p.getCheckInTime().substring(2) %>"/><span style="margin: 5px 0">시</span>
										</label>
										<label class="checkTime" style="margin-top: 0;">
											<span style="margin-right: 11px;">체크아웃</span>
											<select class="checkTime_select" name="checkOutTime_select">
												<option value="오전" <%= p.getCheckOutTime().contains("오전") ? "checked" : "" %>>오전</option>
												<option value="오후" <%= p.getCheckOutTime().contains("오후") ? "checked" : "" %>>오후</option>
											</select><input type="number" name="checkOutTime" min="0" max="12" value="<%= p.getCheckOutTime().substring(2) %>"/><span style="margin: 5px 0">시</span>
										</label>
									</div>
								</div>
	
								<div class="form-row">
									<h4 class="petsitter_careEnvironment">돌봄환경</h4> 
									<span class="petsitter_careEnvironment_space">돌봄공간</span>
									<div class="careEnvironment_space_all">
										<label class="radioC careEnvironment_space" style="margin-right: 39px;margin-left: 0;">아파트
											<input type="radio" name="careEnvironment_space" id="careEnvironment_space" value="아파트"
												onClick="javascript:$('input[name=careEnvironment_space]').attr('value', '아파트');"
											 <%= p.getCareEnvironment_space().equals("아파트") ? "checked" : "" %>/>
										  	<span class="checkmark">아파트</span>
										</label>
										<label class="radioC careEnvironment_space" style="margin-right: 53px;">주택
											<input type="radio" name="careEnvironment_space" value="주택" 
											onClick="javascript:$('input[name=careEnvironment_space]').attr('value', '주택');"
											<%= p.getCareEnvironment_space().equals("주택") ? "checked" : "" %>/>
											<span class="checkmark">주택</span>
										</label>
										<label class="radioC careEnvironment_space">빌라
											<input type="radio" name="careEnvironment_space" value="빌라" 
											onClick="javascript:$('input[name=careEnvironment_space]').attr('value', '빌라');"
											<%= p.getCareEnvironment_space().equals("빌라") ? "checked" : "" %>/>
											<span class="checkmark">빌라</span>
										</label>
									</div>
									<span class="petsitter_careEnvironment_nearbySubway">인근지하철역</span>
                                    <input type="text" name="careEnvironment_nearbySubway" value="${p.careEnvironment_nearbySubway}" required/>
									<span class="petsitter_careEnvironment_yard">마당유무</span>
									<div class="petsitter_radio_all">
										<label class="radioC petsitter_radio" style="margin-left: 0; margin-right: 72px;">Y
											<input type="radio" name="careEnvironment_yard" value="Y" 
											onClick="javascript:$('input[name=careEnvironment_yard]').attr('value', 'Y');"
											<%= p.getCareEnvironment_yard().equals("Y") ? "checked" : "" %>/>
										  	<span class="checkmark">Yes</span>
										</label>
										<label class="radioC petsitter_radio">N
											<input type="radio" name="careEnvironment_yard" value="N" 
											onClick="javascript:$('input[name=careEnvironment_yard]').attr('value', 'N');"
											<%= p.getCareEnvironment_yard().equals("N") ? "checked" : "" %>/>
											<span class="checkmark">No</span>
										</label>
									</div>
									<span class="petsitter_careEnvironment_under14">14세 미만 아동 유무</span>
									<div class="petsitter_radio_all">
										<label class="radioC petsitter_radio" style="margin-left: 0; margin-right: 72px;">Y
											<input type="radio" name="petsitter_under14" class="petsitter_under14" value="Y" 
											onClick="javascript:$('input[name=petsitter_under14]').attr('value', 'Y');"
											<%= p.getPetsitter_under14().equals("Y") ? "checked" : "" %>/>
										  	<span class="checkmark">Yes</span>
										</label>
										<label class="radioC petsitter_radio">N
											<input type="radio" name="petsitter_under14" class="petsitter_under14" value="N" 
											onClick="javascript:$('input[name=petsitter_under14]').attr('value', 'N');"
											<%= p.getPetsitter_under14().equals("N") ? "checked" : "" %>/>
											<span class="checkmark">No</span>
										</label>
									</div>
									<span class="petsitter_careEnvironment_family">가족동거유무</span>
									<div class="petsitter_radio_all">
										<label class="radioC petsitter_radio" style="margin-left: 0; margin-right: 72px;">Y
											<input type="radio" name="petsitter_family" value="Y" 
											onClick="javascript:$('input[name=petsitter_family]').attr('value', 'Y');"
											<%= p.getPetsitter_family().equals("Y") ? "checked" : "" %>/>
										  	<span class="checkmark">Yes</span>
										</label>
										<label class="radioC petsitter_radio">N
											<input type="radio" name="petsitter_family" value="N" 
											onClick="javascript:$('input[name=petsitter_family]').attr('value', 'N');"
											<%= p.getPetsitter_family().equals("N") ? "checked" : "" %>/>
											<span class="checkmark">No</span>
										</label>
									</div>
									<span class="petsitter_careEnvironment_other">다른 반려동물 유무</span>
									<div class="petsitter_radio_all">
										<label class="radioC petsitter_radio" style="margin-left: 0; margin-right: 72px;">Y
											<input type="radio" name="careEnvironment_other" value="Y" 
											onClick="javascript:$('input[name=careEnvironment_other]').attr('value', 'Y');"
											<%= p.getCareEnvironment_other().equals("Y") ? "checked" : "" %>/>
										  	<span class="checkmark">Yes</span>
										</label>
										<label class="radioC petsitter_radio">N
											<input type="radio" name="careEnvironment_other" value="N" 
											onClick="javascript:$('input[name=careEnvironment_other]').attr('value', 'N');"
											<%= p.getCareEnvironment_other().equals("N") ? "checked" : "" %>/>
											<span class="checkmark">No</span>
										</label>
									</div>
								</div>
                                
                                <div class="form-row">
                                    <span class="petsitter_intro">한줄소개</span>
                                    <textarea rows="1" cols="50" name="petsitter_intro" id="petsitter_intro" maxlength="100">${p.petsitter_intro}</textarea>
                                </div>
                                
                                <div class="form-row">
                                    <span class="petsitter_qna">Q & A</span>
                                    <textarea rows="15" cols="50" name="petsitter_qna" id="petsitter_qna" maxlength="1000">
                                    <% if (p.getPetsitter_qna() == null) { %>
Q. 왜 알로하도그 펫시터를 하게 되었나요?
A. 
              	
Q. 반려견을 키운 경험에 대해 알려주세요. 현재 반려견을 키우고 계시다면 자세히 소개해주세요!
A. 
              	
Q. 강아지와 함께할 산책로를 소개해주세요.
A. 
              	
Q. 애견호텔이 아닌 저에게 맡겨주시면 아래와 같은 내용을 약속드립니다.
A.
              	
※ 아래 유형의 아이들은 돌봄이 어려울 수 있습니다.
-
										<% } else { %>
										<%= p.getPetsitter_qna() %>
										<% } %>
                                    </textarea>
                                </div>
    						</fieldset>

    						<div class="clearfix">
    					      	<a href="<%=CTX %>/index.do" class="registerXtn" id="cancle">취소</a>
    					      	<div class="registerBtn" id="register">펫시터 정보 등록</button>
    					    </div>
    					</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<!-- script -->
	<script src="/resources/js/js/bootstrap.min.js"></script><!-- main불필요, sub필요 -->
	<script src="/resources/js/js/jquery.counterup.min.js"></script>
	<script src="/resources/js/js/owl.carousel.min.js"></script>
	<script src="/resources/js/js/slick.min.js"></script>
	<script src="/resources/js/js/jquery.meanmenu.min.js"></script>
	<script src="/resources/js/js/jquery.scrollUp.min.js"></script>
	<script src="/resources/js/js/main.js"></script>
	<script src="/resources/js/alohadog.js"></script>
</body>
<%@ include file="/main/footer.jsp" %>
</html>