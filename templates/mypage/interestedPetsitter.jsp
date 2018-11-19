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
	                <h1>관심 시터</h1>
	            </div>
	            <div class="location-content location-content-tow">
	                <ul>
	                    <li><a href="index.html">전체보기</a></li>
	                    <li class="active">관심 시터</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>
</div>

<!--관심펫시터 코딩-->
<div class="single-pricing mb-35">
	<div class="pricing-head">
		<div class="pricing-body"><!--service 부분 div 틀 -->
			<div class="single-testimonial text-center">
                <div class="testimonial-img">
                    <img src="../resources/img/interested_petsitter/eu3.jpg" alt="">
                </div>
                <div class="testimonial-author">
                	<h6><b>차은우</b> <span>대형견 전문 시터</span></h6>
                		<div class="wishlist-compare-btn">
                    		<a href="#" class="wishlist-btn"></a>
                    		<a href="#" class="add-compare">상세보기</a>
         				</div>
                </div>
            </div>
        </div>
	</div>
</div>

<div class="single-pricing mb-35">
	<div class="pricing-head">
		<div class="pricing-body"><!--service 부분 div 틀 -->
            <div class="single-testimonial text-center">
                <div class="testimonial-img">
                    <img src="../resources/img/interested_petsitter/eu1.jpg" alt="">
                </div>
                <div class="testimonial-author">
	               <h6><b>장그래</b> <span> TOP5 수상 시터</span></h6>
	                   <div class="wishlist-compare-btn">
	                       <a href="#" class="wishlist-btn"></a>
	                       <a href="#" class="add-compare">상세보기</a>
	           		</div>
               	</div>
            </div>
        </div>
	</div>   
</div>

<div class="single-pricing mb-35">
	<div class="pricing-head">
       	<div class="pricing-body"><!--service 부분 div 틀 -->
            <div class="single-testimonial text-center">
                <div class="testimonial-img">
                    <img src="../resources/img/interested_petsitter/eu2.jpg" alt="">
                </div>
                <div class="testimonial-author">
                    <h6><b>김지윤</b> <span>소형견 전문 시터</span></h6>
                    <div class="wishlist-compare-btn">
                        <a href="#" class="wishlist-btn"></a>
                        <a href="#" class="add-compare">상세보기</a>
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