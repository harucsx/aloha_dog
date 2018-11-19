<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="alohadog.reservation.ReservationDBBean"
    import="alohadog.reservation.ReservationDataBean"
    import="java.util.*"
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
	
	<!-- reservation script -->
	<script>
	$(document).ready(function(){
	    //[글쓰기]버튼을 클릭하면 제목글 쓰기(writeForm.jsp)로 이동 
	    $("#b_new").click(function(){
	        document.location = "../reservation/writeForm.jsp";
	    });
	});
	
	// [글수정]버튼을 클릭하면  main.jsp의 main_board 영역에 글수정폼 표시
	function edit(editBtn){
	    //수정할 글의 정보가 [글수정]버튼인 editBtn의 name속성에 지정
	    var rStr = editBtn.name;
	    var arr = rStr.split(",");
	    //글번호와 페이지번호를 갖고 updateForm.jsp 페이지 로드
	    var query = "../reservation/updateForm.jsp?num=" + arr[0];
	    query += "&pageNum=" + arr[1];
	    $("#main_reservation").load(query);
	}
	
	//[글삭제]버튼을 클릭하면 main.jsp의 main_board영역에 글삭제폼 표시
	function del(delBtn){
	    var rStr = delBtn.name;
	    var arr = rStr.split(",");
	    //글번호와 페이지번호를 갖고 deleteForm.jsp 페이지 로드
	    var query = "/reservation/deleteForm.jsp?num=" + arr[0];
	    query += "&pageNum=" + arr[1];
	    $("#main_reservation").load(query);
	}
	
	//[댓글쓰기]버튼을 클릭하면 main.jsp의 main_board영역에 글쓰기폼 표시
	function reply(replyBtn){
	    var rStr = replyBtn.name;
	    var arr = rStr.split(",");
	    //댓글쓰기에 필요한 정보를 갖고 writeForm.jsp 페이지 로드
	    var query = "../reservation/writeForm.jsp?num=" + arr[0] + "&ref=" + arr[1];
	    query += "&re_step=" + arr[2] + "&re_level=" + arr[3] + "&pageNum=" + arr[4];
	    $("#main_reservation").load(query);
	}
	
	//페이지 이동 버튼을 누르면 main.jsp의 main_reservation영역에 해당페이지의 글목록 표시
	function p(jumpBtn){
	    var rStr = jumpBtn.name;
	    var query = "../reservation/list.jsp?pageNum=" + rStr;
	    $("#main_reservation").load(query);
	}
	</script>
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
                      	<li class="active">예약 목록</li>
                  	</ul>
               	</div>
         	</div>
        </div>
	</div>
</div>

<!-- 예약 페이지 코딩은 여기에~!! -->
<%
  request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");

  int pageSize = 5; // 한 페이지에 표시할 글의 수 
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); //날짜데이터 표시형식지정

  String pageNum = request.getParameter("pageNum");//화면에 표시할 페이지번호
  if (pageNum == null) pageNum = "1"; //페이지번호가 없으면 1페이지의 내용이 화면에 표시

  int currentPage = Integer.parseInt(pageNum);//숫자로 파싱
    
  List<ReservationDataBean> articleList = null;//글목록을 저장
  ReservationDBBean dbPro = ReservationDBBean.getInstance();
  int count = dbPro.getMyArticleCount(id);//전체글수 얻어냄

  if(count == (currentPage - 1) * pageSize) currentPage -=1;
  
  int startRow = (currentPage - 1) * pageSize + 1;//현재 페이지에서의 시작글번호

  //테이블에 저장된 글이 있으면, 테이블에서 글목록을 가져옴
  if(count > 0) articleList = dbPro.getMyArticles(id, startRow, pageSize);
  else articleList = new ArrayList<ReservationDataBean>();

  //테이블에 저장된 글이 없으면, 전체글 수 : 0
  if(articleList.isEmpty()) count = 0;
