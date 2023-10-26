<%@page import="com.example.dto.UsersDTO"%>
<%@page import="com.example.dto.ReviewsDTO"%>
<%@page import="com.example.dto.GoodsDTO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">


	.goodsicon{
		display: flex;
		justify-content: flex-end;
	}
	.fixed-sidebar-goods {
	    position: fixed;
	    top: 40%;
	    right: 20px;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    z-index: 1000;
	}
	.container {
		margin-left: 10%;
		margin-right: 10%;
		font-family: 'Arial', sans-serif;
	}
	
	.detail {
		padding-left: 10%;
		padding-right: 10%;
	}
	
	.detail img {
		width: 900px;
		height: 500px;
		margin-bottom: 5px;
		margin: auto;
		display: block;
	}
	
	#Rating fieldset {
		display: inline-block;
		direction: rtl;
		border: 0;
	}
	
	#Rating fieldset legend {
		text-align: right;
	}
	
	#Rating input[type=radio] {
		display: none;
	}
	
	#Rating label {
		font-size: 2em;
		color: transparent;
		text-shadow: 0 0 0 #f0f0f0;
	}
	
	#Rating label:hover {
		text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	
	#Rating label:hover ~ label {
		text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	
	#Rating input[type=radio]:checked ~ label {
		text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}

	.img{
	    width: 300px;
	    height: 200px;
	    border-radius: 10px;
	    cursor: pointer;
	    transition: 0.3s;
	  }
  /* 이미지 클릭 시, 밝기 조절 */
  .img:hover {opacity: 0.8;}

  .modal {
    display: none; /* 모달창 숨겨 놓기 */
    position: fixed; 
    z-index: 1; /* 모달창을 제일 앞에 두기 */
    padding-top: 100px;
    left: 0; top: 0;
    width: 100%; height: 100%;
    overflow: auto; /* 스크롤 허용 auto */
    cursor: pointer; /* 마우스 손가락모양 */
    background-color: rgba(0, 0, 0, 0.8);
  }
  /* 모달창 이미지 */
  .modal_content {
    margin: auto;
    display: block;
    width: 50%; height: auto;
    max-width: 1000px;
    border-radius: 10px;
    animation-name: zoom;
    animation-duration: 0.8s;
  }
  /* 모달창 애니메이션 추가 */
  @keyframes zoom {
    from {transform: scale(0)}
    to {transform: scale(1)}
  }
  /* 닫기 버튼 꾸미기 */
  .close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
  }
  .close:hover, .close:focus{
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
  }
  
  .goodsRetrieve-container{
  	border: 1px solid #ededed;
  	height:900px;
  	display: flex;
/*   	justify-content: */
  }
  
  .goodsRetrieve-subcontainer1{
  	width:50%;
  	border-right: 1px solid #ededed;
    
  }
  
  .goodsRetrieve-subcontainer2{
  	width:50%;
  	padding: 30px;
  }
  
  .goodsRetrieve-name{
  	font-size: 25px;
  	font-weight: 550;
  	margin-bottom: 15px;
  	color: hsl(0, 0%, 20%);
  }
    
  .goodsRetrieve-price{
 	 display: flex; 
 	 justify-content: space-between;
 	 margin-bottom: 15px;
  }
  
  .goodsRetrieve-price2-1{
  	justify-content: flex-start;
  	font-size: 28px;
  	font-weight: 700;
  	font-style: oblique;
  	color: red;
  }
  
  .goodsRetrieve-price2-2{
  	font-size: 28px;
  	display: inline-block;	/* 우측정렬 하기 전 display 타입 바꾸기*/
  	float: right;	/* 우측정렬 */
  	font-weight: 700;
  	color: hsl(0, 0%, 13%);
  }

  
  .goodsRetrieve-memberpoint-container{
 	border: 0.2px solid #a0a0a0	;
  	height: 300px;
  }
  
  .goodsRetrieve-memberpoint1{
  	font-size: 18px;
  	font-weight: bolder;
  	color: hsl(0, 0%, 10%);
  	padding: 20px;
  	border-bottom: 0.1px solid #d2d2d2;
  }
  
   .goodsRetrieve-memberpoint2{
    padding: 20px 20px 5px 20px;
    font-weight: bolder;
   }
   
   .goodsRetrieve-memberpoint3{
    padding: 0 20px 0 20px;
    font-size: 14px;
    color: hsl(0, 0%, 23%);
   }
   
   .goodsRetrieve-memberpoint-subcontainer{
    margin: 10px 20px 0 20px;
    padding: 20px;
    background-color: #f7f8fa;
    border: 0.2px solid #bebebe;
    }
   
   .goodsRetrieve-memberpoint4{
   	font-weight: bolder;
   }
   .tip-text{
   	color:red;
   	font-size: 17px;
   	font-style: oblique;
   }
   
   .goodsRetrieve-subcontainer3{
   	margin: 10px 0 10px 0;
   	padding: 10px 0 10px 0;
   	border-bottom: 0.1px solid #d2d2d2;
   }
   
   .goodsRetrieve-cardtext{
   	margin-bottom: 4px;
   }
   
   .goodsRetrieve-subcontainer4{
   	border-bottom: 0.1px solid #d2d2d2;
   	padding-bottom: 10px;
   }
   
   .goodsRetrieve-delivery{
   	color: hsl(0, 0%, 50%);
   }
   
   .goodsRetrieve-selectoption-container{
   	margin-bottom: 20px;
   }
   
   .goodsRetrieve-selectoption{
   	margin: 10px 0 10px 0;
   	padding: 5px 10px 5px 10px;
   	width: 100%;
   	height: 50px;
   }
   
   .goodsRetrieve-quantity-container{
   	margin-bottom: 15px;
   	padding-bottom: 15px;
   	border-bottom: 0.1px solid #d2d2d2;
   }
   
   .goodsRetrieve-quantity{
   	border: 0;
   	width: 30px;
   	text-align: center;
   	font-weight: bolder;
   }
   
   .goodsRetrieve-order{
   	align-content: center;
   }
   
   .catecontainer{
    height:60;
   	padding: 15px 0 15px 0;
    position: sticky;
    top: 0;
    background-color: #ffffff; /* 고정할 위치에서의 배경 색상 */
    z-index: 100; /* 다른 요소 위에 보이도록 함 */
   }
   
   .cate-move{
    margin: 13%;
    text-decoration: none;
    color: #000000;
    font-size: 18px;
    font-weight: bolder;
   }
  
  	.goodsRetrieve-table{
  		width: 85%;
  		margin-left:auto; 
    	margin-right:auto;
	    border-collapse : collapse;
		border : 1px solid #ededed;
		color: #6E6E6E;
		margin-bottom: 50px;
		margin-top: 50px;
  	}
  	.goodsRetrieve-table-title{
  		background-color: #fafafa;
  		padding: 10px 15px;
  		border: solid 1px #ededed;
  		text-align: left;
  	}
  	.goodsRetrieve-table-contents{
  		padding: 10px 20px;
  		border: solid 1px #ededed;
  		text-align: left;
  	}
  	  	
  	.goodsRetrieve-detail-title{
  		font-size: 18px;
  		padding:10px;
  	}
  	
  	.review-text1{
	    overflow: hidden;
	    margin-bottom: 15px;
	    line-height: 20px;
	    color: #888;
	    display: table;
  	}
    .attach-button {
        padding: 5px 10px;
        background-color: #f8bd24;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .submit-button {
        padding: 5px 10px;
        background-color: #35424a;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    
    .review-title {
    	font-size: 23px;
    	font-weight: bolder;
    }
    .rating-image-container{
    	margin-left: 20px;
    }
    .review-subcontainer2{
    	width: 100%;
    	display: flex;
    	
    }
    #review-content{
      width: 100%; 
      height: 80px; 
      resize: none;
      border-radius: 10px;
      padding: 10 15px;
      margin-right: 10px;
    }
    
    .review-subcontainer3{
    	width: 80%;
    	margin-left: 20px;
    }
    .review-subcontainer4{
    	width: 20%;
    	margin-left: 30px;
    }
    .review-subcontainer5{
    	margin-bottom: 10px;
    }
    .reviewcarousel{
    	margin: 30px 25%;
    	
    }
    .review-button{
    	display: flex;
    	margin-top: 10px;
    	margin-bottom: 5px;
    }
    .review-update-container{
    	display: flex;
    	margin-top: 10px;
    }
    .review-useralias{
    	font-weight: bolder;
    }
    .goodsretrieve-review-content{
    	display: flex;
    	margin-bottom: 10px;
    }
    .goodsretrieve-review-content2{
    	margin-right: 10px;
    }
    
  	
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	document.addEventListener('DOMContentLoaded', function () {
		
		<% 
		String msg = (String)request.getAttribute("msg");
	 	if(msg != null){
	 		if(msg.equals("리뷰를 등록했습니다")){ %> 
	 			Swal.fire('성공', '<%=msg%>', 'success');
	 	<%  }else if(msg.equals("리뷰가 수정되었습니다")){ %> 
	 			Swal.fire('성공', '<%=msg%>', 'success');
	 	<%  }else if(msg.equals("리뷰가 삭제되었습니다")){ %>
	 			Swal.fire('성공', '<%=msg%>', 'success');
		<%	}else{ %>
				Swal.fire('경고', '<%=msg%>', 'warning');
		<%	}
	 	}
			request.removeAttribute("msg");
		%> 
		
		 
	    var carousel = document.getElementById('carouselExampleControls');
	    var carouselInstance = new bootstrap.Carousel(carousel);
		
	    document.getElementById('up').addEventListener('click', function () {
	        var gAmount = document.getElementById('gAmount');
	        gAmount.value = parseInt(gAmount.value) + 1;
	    });

	    document.getElementById('down').addEventListener('click', function () {
	        var gAmount = document.getElementById('gAmount');
	        if (parseInt(gAmount.value) > 1) {
	            gAmount.value = parseInt(gAmount.value) - 1;
	        }
	    });

	    var cateLinks = document.querySelectorAll(".catecontainer a");
	    cateLinks.forEach(function (link) {
	        link.addEventListener('click', function (event) {
	            event.preventDefault();
	            var targetSection = link.getAttribute("href");
	            var targetElement = document.querySelector(targetSection);
	            if (targetElement) {
	                var targetOffset = targetElement.offsetTop;
	                window.scrollTo({
	                    top: targetOffset,
	                    behavior: "smooth"
	                });
	            }
	        });
	    });
// 		$("#review-button").click(function(){
// 			console.log($("#review-content").val());
// 		});
	});
	
	function reqCheck(str){
		if(str == 'order'){
			Swal.fire({
				   title: '정말 구매 하시겠습니까?',
				   text: '구매 페이지로 이동합니다.',
				   icon: 'question',
				   
				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				   cancelButtonText: '아니오', // cancel 버튼 텍스트 지정
				   confirmButtonText: '예', // confirm 버튼 텍스트 지정
				   
				   reverseButtons: true, // 버튼 순서 거꾸로
				   
				}).then(function (result) {
				   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					  if($("#pSize").val() == '사이즈' || $("#Color").val() == '색상'){
						  event.preventDefault();
					      Swal.fire('경고', '상품 옵션을 선택하세요', 'warning');
					  }else{
							$("#myForm").attr("action","orderConfirm");
							$("#myForm").submit();
						}
					}
				});
		}		
		if(str == 'cart'){
			Swal.fire({
				   title: '장바구니에 넣으시겠습니까?',
				   text: '',
				   icon: 'question',
				   
				   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				   cancelButtonText: '아니오', // cancel 버튼 텍스트 지정
				   confirmButtonText: '예', // confirm 버튼 텍스트 지정
				   
				   reverseButtons: true, // 버튼 순서 거꾸로
				   
				}).then(function (result) {
				   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					  if($("#pSize").val() == '사이즈' || $("#Color").val() == '색상'){
						  event.preventDefault();
					      Swal.fire('경고', '상품 옵션을 선택하세요', 'warning');
					  }else{
						  Swal.fire({
							   title: '장바구니에 담겼습니다',
							   text: '',
							   icon: 'success',
							   
							   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
							   confirmButtonColor: '#006400', // confrim 버튼 색깔 지정
							   cancelButtonColor: '#3085d6', // cancel 버튼 색깔 지정
							   cancelButtonText: '쇼핑 계속하기', // cancel 버튼 텍스트 지정
							   confirmButtonText: '장바구니 이동', // confirm 버튼 텍스트 지정
							   
							   reverseButtons: true, // 버튼 순서 거꾸로
							   
							}).then(function (result) {
							   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		 							$("#myForm").attr("action","addCartList");
		 							$("#myForm").submit();
								}
							});
						}
					}
				});
		}		
	}
	
	function reviewUpdate(str, ReviewID){
		console.log(str+'\t'+ReviewID);
		if(str == 'update'){
			if(confirm("해당 리뷰를 수정하시겠습니까?"))
				$("#reviewForm"+ReviewID).attr("action","");
			else{
				event.preventDefault();

			}
		}		
		if(str == 'del'){
			if(confirm("해당 리뷰를 삭제하시겠습니까?"))
				$("#reviewForm"+ReviewID).attr("action","delReview");
			else{
				event.preventDefault();
			}
		}		
	}
	
	

