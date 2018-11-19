<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="alohadog.board.BoardDBBean"
    import="alohadog.board.BoardDataBean"
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
	    //글수정폼의 [수정]버튼을 클릭하면 자동실행
	    $("#b_update").click(function(){
	        formCheckIt();//글수정 폼의 입력 여부 체크
	        if(wStatus){
	
	        	// TODO implements
	        	// 페이지 번호 변수화
	        	// 화면에서 입력받은 정보를 JSON 객체로 패키징
	        	// $.ajax 호출을 통해 게시글 변경 요청
	        	// 변경 성공 후 목록화면으로 이동
	        	// 변경 실패시 "비밀번호 틀림" 메시지 출력 후 비밀번호 초기화
	        	//[수정]버튼의 값으로 지정된 현재페이지 번호를 얻어내서 query에 저장
	        	var pagNum = $("#b_update").val();
	        	//글번호와 글 수정폼에 입력된 값을 얻어내서 query에 저장
	        	var query = {subject:$("#subject").val(),
	        				 content:$("#content").val(),
	        				 passwd:$("#passwd").val(),
	        				 num:$("#num").val()};
	        	//query값을 갖고 updatePro.jsp실행
	        	$.ajax({
	        		type: "POST",
	        		url: "<%=CTX%>/board/updatePro.jsp",
	        		data: query,
	        		success: function(data) {
	        			data = data.trim();
	        			if(data == "true"){ //글수정 처리가 성공한 경우
	        				alert("글이 수정되었습니다.");
	        				var query = "<%=CTX%>/board/list.jsp?pageNum="+pageNum;
	        				$("#main_board").load(query);
	        			}else{ //글수정 처리가 실패한 경우
	        				alert("비밀번호 틀림.");
	        				$("#passwd").val("");
	        				$("#passwd").focus("");
	        			}
	        		}
	        	});
	        }
	    });
	    //글수정폼의 [취소]버튼을 클릭하면 자동실행
	    //글목록보기 list.jsp페이지를 표시
	    $("#b_cancle").click(function(){
	        var pageNum = $("#b_cancle").val();
	        var query = "<%=CTX%>/board/list.jsp?pageNum="+pageNum;
	        $("#main_board").load(query);
	    });
	     
	});
	
	//글수정 폼의 입력값 유무 확인
	function formCheckIt(){
	    wStatus = true;
	    if(!$.trim($("#subject").val())){
	        alert("제목을 입력하세요.");
	        $("#subject").focus();
	        wStatus = false;
	        return false;
	    }
	    
	    if(!$.trim($("#content").val())){
	        alert("내용을 입력하세요.");
	        $("#content").focus();
	        wStatus = false;
	        return false;
	    }
	    
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
	  //수정할 글의 번호와 수정할 글이 위치한 페이지 번호를 얻어냄
	  int num = Integer.parseInt(request.getParameter("num"));
	  String pageNum = request.getParameter("pageNum");
	
	  //주어진 글번호에 해당하는 수정할 글을 가져옴 
	  BoardDBBean dbPro = BoardDBBean.getInstance();
	  BoardDataBean article = dbPro.updateGetArticle(num);
	%>
	<%--수정할 글의 원래 저장내용을 글 수정폼에 표시 --%>
</head>

<body>
<div class="location-tow mb-80">
	<div class="container">
	    <div class="row">
	        <div class="col-12">
	            <div class="location-title">
	                <h1>1:1 문의</h1>
	            </div>
	            <div class="location-content location-content-tow">
	                <ul>
	                    <li><a href="<%=CTX%>/index.do">home</a></li>
	                    <li class="active">게시글 수정</li>
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
            		<div id="editForm" class="box">
					   <ul>
					      <li><label for="subject">제목</label>
					          <input id="subject" name="subject" type="text" maxlength="50" value="<%= article.getSubject() %>">
					          <input type="hidden" id="num" value="<%= num %>">
					      </li>
					      <li><label for="content" id="contentLabel">내용</label>
					          <textarea id="content" rows="13" cols="50"><%= article.getContent() %></textarea>
					      </li>
					      <li><label for="passwd">비밀번호</label>
					          <input id="passwd" name="passwd" style="width:200px;" type="password" placeholder="6~16자 숫자/문자" maxlength="16">
					      </li>
					      <li class="label2">
					          <button id="b_update" value="<%= pageNum %>">수정</button>
					          <button id="b_cancle" value="<%= pageNum %>">취소</button>
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