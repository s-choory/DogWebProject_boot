<%@page import="com.example.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage</title>
        <link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
        <link rel="stylesheet" href="#">  
        <!--1. bootstrap css넣기  -->

         <!-- Bootstrap CSS -->
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Favicon-->
        <!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <!-- <link href="css/styles.css" rel="stylesheet" /> -->
        
        <!-- 스크립트부분 -->
        <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function cartList(){
		location.href = "cartList";
	}
	
$(function () {

    
	//구매 버튼 클릭시  상세구매페이지로 이동   
	$(document).on('click', '#buyitem', function () {
		var gProductID = $(this).attr("data-xxx");
		//var gProductID = $("#hiddengProductID2").val();
			console.log(">>>>>",gProductID); 
			
			// 폼 선택 후 제출
	        $('#myForm'+gProductID).submit();
	    });
    
//  검색 기능 이벤트 처리 (버튼 누를시)
	 
 	$("#searchbtn").on("click",function(){
 		console.log("검색버튼 눌림");
 		console.log($("#searchid").val());
 		var SearchName = $("#searchid").val();
 		$('#searchForm').submit();
 	});
	
 	//엔터 눌러도 검색 가능하게  
 	$("#searchid").on("keyup", function(event) {
 		  if (event.keyCode === 13) { // Enter 키의 keyCode는 13입니다.
 			console.log("검색버튼 눌림");
 	 		console.log($("#searchid").val());
 	 		var SearchName = $("#searchid").val();
 	 		$('#searchForm').submit();
 		  }//end if
 	});
  

 	/* const myModal = document.getElementById('myModal')
 	const myInput = document.getElementById('myInput')

 	myModal.addEventListener('shown.bs.modal', () => {
 	  myInput.focus()
 	}) */
    
});//end dom


</script>
        <!-- 스크립트부분 끝 -->
        
		<!-- 모달창 스타일 -->
<style type="text/css">
		 .clickimg {
			display: flex;
 		    flex-direction: row; 
		  
		}
		
		.clickimg_left {
		 	width: 50%;
		 	height: 50%;
		}
		
		.clickimg_right {
		 	width: 60%;
		} 
		
		#custom-modal-dialog {
		     max-width: 1000px !important; /* 원하는 최대 너비로 변경 */ 
		    max-height: 100px !important;
		}
		.carousel-item img {
		    height: 390px;
		    object-fit: cover;
		  }
		.navbar-brand{
			font-weight: bolder;
		}
</style>        
        <!-- 모달창 스타일 끝 -->
        
    </head>
    <body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>     
                <!-- Header-->
<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" style="width: auto; " >
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="2000">
      <img src="https://i.vimeocdn.com/video/1610071835-109cbba6edd9b697fc1a7bc1f1e44a5882f1a70829d24b1a4bdaabc0da0f39e6-d?mw=1280&mh=400" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="https://i.vimeocdn.com/video/1213676488-80c903f09541766f93c85c66079c0690925c675d18ae7c9bc8c56cc3c7de5ae6-d?mw=1700&mh=868" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="https://i.vimeocdn.com/video/1381913515-4e862a8152ae01adf854fc55217c5e80ac4b12dd4b029f6dd74f806e9b12b233-d?mw=1300&mh=632" class="d-block w-100" alt="...">
    </div>
     <div class="carousel-item" data-bs-interval="2000">
      <img src="https://i.vimeocdn.com/video/1213676084-ce98819432445a15738517cc7e0a0eae04b3baeeb4a0349813fd6b216d305a35-d?mw=1300&mh=664" class="d-block w-100" alt="...">
    </div>
  </div>