</script>
<body>
	<%
 	GoodsDTO dto= (GoodsDTO)request.getAttribute("list");
	String gName = dto.getPRODUCTNAME();
	int gPrice = dto. getPrice();
	String gImage = dto.getImage();
	int gProductID = dto.getPRODUCTID();
	String gCategory = dto.getCategory();
	String gContent = dto.getContent();		
	int gAmount = dto.getSTOCKQUANTITY();
%>
	<jsp:include page="../common/top.jsp" flush="true" /><br>
	<jsp:include page="../common/side.jsp" flush="true" /><br>
	<div></div>
	<div class="container">
	<div class="fixed-sidebar-goods goodsicon">
		<a href="dogshop_main"><img src="${pageContext.request.contextPath}/resources/스토어상품아이콘.png" width=200 height=200></a>
	</div>
	<hr>
	<form id="myForm" method="post">

			<input type="hidden" name="ProductID" value="<%=gProductID%>">
			<input type="hidden" name="Image" value="<%=gImage%>"> <input
			type="hidden" name="ProductName" value="<%=gName%>"> <input
			type="hidden" name="Price" value="<%=gPrice%>">
		<div class="goodsRetrieve-container">
			<div class="goodsRetrieve-subcontainer1">
			<img src="resources/storeimages/<%=gImage%>.jpg" width=100% height=440px>
			</div>
			<div class="goodsRetrieve-subcontainer2">
				<div class="goodsRetrieve-name"><%=gName%></div>
				<div class="goodsRetrieve-price" >
					<div class="goodsRetrieve-price2-1">HOT</div>
					<div class="goodsRetrieve-price2-2"><%=gPrice%><span style="font-size: 22px;">원</span></div>
				</div>
			<div class="goodsRetrieve-memberpoint-container">
				<div class="goodsRetrieve-memberpoint1">도기도기 고객을 위한 혜택</div>
				<div class="goodsRetrieve-memberpoint2">최대 적립 포인트<span style="display: inline-block; float:right;"><%= Math.round(gPrice * 0.01)+1500 %>원</span> </div>
				<div class="goodsRetrieve-memberpoint3">└ 기본 적립 <span style="display: inline-block; float:right;"><%= Math.round(gPrice * 0.01) %>원</span></div>
				<div class="goodsRetrieve-memberpoint-subcontainer">
					<div class="goodsRetrieve-memberpoint4"><span class="tip-text">TIP.</span> 포인트 더 받는 방법  <span style="display: inline-block; float:right;">+ 최대 <%= Math.round(gPrice * 0.01)+1500 %>원</span></div>
					<div class="goodsRetrieve-memberpoint5"><img src="${pageContext.request.contextPath}/resources/로고아이콘.png" width=20 height=15>구매 후 해당 상품의 게시물 작성 >  <span style="display: inline-block; float:right;">1000원</span></div>
					<div class="goodsRetrieve-memberpoint6"><img src="${pageContext.request.contextPath}/resources/로고아이콘.png" width=20 height=15>구매 후 해당 상품의 리뷰 작성 >  <span style="display: inline-block; float:right;">500원</span></div>
				</div>
			</div>
				<div class="goodsRetrieve-subcontainer3">
					<div class="goodsRetrieve-cardtext"> 무이자 할부 | 카드 자세히 보기 </div>
					<div class="goodsRetrieve-cardtext"> 이벤트 | 소식알림 1,000원 쿠폰</div>
				</div>
				<div  class="goodsRetrieve-subcontainer4">
					<div>택배 배송 | 3500원 • CJ대한통운 </div>
					<div class="goodsRetrieve-delivery ">제주 추가 3000원, 제주 외 도서지역 추가 5000원</div>
				</div>
				<div class="goodsRetrieve-selectoption-container">
					<select class="goodsRetrieve-selectoption form-select" name="Psize" id="pSize">
								<option selected value="사이즈">사이즈</option>
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
								<option value="XL">XL</option>
					</select>
					<select class="goodsRetrieve-selectoption form-select" name="Color" id="Color">
								<option selected value="색상">색상</option>
								<option value="navy">navy</option>
								<option value="black">black</option>
								<option value="ivory">ivory</option>
								<option value="white">white</option>
								<option value="gray">gray</option>
					</select>
				</div>
					<div class="goodsRetrieve-quantity-container">
						<div class="btn-group" role="group" aria-label="Basic example">
						  <button type="button" class="btn btn-secondary" id="down">-</button>
						  <input type="text" class="goodsRetrieve-quantity" name="Amount" value="1" id="gAmount" readonly="readonly">
						  <button type="button" class="btn btn-secondary" id="up">+</button>
						</div>
					</div>
					<div class="goodsRetrieve-order">
						<button type="button" class="btn btn-success" onclick="reqCheck('order')">구매하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-success" onclick="reqCheck('cart')">장바구니</button>
					</div>
					</div>
				</div>
		</form>
		
		
		
		<hr>
		
		<div class="catecontainer">
			<a class="cate-move" href="#product-info">상품정보</a> 
			<a class="cate-move" href="#detail-info">상세안내</a>
			<a class="cate-move" href="#product-review">상품리뷰</a>
		</div>

		<!-- 상품상세 정보 -->
		<div id="product-info"></div>
		
		<table class="goodsRetrieve-table">
			<tr>
				<th scope="row" class="goodsRetrieve-table-title">상품번호</th>
				<td colspan="1" class="goodsRetrieve-table-contents"><b><%= gProductID %></b></td>
				<th scope="row" class="goodsRetrieve-table-title">상품상태</th>
				<td colspan="1" class="goodsRetrieve-table-contents">신상품</td>
			</tr>
			<tr>
				<th scope="row" class="goodsRetrieve-table-title">제조사</th>
				<td colspan="1" class="goodsRetrieve-table-contents">도기도기</td>
				<th scope="row" class="goodsRetrieve-table-title">브랜드</th>
				<td colspan="1" class="goodsRetrieve-table-contents">도기도기</td>
			</tr>
			<tr>
				<th scope="row" class="goodsRetrieve-table-title">모델명</th>
				<td colspan="1" class="goodsRetrieve-table-contents"><%= gName %></td>
				<th scope="row" class="goodsRetrieve-table-title">이벤트</th>
				<td colspan="1" class="goodsRetrieve-table-contents">소식알림 1,000원 쿠폰</td>
			</tr>
		<tr>
			<th scope="row" class="goodsRetrieve-table-title">상품설명</th>
			<td colspan="3" class="goodsRetrieve-table-contents"><%= gContent %></td>
		</tr>
		</table>
		
		
		<div class="detail">
			<img src="resources/storeimages/<%=gImage%>.jpg" alt="상세페이지1">
			<br>
			<img src="resources/storeimages/<%=gImage%>.jpg" alt="상세페이지2">
			<br>
			<img src="resources/storeimages/<%=gImage%>.jpg" alt="상세페이지3">
		</div>
			<hr>
			<div class="goodsRetrieve-detail-title"><b>거래조건에 관한 정보</b></div>
		<div class="detail" id="detail-info">
			<!-- <script type="text/javascript"> -->
			<p>배송 기간 안내</p>
			<p>- 평균배송기간 : 결제완료 후 3일 이내 발송, 발송 후 3일이내 수령(영업일 기준)</p>
			<p>*도서/산간 지역의 경우 1~2일정도 더 소요될 수 있습니다.&nbsp;</p>
			<p>
				<br>
			</p>
			<p>교환 및 반품안내</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				단순 변심으로 인한 교환&middot;환불은 상품 수령 7일 이내에 신청, 왕복 택배비 6,000원을 동봉하여 주시길
				바랍니다.&nbsp;</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>주문
				금액이 100,000원 미만으로 배송비를 지불해주셨다면 동봉금 없이 편도 택배비만 부담합니다.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>주문
				금액이 100,000원 이상으로 무료 배송인 경우에는 왕복 택배비 6,000원을 부담해주셔야 합니다.</p>
			<div
				style='margin: 0px; padding: 0px; outline: none; color: rgb(0, 0, 0); font-family: "Nanum Gothic", "Noto Sans KR", "Malgun Gothic", "맑은 고딕", AppleGothic, Dotum, 돋움, sans-serif !important;'>
				<br style="margin: 0px; padding: 0px;">
			</div>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				받으신 상품의 교환&middot;반품은 7일 이내 &nbsp;소비자 상담실(00-0000-0000)로 신청 바랍니다.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				무통보 교환&middot;반품 시, 교환&middot;반품 접수가 처리되지 않습니다.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				개봉스티커가 훼손된 경우 교환&middot;환불이 불가합니다.&nbsp;</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				상품 하자, 오배송의 경우 수령일로부터 3개월 이내, 그 사실을 알 수 있었던 날로부터 30일 이내까지 교환∙반품이
				가능합니다. (교환/반품비 당사부담)</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				반품 택배 발송은 구매자님께서 발송해주셔야 합니다.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>&nbsp;&nbsp;</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>교환/반품/환불
				불가할 경우</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>1.
				구매자의 귀책으로 제품이 멸실되거나 훼손된 경우.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>2.
				구매자의 사용 및 소비로 인해 제품의 가치가 떨어진 경우</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>3.
				시간이 지나 다시 판매하기 곤란할 정도로 제품의 가치가 떨어진 경우</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>4.
				반품/교환 가능 기간을 초과한 경우</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>5.
				회수된 제품이 누락됐거나 입고가 확인되지 않은 경우</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>&nbsp;</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>취소,교환,환불등은
				소비자기본법에 따른 소비자분쟁해결기준(공정거래위원회 고시)에 의거하여 처리됨을 알려드립니다.</p>
			<p>
				<br>
			</p>
			<p>환불안내</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>결제별
				환불안내</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>&nbsp;-
				무통장 결제</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>반품
				보내주실 때 계좌번호, 은행명, 예금주를 적어서 보내주시거나 소비자 상담실(00-0000-0000), 상품문의, 1:1
				문의 남겨주시길 바랍니다.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>
				<br style="margin: 0px; padding: 0px;">
			</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				핸드폰 결제 핸드폰 결제는 부분취소가 불가능하며, 당월 결제금에 대해서만 결제 취소할 수 있습니다.</p>
			<>
			<p>만일, 부분취소를 희망하시면 취소하지 않는 상품의 가격과 배송비를 자사 입금계좌에 입금해 주시면 전체취소로
				취소가 진행됩니다.</p>
			<p>또한, 당월이 지난 환불건에 대해서는 수수료를 제외한 나머지 금액을 현금으로 환불해 드립니다. &nbsp;</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>
				<br style="margin: 0px; padding: 0px;">
			</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>&nbsp;-
				실시간 계좌이체, 카드</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>&nbsp;부분
				취소가 불가능하며 취소하지 않으신 상품의 가격과 배송비를 입금해주시면 주문 전체 취소로 처리됩니다.</p>
			<p>
				<br>
			</p>
			<p>AS안내</p>
			<p
				style='margin: 0px; padding: 0px; outline: none; color: rgb(0, 0, 0); font-family: "Nanum Gothic", "Noto Sans KR", "Malgun Gothic", "맑은 고딕", AppleGothic, Dotum, 돋움, sans-serif !important; word-break: break-all;'>-
				소비자분쟁해결 기준(공정거래위원회 고시)에 따라 피해를 보상받을 수 있습니다.</p>
			<p
				style='margin: 0px; padding: 0px; outline: none; color: rgb(0, 0, 0); font-family: "Nanum Gothic", "Noto Sans KR", "Malgun Gothic", "맑은 고딕", AppleGothic, Dotum, 돋움, sans-serif !important; word-break: break-all;'>-
				고객센터(00-0000-0000) / 1:1 문의주시면 빠르게 답변해드리겠습니다.</p>
			<!-- </script> -->
		</div>
		<p
			style="margin: 20px 0; padding: 21px 26px 20px 19px; line-height: 20px; font-size: 14px; color: #757c8a; background: #fafafa; border-radius: 2px; white-space: normal;">
			소비자가 전자상거래등에서 소비자 보호에 관한 법률 제 17조 제1항 또는 제3항에 따라 청약철회를 하고 동법 제 18조
			제1항 에 따라 청약철회한 물품을 판매자에게 반환하였음에도 불구 하고 결제 대금의 환급이 3영업일을 넘게 지연된 경우,
			소비자 는 전자상거래등에서 소비자보호에 관한 법률 제18조 제2항 및 동법 시행령 제21조 2에 따라 지연일수에 대하여
			전상법 시행령으로 정하는 이율을 곱하여 산정한 지연이자(“지연배상금”)를 신청할 수 있습니다. 아울러, 교환∙반품∙보증 및
			결제대금의 환급신청은 [마이페이지]에서 하실 수 있으며, 자세한 문의는 고객센터로 연락하여 주시기 바랍니다.</p>
		<!-- 구매평 -->
			<hr>
			
		<div class="review" id="product-review">
			<div class="review-title">상품리뷰사진</div>
			상품을 구매하신 분들이 작성하신 리뷰입니다.리뷰 작성시 아래 금액만큼 포인트가 적립됩니다.
			<div class="review-text1">
				텍스트 리뷰:<b>300원</b> &nbsp;
				포토/동영상 리뷰:<b>1,000원</b> &nbsp;
				한달사용 텍스트 리뷰:<b>100원</b> &nbsp;
				한달사용 포토/동영상 리뷰 :<b>100원</b>&nbsp;
			</div>
			
			<div class="reviewcarousel">
			<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	  			<div class="carousel-inner">
			<% 	 List<ReviewsDTO> rList = (List<ReviewsDTO>)request.getAttribute("ReviewList"); 
			for(int j=0; j<rList.size(); j++){
				 String rImg2 = rList.get(j).getrImg();
				 String [] rImgList2 = null;

				 if(rImg2 != null){
					 rImgList2 = rImg2.split("@");
				 }
				 if(rImgList2 != null){ 
					 for ( int n = 1; n < rImgList2.length; n++) {%> 
					 	<%if(n == 1){ %>
							 <div class="carousel-item active">
						<%}else{ %>
							 <div class="carousel-item">
						<% } %>
								<img src="<%= rImgList2[0]+rImgList2[n] %>" class="d-block w-100 h-50" data-xxx="<%=rImgList2[0]+rImgList2[n]%>">
								
							 </div>
						<% }}} %> 
					  	</div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>
				</div>
			<hr>
			<div class="review-title">리뷰작성</div>
			<form id="reviewForm" action="reviewAdd" method="post" enctype="multipart/form-data">
			<div class="rating-image-container">
			<input type="hidden" name="ProductID" value="<%=gProductID%>">
				<div class="mb-3" id="Rating">
					<fieldset name="Rating">
						<input type="radio" name="Rating" value="5" id="rate1">
							<label for="rate1">⭐</label> 
						<input type="radio" name="Rating" value="4" id="rate2">
							<label for="rate2">⭐</label> 
						<input type="radio" name="Rating" value="3" id="rate3">
							<label for="rate3">⭐</label> 
						<input type="radio" name="Rating" value="2" id="rate4">
							<label for="rate4">⭐</label> 
						<input type="radio" name="Rating" value="1" id="rate5">
							<label for="rate5">⭐</label>
					</fieldset>
				</div>
				<div class="select_img" contenteditable="true"><img src="" /></div><br>
				<input type="file" id="rImg" name="files" multiple style="display: none;" readonly="readonly"/>
			</div>
			<div class="review-subcontainer2">
				<div class="review-subcontainer3">
					<textarea id="review-content" name="ReviewContent"
						placeholder="리뷰를 입력하세요.&#10;해당 상품의 구입내역을 가진 회원만 리뷰 작성 가능합니다."></textarea>
				</div>
				<div class="review-subcontainer4">
					<div class="review-subcontainer5">
						<label for="rImg" class="attach-button">사진첨부</label>
					</div>
					<div>
						<button onclick="submit" id="review-button" class="submit-button">리뷰등록</button>
					</div>
				</div>
			</div>
			</form>
			<hr>
			<div class="review-title">상품리뷰</div>
