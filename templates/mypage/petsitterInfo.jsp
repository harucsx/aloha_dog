<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/common.jspf" %>
<%@ include file="../main/base.jsp" %>

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
                        <h1>펫시터 정보</h1>
                    </div>
                    <div class="location-content location-content-tow">
                        <ul>
                            <li><a href="<%= CTX %>/index.do">Home</a></li>
                            <li class="active">비밀번호 확인</li>
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
                    	<form method="post" action="<%= CTX %>/petsitterInfoRegisterForm.do" class="formA">

    						<fieldset class="aligned">

    							<div class="form-row">
    								<span class="id_">ID</span>
									<input name="inputContent" type="text" class="inputContent" id="id" value="${id}" readonly>
    							</div>

    							<div class="form-row">
    								<span class="pw_1">비밀번호</span> 
    								<input type="password" name="pw" id="pw" placeholder="8자리이상 20자리이하 영문,숫자,특수문자중 2가지를 혼합 입력해주세요." minlength="8" maxlength="20" required>
    							</div>

    						</fieldset>

    						<div class="clearfix">
    					      	<button class="registerXbtn" onclick="window.location.href='<%= CTX %>/index.do';">취소</button>
    					      	<button class="registerbtn" type="submit">펫시터 정보 수정</button>
    					    </div>
    					  
    					</form>
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