%>
<div class="blog-area white-bg pt-0 pb-0 mb-70">
	<div class="container">
    	<div class="row">
        	<div class="col-lg-9 ml-auto mr-auto">
            	<div class="blog_area">
            		<div id="list_head" class="box2">
					   <h3 class="inline">예약목록<font style="color:lightgrey;">(전체 에약 건수 : <%= count %>)</font></h3>
					   <!-- <button id="b_new">예약 신청 하기</button> -->
					</div>
					<%
					  if (count == 0) { // 예약이 없는 경우
					%>
					<div id="list_article" class="box2">
					  <ul>
					    <li><p>이직 신청된 예약이 없습니다.
					  </ul>
					</div>
					
					<%
					  } else { // 예약이 있는 경우
					%>
					<div id="list_article" class="box2">
						<ul class="article">
							<div class="table-content table-responsive">
								<table class="table">
								    <thead>
								        <tr>
								            <th class="listTableTitle">예약번호</th>
								            <th class="listTableTitle">시작일자</th>
								            <th class="listTableTitle">신청자</th>
								            <th class="listTableTitle">가격</th>
								            <th class="listTableTitle">신청현황</th>
								            <th class="listTableTitle">수정</th>
								            <th class="listTableTitle">삭제</th>
								        </tr>
								    </thead>
								    <%
								    // 글목록을 반복처리
								    for (int i = 0; i < articleList.size(); i++) {
								    	ReservationDataBean article = articleList.get(i);
								    	String writer = article.getWriter();
							    	%>
							    	<tbody>
							    		<tr>
							    			<td class="listTableTitle_num">
							    			<a href="/reservation/reservationDetail.jsp?num=<%= article.getNum() %>">
							    				<li class="layout_f">
							    				
							    				<%= String.valueOf(article.getRegDate().getYear() + 1900) + 
						    						String.valueOf(article.getRegDate().getMonth() + 1) + 
				    								String.valueOf(article.getRegDate().getDate()) + article.getNum() %>
							    				</li>
							    			</a>
							    			</td>
									    	<li class="layout_f">
											<%
											int wid = 0; 
											if(article.getReLevel() > 0){
												wid = 5 * (article.getReLevel());
												%>
												<img src="../images/level.gif" width="<%= wid %>">
												<img src="../images/re.gif">
												<%
												} else {
												%>
												<img src="../images/level.gif" width="<%= wid %>" height="16">
												<%
												}
													int num = article.getNum();
													int ref = article.getRef();
													int re_step = article.getReStep();
													int re_level = article.getReLevel();
											%>
											<td class="listTableTitle_startdate"><p class="date"><%= article.getStartdate() %><br></td>
											<td class="listTableTitle_writer"><%= article.getWriter() %></td>
											<td class="listTableTitle_payment"><%= article.getPayment() + "원"%></td>
											<td class="listTableTitle_progress"><%= article.getProgress()%></td>
											<%
											
											if(id != null && id.equals(writer)) {
											%>
											<td class="listTableTitle_Button"><button class="listTableTitle_button" id="edit" name="<%= num + "," + pageNum %>" onclick="edit(this)">수정</button></td>
											<td class="listTableTitle_Button"><button class="listTableTitle_button" id="delete" name="<%= num + "," + pageNum %>" onclick="del(this)">삭제</button></td>
											<%
											} else {
											%>
											<td class="listTableTitle_Button">X</td>
											<td class="listTableTitle_Button">X</td>
											<%
											}
											%>
											<%
											}
											%>
											</li>
										</tr>
									</tbody>
								</table>
					        </div>	    
						</ul>
					<%
					   }
					%>
					</div>
					<%-- 페이지 이동 처리 --%>
					<div id="jump" class="box3">
					<%
					if (count > 0) {
					   int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
					   int startPage = 1;
							
					   if(currentPage % pageSize != 0)
					      startPage = (int)(currentPage / pageSize) * pageSize + 1;
					   else
					      startPage = ((int)(currentPage / pageSize) - 1) * pageSize + 1;
						
					   int pageBlock = 10; //페이지들의 블럭단위 지정
					   int endPage = startPage + pageBlock - 1;
					   
					   if (endPage > pageCount) endPage = pageCount;
					        
					   if (startPage > pageBlock) {
					%>
					      <button id="juP" name="<%= startPage - pageBlock %>" onclick="p(this)" class="w2">이전</button>&nbsp;
					<%
					   }
					   for (int i = startPage; i <= endPage; i++) {
					     if(currentPage == i) {
					%>
					      <!-- <button id="ju" name="<%= i %>" onclick="p(this)" class="w1"><%= i %></button> -->
					      <a class="w1"><%= i %></a>
					      
					<%
					     } else {
					%> 
					      <!-- <button id="ju" name="<%= i %>" onclick="p(this)" class="w"><%= i %></button> -->
					      <a class="w" href="/reservation/list.jsp?pageNum=<%= i %>"><%= i %></a>
					<%
					     }
					%>
					      &nbsp; 
					<% }
					   if (endPage < pageCount) {
					%>
					      &nbsp;
					      <button id="juN" name="<%= startPage + pageBlock %>" onclick="p(this)" class="w2">다음</button>
					<%
					   }
					}//108라인 if꺼
					%>
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