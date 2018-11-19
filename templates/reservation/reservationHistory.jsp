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
<!-- 서브페이지 코딩은 여기에~!! -->
	<div class="location-tow mb-120">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="location-title">
                            <h1>예약</h1>
                        </div>
                        <div class="location-content location-content-tow">
                            <ul>
                                <li><a href="main/home.jsp">예약 하기</a></li>
                                <li class="active">내역 확인</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>


		<div class="service-item-area mb-120">
		    <div class="container">
		        <div class="row">
 <!--내용 들어가면 됩니다-->

<div class="col-12">
                        <form action="#">
                            <div class="table-content table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="cart-product-name">예약번호</th>
                                            <th class="alohadog-product-price">시터명</th>
                                            <th class="alohadog-product-subtotal">예약일자</th>
                                            <th class="alohadog-product-subtotal">지역</th>
                                            <th class="alohadog-product-subtotal">결제 금액</th>
                                            <th class="alohadog-product-subtotal">상태</th>
                                            <th class="alohadog-product-remove">취소</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td class="alohadog-product-name"><a href="#">100284</a></td>
                                            <td class="alohadog-product-price"><span class="amount">김화분</span></td>
                                            <td class="product-subtotal"><span class="amount">2018. 07. 26</span></td>
                                            <td class="product-subtotal"><span class="amount">서울시 노원구</span></td>
                                            <td class="product-subtotal"><span class="amount">77,000</span></td>
                                            <td class="product-subtotal"><span class="amount">입금 전</span></td>
                                            <td class="alohadog-product-remove"><a href="#"><i class="fa fa-times"></i></a></td>
                                        </tr>

                                        <tr>
                                            <td class="alohadog-product-name"><a href="#">100283</a></td>
                                            <td class="alohadog-product-price"><span class="amount">김지홍</span></td>
                                            <td class="product-subtotal"><span class="amount">2018. 07. 23</span></td>
                                            <td class="product-subtotal"><span class="amount">남양주시 화도읍</span></td>
                                            <td class="product-subtotal"><span class="amount">25,000</span></td>
                                            <td class="product-subtotal"><span class="amount">입금완료</span></td>
                                            <td class="product-subtotal"><span class="amount">불가</span></td>
                                        </tr>


                                        <tr>
                                            <td class="alohadog-product-name"><a href="#">100282</a></td>
                                            <td class="alohadog-product-price"><span class="amount">황윤희</span></td>
                                             <!--이제 '제품명' 이런거에다가 {{ item.title }}이런거 넣으면 데이터 뜸 -->
                                            <td class="product-subtotal"><span class="amount">2018. 07. 06</span></td>
                                            <td class="product-subtotal"><span class="amount">서울시 송파구</span></td>
                                            <td class="product-subtotal"><span class="amount">35,600</span></td>
                                            <td class="product-subtotal"><span class="amount">이용완료</span></td>
                                            <td class="product-subtotal"><span class="amount">불가</span></td>

                                        </tr>
                                        <tr>
                                            <td class="alohadog-product-name"><a href="#">100281</a></td>
                                            <td class="alohadog-product-price"><span class="amount">최베로카</span></td>
                                            <td class="product-subtotal"><span class="amount">2018. 06. 29</span></td>
                                            <td class="product-subtotal"><span class="amount">성남시 분당구</span></td>
                                            <td class="product-subtotal"><span class="amount">40,000</span></td>
                                            <td class="product-subtotal"><span class="amount">이용완료</span></td>
                                            <td class="product-subtotal"><span class="amount">불가</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                    </div>
 <!--내용 끝-->
                </div>
		    </div>
		</div>
</body>

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