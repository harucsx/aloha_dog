<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="alohadog.reservation.ReservationDBBean"
    import="alohadog.reservation.ReservationDataBean"
    import="alohadog.bean.LogonDataBean"
    import="alohadog.bean.LogonDBBean"
    import="alohadog.bean.PetsitterDataBean"
    import="alohadog.bean.PetsitterDBBean"
    import="java.util.*"
    import="java.text.SimpleDateFormat"
%>
<%@ include file="/common/common.jspf" %>
<%@ include file="/main/base.jsp" %>

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
	    $("#reservationHistory").click(function(){//[예약내역으로 돌아가기]버튼 클릭
			 window.location.href = "<%= CTX %>/reservationHistory.do";
	    });
	});
	</script>
</head>
<%

	String num = request.getParameter("num");
	ReservationDBBean reservationDBBean = ReservationDBBean.getInstance();
	ReservationDataBean r = reservationDBBean.getArticle(num); 

	LogonDBBean logonDBBean = LogonDBBean.getInstance();
	LogonDataBean m = logonDBBean.getMember(r.getWriter());
	
	PetsitterDBBean petsitterDBBean = PetsitterDBBean.getInstance();
	PetsitterDataBean p = petsitterDBBean.getSitterByName(r.getSitter());
	
	LogonDataBean pm = logonDBBean.getMember(p.getId());

%>
<body>
	<div class="location-tow mb-50">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="location-title">
                        <h1>예약내역</h1>
                    </div>
                    <div class="location-content location-content-tow">
                        <ul>
                            <li><a href="<%=CTX%>/index.do">Home</a></li>
                            <li class="active">예약내역 상세</li>
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
   	 			<span class="reservaionNum"><span class='titleRB'>예약번호</span>
   	 			<%= String.valueOf(r.getRegDate().getYear() + 1900) + 
					String.valueOf(r.getRegDate().getMonth() + 1) + 
				   String.valueOf(r.getRegDate().getDate()) + r.getNum() %>
				   </span>
   	 			<span class="reservaionDate"><span class='titleRB'>예약날짜</span> <%= String.valueOf(r.getRegDate().getYear() + 1900) %>년
				<%=	String.valueOf(r.getRegDate().getMonth() + 1) %>월
				<%= String.valueOf(r.getRegDate().getDate()) %>일</span>
                    <div class="blog_area" style="margin-top: 25px;">
                    	<div class="reservationForm">

    						<fieldset class="aligned" >
								
    							<div class="form-row">
								<table class="reservaionTable">
									<tr>
									    <th>회원이름</th>
									    <td><%= m.getName() %></td>
									</tr>
									
									<tr>
									    <th>회원주소</th>
									    <td><%= m.getAddress1() %></td>
									</tr>
									
									<tr>
									    <th>회원전화번호</th>
									    <td><%= m.getPhone() %></td>
									</tr>
									
									<tr>
									    <th>회원이메일</th>
									    <td><%= m.getEmail() %></td>
									</tr>
									
									<tr>
									    <th>반려견이름</th>
									    <td><%= r.getPet() %></td>
									</tr>
									
									<tr>
									    <th>돌봄시작날짜</th>
									    <td><%= r.getStartdate() %></td>
									</tr>
									
									<tr>
									    <th>돌봄종료날짜</th>
									    <td><%= r.getEnddate() %></td>
									</tr>
									
									<tr>
									    <th rowspan="6">선택 무료서비스</th>
									    <td><%= (p.getFree_service1() != null) ? "노령견케어" : "" %></td>
									</tr>
									
									<tr>
									    <td><%= (p.getFree_service2() != null) ? "환자견케어" : "" %></td>
								    </tr>
								    
								    <tr>
									    <td><%= (p.getFree_service3() != null) ? "자격증보유" : "" %></td>
									</tr>
									
									<tr>
										<td><%= (p.getFree_service4() != null) ? "실외배변" : "" %></td>
									</tr>
									
									<tr>
										<td><%= (p.getFree_service5() != null) ? "응급처치" : "" %></td>
									</tr>
									
									<tr>
										<td><%= (p.getFree_service6() != null) ? "투약가능" : "" %></td>
									</tr>
									
									<tr>
									    <th rowspan="5">선택 유료서비스</th>
									    <td><%= (p.getPaid_service1() != null) ? "목욕가기" : "" %></td>
									</tr>
									
									<tr>
										<td><%= (p.getPaid_service2() != null) ? "병원가기" : "" %></td>
									</tr>
										
									<tr>
									    <td><%= (p.getPaid_service3() != null) ? "픽업가능" : "" %></td>
									</tr>
									    
									<tr>
									    <td><%= (p.getPaid_service4() != null) ? "수제간식" : "" %></td>
									</tr>
									    
									<tr>
									    <td><%= (p.getPaid_service5() != null) ? "미용가기" : "" %></td>
									</tr>
									
									<tr>
									    <th>주의사항</th>
									    <td><%= r.getPrecautions() %></td>
									</tr>
									
									<tr>
									    <th>돌봄가격</th>
									    <td><%= r.getPayment() + "원"%></td>
									</tr>
									
									<tr>
									    <th>진행사항</th>
									    <td><%= r.getProgress() %></td>
									</tr>
									
									<tr>
									    <th>펫시터이름</th>
									    <td><%= pm.getName() %></td>
									</tr>
									
									<tr>
									    <th style="border-bottom:none;">펫시터주소</th>
									    <td style="border-bottom:none;">서울 성동구</td>
									</tr>
								</table>
								</div>
                                
    						</fieldset>

    						<div style="width: 150px;margin: 0 auto;">
    					      	<a href="<%= CTX %>/main/main-reservation.jsp"><button class="reservationHistoryBtn" id="reservationHistory">예약내역</button></a>
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