<% 
			 for(int i=0; i<rList.size(); i++){
				 int ReviewID = rList.get(i).getReviewID();
				 String UserAlias = rList.get(i).getUserAlias();
				 String CreationTime = rList.get(i).getCreationTime();
				 double Rating = rList.get(i).getRating();
				 String ReviewContent = rList.get(i).getReviewContent();
				 String rImg = rList.get(i).getrImg();
				 String rThumbImg = rList.get(i).getrThumbImg();
				 String [] rImgList = null;
				 String [] rThumbImgList = null;
				 if(rImg != null && rThumbImg != null){
					 rImgList = rImg.split("@");
					 rThumbImgList = rThumbImg.split("@");
				 }
			    byte[] userImgBytes = rList.get(i).getUSERIMG();  // 바이트 배열 형태의 이미지 데이터
			    String imageSrc = null;
			    if(userImgBytes == null){  
			    	 imageSrc = "강아지기본이미지" ;  //강아지기본이미지.JPG
			    } else {
			    	String base64Image = Base64.getEncoder().encodeToString(userImgBytes);
			    	 imageSrc = "data:image/jpeg;base64," + base64Image;
			    }
				 // 평점 합계
				 double sum = 0;
				 int n = 0;
				 if(Rating != 0){
					 n++;
				 }
				 sum = sum + Rating;
%>
			<ul>
				<li>
					<div class="goodsretrieve-review-content">
						<div class="goodsretrieve-review-content2">
							<% if(userImgBytes == null ){ %>
							<img src="resources/<%= imageSrc %>.JPG" height="40" width="40"/>
							<% } else { %>
							<img src="<%= imageSrc %>" height="40" width="40"/>
							<% } %>
						</div>
						<div>
						<span class="review-useralias"><%= UserAlias %></span> <span
							style="font-size: 11px; color: #FFAF0A;"> <% if(Rating == 5) {%>
							<span>⭐⭐⭐⭐⭐</span> <% } else if(Rating == 4) {%> <span
							style="font-size: 11px; color: #FFAF0A;">⭐⭐⭐⭐</span> <% } else if(Rating == 3) {%>
							<span style="font-size: 11px; color: #FFAF0A;">⭐⭐⭐</span> <% } else if(Rating == 2) {%>
							<span style="font-size: 11px; color: #FFAF0A;">⭐⭐</span> <% } else if(Rating == 1) {%>
							<span style="font-size: 11px; color: #FFAF0A;">⭐</span> <% } %>
							<% if(Rating != 0){  %>
							<span><%= Rating %></span>
							<% } %>
						</span> <br> <span
							style="font-size: 11px; color: gray; font-weight: bolder;"><%= CreationTime %></span>
						</div>
					</div> 
					<%if(ReviewContent != null){ %>
					<p><%= ReviewContent %></p> <% } %> <%if(rThumbImgList != null){ for ( int m = 1; m < rThumbImgList.length; m++) {%> 
					<img src="/app/imgUpload<%= rThumbImgList[0]+rThumbImgList[m] %>" class="img" data-xxx="/app/imgUpload/<%=rImgList[0]+rImgList[m]%>">
					<div class="modal" id="/app/imgUpload/<%=rImgList[0]+rImgList[m] %>">
						<span class="close">&times;</span> <img class="modal_content"
							id="img01">
					</div> <% }} %> <!-- 댓글 수정 폼-->
					<form class="collapse multi-collapse-{{id}}">
						                    
						<div class="form-group">
							                        
							<textarea class="form-control" id="comment-content" rows="3">{{comment}}</textarea>
							                    
						</div>
						<button type="button" id="btn-comment-update"
							class="btn btn-outline-primary bi bi-pencil-square">수정</button>
					</form>
<% UsersDTO user = (UsersDTO)session.getAttribute("User");
	if(user != null){
			if(user.getUserAlias().equals(UserAlias)) { %> 
				<div class="review-button">
					<form style="margin-right: 5px;">
					<button class="btn btn-primary btn-sm" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#collapseExample<%=ReviewID%>"
						aria-expanded="false" aria-controls="collapseExample">수정</button>
					</form>
					<form id="reviewForm<%=ReviewID%>" method="post">
						<input type="hidden" name="ReviewID" value="<%=ReviewID%>">
						<input type="hidden" name="ProductID" value="<%=gProductID%>">
						<button class="btn btn-danger btn-sm delbtn" onclick="reviewUpdate('del', <%=ReviewID%>)">삭제</button>
					</form>
					
				</div>
				
<% } }%>
					<div class="collapse" id="collapseExample<%=ReviewID%>">
						<div class="card card-body">
							<form id="reviewUpdateForm" action="updateReview" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="ReviewID" value="<%=ReviewID%>">
								<input type="hidden" name="ProductID" value="<%=gProductID%>">
								<div class="mb-3" id="Rating">
									<span style="font-size: 20px; color: #FFAF0A;"> <%
								 	if (Rating == 5) {
								 %> <span>⭐⭐⭐⭐⭐</span> <%
								 	} else if (Rating == 4) {
								 %> <span style="font-size: 20px; color: #FFAF0A;">⭐⭐⭐⭐</span> <%
								 	} else if (Rating == 3) {
								 %> <span style="font-size: 20px; color: #FFAF0A;">⭐⭐⭐</span> <%
								 	} else if (Rating == 2) {
								 %> <span style="font-size: 20px; color: #FFAF0A;">⭐⭐</span> <%
								 	} else if (Rating == 1) {
								 %>
								<span style="font-size: 20px; color: #FFAF0A;">⭐</span> <%
								 	}
								 %>
									</span>
									<span style="color: gray; font-size: 11px;">(평점과 이미지는 수정할 수 없습니다.)</span>
								</div>
								<div class="select_img" id="select_img">
								<% if(rThumbImgList != null) { for ( int k = 1; k < rThumbImgList.length; k++) {%>
								<img class="img" src="<%= rThumbImgList[0] + rThumbImgList[k] %>" data-xxx="<%=rImgList[0]+rImgList[k]%>" />
								<div class="modal" id="<%=rImgList[0]+rImgList[k] %>">
									<span class="close">&times;</span> <img class="modal_content"
										id="img01">
								</div><% } } %>
								</div>
								<div class="review-update-container">
									<textarea id="review-content" name="ReviewContent"
										style="width: 80%; height: 60px; resize: none;"
										placeholder="수정할 리뷰를 입력하세요"><% if(ReviewContent != null) { %><%= ReviewContent %><% } %></textarea>
									<button id="review-button" class="submit-button">수정</button>
								</div>
							</form>

						</div>
					</div>
				</li>
			</ul>
			<hr>
			<%
				}
			%>
			<!-- 리뷰 사진 등록 -->

	<script type="text/javascript">
		//사진첨부
		$("#rImg").change(function(){
		    if (this.files && this.files.length > 0) {
		        $(".select_img").empty(); // 이미지 미리보기 영역 초기화

		        for (var i = 0; i < this.files.length; i++) {
		            var reader = new FileReader();
		            reader.onload = function(data) {
		                var imgElement = $('<img>').attr('src', data.target.result).width(100);
		                var divElement = $('<div>').addClass('preview-image').append(imgElement);
		                $(".select_img").append(divElement);
		            }
		            reader.readAsDataURL(this.files[i]);
		        }
		    }
		});
		
		//모달창 이벤트 
		$(".img").click(function() {
			var imageUrl = $(this).data("xxx");
			modalDisplay("block");
			$(".modal_content").attr("src", imageUrl);
		})
		$(".close").click(function() {
			modalDisplay("none");
		})
		$(".modal").click(function() {
			modalDisplay("none");
		})

		function modalDisplay(text) {
			$(".modal").attr("style","display:"+text);
		}
	</script>
</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" flush="true" />
</body>
</html>
