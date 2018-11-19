<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="alohadog.reservation.ReservationDBBean"
    import="alohadog.reservation.ReservationDataBean"
%>
<%@ include file="/common/common.jspf" %>
<%@ include file="/main/base.jsp" %>

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
	<link rel="stylesheet" type="text/css" href="<%= CTX %>/resources/css/board.css">
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
	
	<script>
	var wStatus = true;
	
	$(document).ready(function(){
	    
	    //글삭제폼의 [삭제]버튼을 클릭하면 자동실행
	    $("#b_delete").click(function(){
	        formCheckIt();
	        if(wStatus){
	          //[삭제]버튼의 값으로 지정된 현재페이지 번호를 얻어냄
	          var pageNum = $("#b_delete").val();
	          //글번호와 글삭제폼에 입력된 값을 얻어내서 query에 저장
	          var query = {passwd:$("#passwd").val(),
	                       num:$("#num").val()};
	          
	          //query값을 갖고 deletePro.jsp실행
	          $.ajax({
	             type: "POST",
	             url: "../reservation/deletePro.jsp",
	             data: query,
	             success: function(data) {
	            	 data = data.trim();
	                 if(data == "true") { //글삭제 처리에 성공한 경우
	                    alert("글이 삭제되었습니다.");
	                    var query = "../reservation/list.jsp?pageNum=" + pageNum;
	                    $("#main_reservation").load(query);
	                 } else { //글삭제 처리에 실패한 경우
	                    alert("비밀번호 틀림.");
	                    $("#passwd").val("");
	                    $("#passwd").focus();
	                 }
	             }
	          });
	        }
	    });
	    
	    //글삭제폼의 [삭제]버튼을 클릭하면 자동실행
	    //글목록보기 list.jsp페이지를 표시
	    $("#b_cancle").click(function(){
	        var pageNum = $("#b_cancle").val();
	        var query = "../reservation/list.jsp?pageNum=" + pageNum;
	        $("#main_reservation").load(query);
	    });
	
	});
	
	//글삭제 폼의 비밀번호 입력 유무 확인
	function formCheckIt(){
	    wStatus = true;
	    if(!$.trim($("#passwd").val())){
	        alert("비밀번호를 입력하세요.");
	        $("#passwd").focus();
	        wStatus = false;
	        return false;
	    }
	}
	</script>
	<%
	  request.setCharacterEncoding("utf-8");
	
	  //삭제할 글의 번호와 삭제할 글이 위치한 페이지 번호를 얻어냄
	  int num = Integer.parseInt(request.getParameter("num"));
	  String pageNum = request.getParameter("pageNum");
	%>
</head>

<body>
<div class="location-tow mb-80">
	<div class="container">
	    <div class="row">
	        <div class="col-12">
	            <div class="location-title">
	                <h1>펫시터 예약</h1>
	            </div>
	            <div class="location-content location-content-tow">
	                <ul>
	                    <li><a href="<%=CTX%>/index.do">home</a></li>
	                    <li class="active">예약 기록 삭제</li>
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
            		<div id="deleteForm">
					   <ul>
					      <li><label for="passwd">비밀번호</label>
					          <input id="passwd" name="passwd" type="password" size="20" placeholder="6~16자 숫자/문자" maxlength="16">
					          <input type="hidden" id="num" value="<%= num %>">
					      </li>
					      <li class="label2">
					          <button id="b_delete" value="<%= pageNum %>">예약기록삭제</button>
					          <button id="b_cancle" value="<%= pageNum %>">예약내역보기</button>
					      </li>
					   </ul>
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
