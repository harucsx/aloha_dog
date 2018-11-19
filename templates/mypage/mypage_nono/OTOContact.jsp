<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/main/base.jsp" %>

<!DOCTYPE html>
<html>
<head>
   <title>ALOHA DOG!</title>
   <meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <meta name="description" content="">
   <meta name="robots" content="noindex, follow" />
   <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <!-- css -->
   <style type="text/css">
      @font-face {
         font-family: 'nanum';
         src: url('../../resources/font/NanumGothic/NanumGothic.eot'),
              url('../../resources/font/NanumGothic/나눔고딕.ttf'),
              url('../../resources/font/NanumGothic/NanumGothic.otf'),
              url('../../resources/font/NanumGothic/NanumGothic.woff');
      }
      @font-face {
         font-family: 'squareR';
         src: url('../../resources/font/SquareR/NanumSquareR.eot'),
              url('../../resources/font/SquareR/NanumSquareR.ttf'),
              url('../../resources/font/SquareR/NanumSquareR.otf'),
              url('../../resources/font/SquareR/NanumSquareR.woff');
      }
      @font-face {
         font-family: 'squareB';
         src: url('../../resources/font/SquareR/NanumSquareB.eot'),
              url('../../resources/font/SquareR/NanumSquareB.ttf'),
              url('../../resources/font/SquareR/NanumSquareB.otf'),
              url('../../resources/font/SquareR/NanumSquareB.woff');
      }
   </style>
   <link rel="stylesheet" type="text/css" href="../../style.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/home.css">

   <!-- script -->
   <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
   <script src="../../resources/js/vendor/modernizr-2.8.3.min.js"></script>
   
   <!-----Jquery----->
   <script src="../../resources/js/js/vendor/jquery-1.12.4.min.js"></script>
   <script src="../../resources/js/js/popper.min.js"></script>
   <script src="../../resources/js/js/bootstrap.min.js"></script>
   <script src="../../resources/js/js/imagesloaded.pkgd.min.js"></script>
   <script src="../../resources/js/js/isotope.pkgd.min.js"></script>
   <script src="../../resources/js/js/waypoints.min.js"></script>
   <script src="../../resources/js/js/jquery.counterup.min.js"></script>
   <script src="../../resources/js/js/owl.carousel.min.js"></script>
   <script src="../../resources/js/js/slick.min.js"></script>
   <script src="../../resources/js/js/jquery.meanmenu.min.js"></script>
   <script src="../../resources/js/js/easyzoom.min.js"></script>
   <script src="../../resources/js/js/jquery.nice-select.min.js"></script>
   <script src="../../resources/js/js/jquery.scrollUp.min.js"></script>
   <script src="../../resources/js/js/wow.min.js"></script>
   <script src="../../resources/js/js/venobox.min.js"></script>
   <script src="../../resources/js/js/jquery-ui.js"></script>
   <script src="../../resources/js/js/jquery.countdown.min.js"></script>
   <script src="../../resources/js/js/plugins.js"></script>
   <script src="../../resources/js/js/main.js"></script>
   <script src="../../resources/js/alohadog.js"></script>
</head>

<body>
		<div class="breadcrumb-tow mb-120">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb-title">
                            <h1>1:1 문의</h1>
                        </div>
                        <div class="breadcrumb-content breadcrumb-content-tow">
                            <ul>
                                <li><a href="../main/home.jsp">작성하기</a></li>
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
                                            <th class="cart-product-name">No.</th>
                                            <th class="plantmore-product-price">제목</th>
                                            <th class="plantmore-product-subtotal">작성일자</th>
                                            <th class="plantmore-product-remove">수정</th>
                                            <th class="plantmore-product-remove">삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td class="plantmore-product-name"><a href="#">4</a></td>
                                            <td class="plantmore-product-price"><span class="amount">사료는 안 파시나요???!</span></td>
                                            <td class="product-subtotal"><span class="amount">2018. 07. 26</span></td>
                                            <td class="plantmore-product-remove"><a href="#"><i class="fa fa-edit"></i></a></td>
                                            <td class="plantmore-product-remove"><a href="#"><i class="fa fa-times"></i></a></td>
                                        </tr>

                                        <tr>
                                            <td class="plantmore-product-name"><a href="#">3</a></td>
                                            <td class="plantmore-product-price"><span class="amount">너무 더워서</span></td>
                                            <td class="product-subtotal"><span class="amount">2018. 07. 23</span></td>
                                            <td class="plantmore-product-remove"><a href="#"><i class="fa fa-edit"></i></a></td>
                                            <td class="plantmore-product-remove"><a href="#"><i class="fa fa-times"></i></a></td>
                                        </tr>


                                        <tr>
                                            <td class="plantmore-product-name"><a href="#">2</a></td>
                                            <td class="plantmore-product-price"><span class="amount">강아지가 겁이 많은데요</span></td>
                                             <!--이제 '제품명' 이런거에다가 {{ item.title }}이런거 넣으면 데이터 뜸 -->
                                            <td class="product-subtotal"><span class="amount">2018. 07. 06</span></td>
                                            <td class="plantmore-product-remove"><a href="#"><i class="fa fa-edit"></i></a></td>
                                            <td class="plantmore-product-remove"><a href="#"><i class="fa fa-times"></i></a></td>
                                        </tr>
                                        <tr>
                                            <td class="plantmore-product-name"><a href="#">1</a></td>
                                            <td class="plantmore-product-price"><span class="amount">베스트 시터님 뽑는 기준이 뭔가요?</span></td>
                                            <td class="product-subtotal"><span class="amount">2018. 06. 29</span></td>
                                            <td class="plantmore-product-remove"><a href="#"><i class="fa fa-edit"></i></a></td>
                                            <td class="plantmore-product-remove"><a href="#"><i class="fa fa-times"></i></a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                    </div>
</div>
</div>
</div>
</body>

<!-- 서브페이지 코딩은 여기에~!! -->

<footer>
    <div class="footer-container">
        <div class="footer-bottom-area pt-50 pb-50">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="footer-payments-image">
                            <div class="footer-logo">
                                <a href="../main/home.jsp"><img src="../../resources/logo/logo1.png" alt="logo"></a>
                            </div>
                        </div>
                        <div class="footer-menu text-center">
                            <nav>
                                <ul>
                                   <li><b>사업자등록번호:</b> 000-00-00000</li>
                                   <span><b>통신판매업신고번호:</b> 제 2018-서울성동-00000 호</span>
                                   <br/>
                                    <li><b>주소:</b> 서울특별시 성동구 살곶이길 200(사근동 110)</li> 
                                    <li><b>전화번호:</b> 010-3083-8683, </li> 
                                    <li><b>이메일:</b> ohmyfood_@naver.com,</li>
                                </ul>
                            </nav>
                        </div>
                        <div class="footer-copyright">
                            <p>Copyright © <a href="#">AlohaDog</a> All Rights Reserved</p>
                            <p><span>대표: 김아연, 김샛별, 박기나, 김지윤</span></p>
                     <p><span><a href="#">이용약관</a> | <a href="#">개인정보취급방법</a> | <a href="#">안전보상제도</a></span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

</body>
</html>