</div>
        <!-- 캐러셀 부분 끝  --> 
        
        
        <!-- NAV -->
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Store</a>
                
				<form id="searchForm" action="/app/search" method="get">
					<div class="search" id="search">
						<input type="text" id="searchid" class="searchid" name="SearchName" placeholder=" 제품을 입력하세요 ex) 터그  " style="width: 220px; border-radius: 5px; ">
						<button id="searchbtn" class="btn-sm btn-outline-dark" >검색</button>
					</div>
				</form>
				
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                         <li class="nav-item"><a class="nav-link active" aria-current="page" href="dogshop_main?gCategory=장난감">장난감</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="dogshop_main?gCategory=식기">관련용품</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="dogshop_main?gCategory=의류">의류</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="dogshop_main?gCategory=사료">사료</a></li>
                        <li class="nav-item" style="border-right: 1px solid gray"><a class="nav-link active" aria-current="page" href="dogshop_main?gCategory=간식">간식</a></li> 
   <% 
		// 지금 열려있는 특정 카태고리를 컨트롤러에 담아 보내주기 위해 파싱 과정 
		List<GoodsDTO>list3 = (List<GoodsDTO>) request.getAttribute("list");
		//list3가 null이거나 비어있을 때에 대한 처리를 추가했습니다. 따라서, list3가 null이 아니고 특정 값이 있다면 해당 값을 사용하여 원하는 동작을 수행할 수 있습니다.
		GoodsDTO dto3 = null;
		String gCategory3 = "";

		if (list3 != null && !list3.isEmpty()) {
		dto3 = list3.get(0);
		gCategory3 = dto3.getCategory();
   %>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="dogshop_MostPopular?gCategory=<%=gCategory3%>" id= "popul">인기순</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="dogshop_ASCPriceList?gCategory=<%=gCategory3%>" id= "h_price">가격낮은순</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="dogshop_DESCPriceList?gCategory=<%=gCategory3%>" id= "l_price">가격높은순</a></li>
   <%
	}
   %> 
                    </ul>
                        <button class="btn btn-outline-dark" onclick="cartList()">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                           <% int CartCount = (int)request.getAttribute("CartCount");%>
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%=CartCount %></span>
                        </button>
                </div>
            </div>
        </nav> 
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
   <% 
		List<GoodsDTO>list = (List<GoodsDTO>) request.getAttribute("list");
		//int a = 12; //리스트 화면노출 갯수 지정
		//data-xxx= Num 
		if(list !=null ){
		for(int i = 1; i <= list.size(); i++) { 
		GoodsDTO dto = list.get(i-1);
		String gName = dto.getPRODUCTNAME();
		int gPrice = dto. getPrice();
		String gImage = dto.getImage();
		//여기 밑에 4개는 히든으로 넘김 
		int gProductID = dto.getPRODUCTID();
		String gCategory = dto.getCategory();
		String gContent = dto.getContent();		
		int gAmount = dto.getSTOCKQUANTITY();	 
	%>
                    <div class="col mb-5 shop_list" data-xxx="<%=i%>">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="resources/storeimages/<%=gImage%>.jpg"  alt="..." width=260px height=200px/>
                            <!-- Product details-->
                            <div class="card-body p-4" >
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%=gName%></h5>
                                    <!-- Product price-->
                                    <%=gPrice%>원
                                </div>
                                <input type="hidden" name="gProductID" value="<%=gProductID%>" id="gProductID<%=i%>">
					            <input type="hidden" name="gCategory" value="<%=gCategory%>" id="gCategory<%=i%>">
					            <input type="hidden" name="gContent" value="<%=gContent%>">
					            <input type="hidden" name="gAmount" value="<%=gAmount%>">
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                	<a class="btn btn-outline-dark mt-auto shop_list2" data-xxx="<%=i%>" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal<%=gProductID%>">
	                                	상세정보
	                                </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
			                     <!-- Modal -->
				`	<div class="modal fade" id="exampleModal<%=gProductID%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" id="custom-modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel"><%=gName %></h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					      
					      
<div class="clickimg" id="clickimg">
<div class="clickimg_left">
             <img src="resources/storeimages/<%=gImage%>.jpg" alt="" width="100%" height=="100%" class=image >
     </div>
	 <div class="clickimg_right">
    	<ul>
    		<li> <%=gName%></li><br>
    		<li> <%=gContent%></li><br>
    		<li>제품가격: <%=gPrice%></li><br>
    		<li>남은재고: <%=gAmount%></li><br>
    	</ul>
			<!--  히든으로  -->
			<form id="myForm<%=gProductID%>" action="goodsRetrieve" method="post">
				<!--  특정값 넘기기 위해  폼 추가  -->
				<div>
					<input type="hidden" name="gProductID" value="<%=gProductID%>"  
						id="hiddengProductID2">
				</div>
			</form>
	 </div>
</div>


					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" id="buyitem" data-xxx="<%=gProductID%>" >구매</button>
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div> 
      <% } } %>
                  
                </div>
            </div>
        </section>
  
        <!-- Footer-->
        <jsp:include page = "../common/footer.jsp" flush="true"/><br>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <!-- <script src="js/scripts.js"></script> -->
    </body>
</html>