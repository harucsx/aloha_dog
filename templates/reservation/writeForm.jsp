<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="alohadog.reservation.ReservationDBBean"
    import="alohadog.reservation.ReservationDataBean"
	import="java.util.*"
    import="alohadog.bean.AddPetDBBean"
    import="alohadog.bean.AddPetDataBean"
    import="java.text.SimpleDateFormat"
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
	
	<!-- reservation문의 script -->
	<script>
	$(document).ready(function(){
	    //[글쓰기]버튼을 클릭하면 제목글 쓰기(writeForm.jsp)로 이동 
	    $("#b_new").click(function(){
	        $("#main_reservation").load("<%=CTX%>/reservation/writeForm.jsp");
	    });
	});
	
	// [글수정]버튼을 클릭하면  main.jsp의 main_reservation 영역에 글수정폼 표시
	function edit(editBtn){
	    //수정할 글의 정보가 [글수정]버튼인 editBtn의 name속성에 지정
	    var rStr = editBtn.name;
	    var arr = rStr.split(",");
	    //글번호와 페이지번호를 갖고 updateForm.jsp 페이지 로드
	    var query = "<%=CTX%>/reservation/updateForm.jsp?num=" + arr[0];
	    query += "&pageNum=" + arr[1];
	    $("#main_reservation").load(query);
	}
	
	//[글삭제]버튼을 클릭하면 main.jsp의 main_reservation영역에 글삭제폼 표시
	function del(delBtn){
	    var rStr = delBtn.name;
	    var arr = rStr.split(",");
	    //글번호와 페이지번호를 갖고 deleteForm.jsp 페이지 로드
	    var query = "<%=CTX%>/reservation/deleteForm.jsp?num=" + arr[0];
	    query += "&pageNum=" + arr[1];
	    $("#main_reservation").load(query);
	}
	
	//[댓글쓰기]버튼을 클릭하면 main.jsp의 main_reservation영역에 글쓰기폼 표시
	function reply(replyBtn){
	    var rStr = replyBtn.name;
	    var arr = rStr.split(",");
	    //댓글쓰기에 필요한 정보를 갖고 writeForm.jsp 페이지 로드
	    var query = "<%=CTX%>/reservation/writeForm.jsp?num=" + arr[0] + "&ref=" + arr[1];
	    query += "&re_step=" + arr[2] + "&re_level=" + arr[3] + "&pageNum=" + arr[4];
	    $("#main_reservation").load(query);
	}
	
	//페이지 이동 버튼을 누르면 main.jsp의 main_reservation영역에 해당페이지의 글목록 표시
	function p(jumpBtn){
	    var rStr = jumpBtn.name;
	    var query = "<%=CTX%>/reservation/list.jsp?pageNum=" + rStr;
	    $("#main_reservation").load(query);
	}
	</script>
	<script>
	var wStatus = true;
	
	$(document).ready(function(){
	    
	    //글쓰기폼의 [등록]버튼을 클릭하면 자동실행
	    $("#b_regist").click(function(){
	        formCheckIt();//글쓰기 폼의 입력 여부 체크
	        if(wStatus){//입력란에 값을 모두 입력한 경우
	          //[등록]버튼의 값으로 지정된 현재페이지 번호를 얻어냄
	          var pageNum = $("#b_regist").val();
	          //글쓰기폼에 입력된 값을 얻어내서 query에 저장
	          var query = {
	        		  	   sitter_id:$("#sitter_id").val(),
	        		       sitter:$("#sitter").val(),
	        		       pet:$("#pet").val(),
	        		       precautions:$("#precautions").val(),
	        		       startdate:$("#startdate").val(),
	        		       enddate:$("#enddate").val(),
	        		       payment:$("#payment").val(),
	        		       homeaddress:$("#homeaddress").val(),
	        		       progress:$("#progress").val(),
	                       passwd:$("#passwd").val(),
	                       ref:$("#ref").val(),
	                       re_step:$("#re_step").val(),
	                       re_level:$("#re_level").val(),
	                       num:$("#num").val()};
	          
	          //query값을 갖고 writePro.jsp실행
	          $.ajax({
	             type: "POST",
	             url: "/reservation/writePro.jsp",
	             data: query,
	             success: function(data){
	            	 data = data.trim();
	                 if(data == "true") { //글추가 성공
	                     alert("예약이 등록되었습니다.");
	                     document.location = "/reservation/list.jsp?pageNum=" + pageNum;
	                     
	                 }
	             }
	          });
	        }
	    });
	    
	    //글쓰기폼의 [취소]버튼을 클릭하면 자동실행
	    //글목록보기 list.jsp페이지를 표시
	    $("#b_cancle").click(function(){
	        var pageNum = $("#b_cancle").val();
	        var query = "../reservation/list.jsp?pageNum=" + pageNum;
	        $("#main_reservation").load(query);
	    });
	});
	
	//글쓰기 폼의 입력값 유무 확인
	function formCheckIt(){
	    wStatus = true;
	    if(!$.trim($("#sitter").val())){
	        alert("시터을 입력하세요.");
	        $("#sitter").focus();
	        wStatus = false;
	        return false;
	    }
	    
	    if(!$.trim($("#pet").val())){
	        alert("반려견을 선택하세요.");
	        $("#pet").focus();
	        wStatus = false;
	        return false;
	    }
	    
	    if(!$.trim($("#precautions").val())){
	        alert("돌봄 시 주의사항을 입력하세요.");
	        $("#precautions").focus();
	        wStatus = false;
	        return false;
	    }
	    
	    if(!$.trim($("#startdate").val())){
	        alert("시작날을 입력하세요.");
	        $("#startdate").focus();
	        wStatus = false;
	        return false;
	    }
	    
	    if(!$.trim($("#enddate").val())){
	        alert("종료날을 입력하세요.");
	        $("#enddate").focus();
	        wStatus = false;
	        return false;
	    }
	    
	    if(!$.trim($("#payment").val())){
	        alert("가격을 입력하세요.");
	        $("#payment").focus();
	        wStatus = false;
	        return false;
	    }
	    
	    if(!$.trim($("#homeaddress").val())){
	        alert("주소을 입력하세요.");
	        $("#homeaddress").focus();
	        wStatus = false;
	        return false;
	    }
	    
	    if(!$.trim($("#progress").val())){
	        alert("진행상황 입력하세요.");
	        $("#progress").focus();
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
	
	function calcPrice(startday, endday) {
		startday = new Date(startday);
		endday = new Date(endday);
		
		var datediff = endday - startday;
		
		if (isNaN(datediff))
			return;
		
		if (datediff < 0) {
			alert('종료일이 시작일 이전일 수 없습니다.');
			return;
		}
		
		datediff = datediff / 86400 / 1000;
		$("#payment").attr('value', ++datediff * <%= request.getParameter("sitter_time_price")%>);
		
	}
	</script>
	<%
	  request.setCharacterEncoding("utf-8");
	
	  //제목글의 경우 갖는 값
	  int num = 0,ref = 1, reStep = 0, reLevel = 0;
	  int pageNum = 1;
	
	  if(request.getParameter("num") != null){ // 댓글
	    //제목글의 글번호, 그룹화번호, 그룹화내의 순서, 들여쓰기 정도가 list.jsp 에서 넘어옴
	    num = Integer.parseInt(request.getParameter("num"));
	    ref = Integer.parseInt(request.getParameter("ref"));
	    reStep = Integer.parseInt(request.getParameter("re_step"));
	    reLevel = Integer.parseInt(request.getParameter("re_level"));
	    pageNum = Integer.parseInt(request.getParameter("pageNum"));
	  }
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
                      	<li><a href="main/home.jsp">예약하기</a></li>
                      	<li class="active">예약 신청</li>
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
            		<input type="hidden" id="num" value="<%= num %>">
					<input type="hidden" id="ref" value="<%= ref %>">
					<input type="hidden" id="re_step" value="<%= reStep %>">
					<input type="hidden" id="re_level" value="<%= reLevel %>">
					<div id="writeForm" class="box">
					   <ul>
					   	  <li>
					      	<label for="sitter">시터</label>
					      	<input id="sitter_id" name="sitter_id" type="hidden" size="50" value="<%= request.getParameter("sitter_id")%>" readonly>
					        <input id="sitter" name="sitter" type="text" size="50" placeholder="시터" maxlength="50" value="<%= request.getParameter("sitter_name")%>" readonly>
					      </li>
					      <%
							request.setCharacterEncoding("utf-8");
							
							List<AddPetDataBean> petList = null;//글목록을 저장
							AddPetDBBean addPetDBBean = AddPetDBBean.getInstance();
							petList = addPetDBBean.getMemberPets((String) session.getAttribute("id"));
						  %>

					   	  <li>
					      	<label for="pet">반려견</label>
					         <select name="pet" id="pet"> 
					         <% for(AddPetDataBean pet : petList) { %>
                               <option value="<%= pet.getPet_name() %>" selected><%= pet.getPet_name() %></option>
                               <% } %>
                            </select>
					      </li>
					      
					      <li>
					      	<label for="precautions">돌봄 시 주의사항</label>
					        <input id="precautions" name="precautions" type="text" size="50" placeholder="돌봄 시 주의사항" maxlength="50">
					      </li>
					      
					     <li>
					      	<label for="startdate">돌봄시작일</label>
					        <input id="startdate" name="startdate" type="date" size="50" placeholder="돌봄시작일" maxlength="50"
					        	onChange="javascript:calcPrice($('#startdate').val(), $('#enddate').val());"
					        >
					      </li>
					      
					      <li>
					      	<label for="enddate">돌봄종료일</label>
					        <input id="enddate" name="enddate" type="date" size="50" placeholder="돌봄종료일" maxlength="50"
					        onChange="javascript:calcPrice($('#startdate').val(), $('#enddate').val());"
					        >
					      </li>
					      
					   	  <li>
					      	<label for="payment">가격</label>
					        <input id="payment" name="payment" type="text" size="50" placeholder="가격" maxlength="50" value="<%= request.getParameter("sitter_time_price")%>" readonly>
					      </li>
					      
					   	  <li>
					      	<label for="homeaddress">주소</label>
					        <input id="homeaddress" name="homeaddress" type="text" size="50" placeholder="주소" maxlength="50" value="<%= request.getParameter("sitter_address")%>" readonly>
					      </li>
					      
					      <li>
					      	<label for="progress">진행상황</label>
					        <input id="progress" name="progress" type="text" size="50" placeholder="진행상황" maxlength="50" value="예약신청" readonly>
					      </li>
					      
					      <li>
					      	<label for="passwd">비밀번호</label>
					        <input id="passwd" name="passwd" type="password" size="20" placeholder="6~16자 숫자/문자" maxlength="16">
					      </li>
					      
					      <li class="label2">
					      	<button id="b_regist" value="<%= pageNum %>">등록</button>
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
