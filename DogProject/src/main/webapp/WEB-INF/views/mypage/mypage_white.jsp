<%@page import="com.example.dto.PageDTO"%>
<%@page import="java.util.Date"%>
<%@page import="com.example.dto.PostsDTO"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="com.example.dto.CartDTO"%>
<%@page import="com.example.dto.UsersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="resources/css/profil.css">
<head>
<meta charset="UTF-8">
<title>수정하는곳2</title>
<style type="text/css">

/* 전체틀 */	
	#full {
		width: 1000px;
		height: 1000px;
		background-color: white;
	}
	
/* 전체틀 끝 */	
	
	
/* 왼쪽부분 */	
	#screen_left {
		width: 450px;
		height: 1000px;
		background-color: white;
		float: left;
	}
	
	#screenleft-1 {
		width: 350px;
		height: 900px;
		background-color: pink;
		position: relative;
		top: 50px;
		left: 50px;
	}
	
	#userbutton {
		position: relative;
		padding-left: 35%;
	}	
	
	.circle {
		position: relative;
		width: 350px;
		height: 350px;
		border-radius: 50%;
		overflow: hidden;
	}
	
	.view {
		position: relative;
		top: 25px;
		width: 350px;
		height: 350px;
	}
	
	.view_title {
		position: relative;	
		width: 350px;
		height: 50px; 
		border: 1px dashed pink; 
		text-align: center;
		line-height: 70px;
		font-size: 1.5em;
		font-weight: bold; 
	}
	
	.view_text {
		position: relative;	
		top: 10px;
		width: 350px;
		height: 170px; 
		border: 1px dashed pink; 
		text-align: center;
		line-height: 30px;
		font-size: 1.2em;
	}
	
	.view_text input {
 		 width: 100px; /* input 요소의 넓이 조절 */
	}
	
/* 왼쪽부분 끝 */	
	
	
	
/* 오른쪽 부분 */	
	#screenright {
		width: 550px;
		height: 1000px;
		background-color: white;
		float: left;
	}
	
	#rightbox1 {
		width: 500px;	/* 450px; */
		height:450px;	/* 300px; */
		background-color: pink;
		position: relative;
		top: 25px;	/* 25px; */
		left: 50px;	/* 50px;	 */
	}
	
	#rightbox2 {
		width: 450px;
		height: 300px;
		background-color: pink;
		position: relative;
		top: 25px;
		left: 50px;
		margin-top: 25px;
		margin-bottom: 25px; /* 간격 조절 */
	}
	
	#rightbox3 {
		width: 450px;
		height: 300px;
		background-color: pink;
		position: relative;
		top: 25px;
		left: 50px;	
	}
	
	#rightbox_title {
		font-size: 1.5em;
		font-weight: bold; 
	}
	
	#shoppingbasket {
		position: relative;	
		top: 25px;
		left: 25px;
		bottom: 25px;
		width: 400px;
		height: 250px;
		white-space: nowrap; /* 세로 스크롤 삭제 */
		overflow-x:scroll;	 /* 가로 스크롤만 생성 */
		
	}
	
	#shoppingbasket2 {
	/* 	position: relative;	
		display: inline-block;
		background-color: white;
		margin-right: 20px;
		margin-bottom: 20px; */ /* 이미지아래 간격, 추가되었습니다. */
		swiper-theme-color: #007aff;
	    swiper-navigation-size: 44px;
	    font-family: '맑은 고딕', 'Malgun Gothic', Microsoft NeoGothic, AppleGothicNeoSD, 'Apple SD 산돌고딕 Neo', Droid sans, sans-serif;
	    font-size: 1.5rem;
	    line-height: 1.4;
	    color: #555555;
	    letter-spacing: -1px;
	    text-align: left;
	    box-sizing: border-box;
	    margin: 0;
	    padding: 0;
	    width: 45%;
	    display: flex;
	    margin-right: 4%;
	    margin-bottom: 20px; /* 각각의 div 간격 띄우기 */
	}
	#shoppingbasket2 > div {
    /* 기존 스타일 속성 */
    flex: 1; /* 추가된 스타일 속성 */
	}
	
	#shoppingbasket_info{
    --swiper-theme-color: #007aff;
    --swiper-navigation-size: 44px;
    font-family: '맑은 고딕', 'Malgun Gothic', Microsoft NeoGothic, AppleGothicNeoSD, 'Apple SD 산돌고딕 Neo', Droid sans, sans-serif;
    font-size: 1.5rem;
    line-height: 1.4;
    color: #555555;
    letter-spacing: -1px;
    text-align: left;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    width: 45%;
    display: inline-block;
    margin-right: 4%;
	}
	
	
	#orderlist {
		position: relative;	
		top: 25px;
		left: 25px;
		bottom: 25px;
		width: 400px;
		height: 250px;
		white-space: nowrap; /* 세로 스크롤 삭제 */
		overflow-x:scroll;	 /* 가로 스크롤만 생성 */
		
	}
	
	#orderlist2 {
		position: relative;	
		display: inline-block;
		background-color: white;
		margin-right: 20px;
		margin-bottom: 20px; /* 이미지아래 간격, 추가되었습니다. */
	}	
	
	 /*  달력 부분 스타일 */ 
 
        td {
            width: 50px;
            height: 29px;
        }

        .Calendar { 
            text-align: center;
            margin: 0 auto; 
        }

        .Calendar>thead>tr:first-child>td { font-weight: bold; }

        .Calendar>thead>tr:last-child>td {
            background-color: gray;
            color: white;
        }        

        .pastDay{ background-color: lightgray; }

        .today{            
            background-color: #FFCA64;            
            cursor: pointer;
        }

        .futureDay{            
            background-color: #FFFFFF;
            cursor: pointer;
        }

        .futureDay.choiceDay, .today.choiceDay{            
            background-color: #3E85EF;            
            color: #fff;
            cursor: pointer;
        }
        
        /* 달력부분 스타일 끝  */
	
	
	
	
/* 오른쪽부분 끝 */	
	
/* 하단부분 스타일(내가 쓴글,좋아요한글) */
	#full2 {
		margin-top:7%;
		width: 1000px;
		height: auto;
		background-color: white;
	}
	.post {
        display: flex;
        align-items: flex-start;
       	border: 1px solid #ccc;
	    padding: 15px;
	    border-radius: 5px;
	    margin-top: 20px;
	    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        background-color: white;
    }
    .post img {
        max-width: 150px;
        margin-right: 20px;
    }
     .post-content h3 { 
     font-size: 24px; 
     color: #35424a; 
     margin-top: 0px; 
     margin-bottom: 5px; 
 	} 
	
	.post-content p {
    font-size: 16px;
    color: #666;
	}
	.post-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;
	}
	.post-meta {
	    display: flex;
	    align-items: center;
	}
	.post-meta .like,
	.post-meta .comment {
	    margin-right: 20px;
	    font-size: 14px;
	    color: #666;
	}
	.post-time {
	    font-size: 14px;
	    color: #666;
	}
  	.page{
    	display: flex;
        justify-content: center;
    }
    
	#post-category{
		display: flex;
		justify-content: center;
	}
	#post-category1, #post-category2  {
	    background-color: #06f;
	    color: #fff;
	    border: none;
	    border-radius: 5px;
	    padding: 15px;

        display: inline-block;
        align-items:center; /* 버튼 내부의 텍스트를 수직 가운데 정렬합니다. */
        margin-right: 10px; /* 오른쪽 여백 설정 */
    }
	
	
	
/* 하단 끝 */
</style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    	$(function () {
			
    		//모달창 열고 닫기 
    		const open = document.querySelector("#open");
    		const close = document.querySelector("#close");
    		const modalBox = document.querySelector("#modal-box");
    		
    		open.addEventListener("click", () => { 
    			modalBox.classList.add("active");
    		});
    		close.addEventListener("click", () => { 
    			modalBox.classList.remove("active")
    		});
    		
    		
    		
			// 모달창안에서 이미지 변경 클릭시 
    		 $("#profil-img-change").on("click", function() {
    		        console.log("이미지 변경 버튼 클릭됨");

    		        var formData = new FormData(document.getElementById("profil-img-form")); // 폼 데이터 생성

    		        $.ajax({
    		            url: "profil-img",
    		            type: "POST",
    		            data: formData,
    		            processData: false,
    		            contentType: false,
    		            success: function(response) {
    		                console.log("이미지 업로드 성공");
    		                console.log(response);
    		                console.log(response.imageUrl);
    		                
    		                var imgElement = document.getElementById("preview-img");
    		                
    		            	if (imgElement) { 
    		            	    imgElement.src = "data:image/jpeg;base64," + response; 
    		            	    // 서버에서 받은 응답 데이터 중 이미지 데이터를 사용하여 화면에 적용.
    		            	}
    		            	
    		            	modalBox.classList.remove('active');  // 모달창 닫기
    		            	
    		            	location.reload();  // 페이지 자동 새로고침 
    		                
    		            },
    					error: function(xhr, status, error){
    						console.log(error);
    					}
    		        });
    		    });
			
			
    		 // 모달창 안에서 이미지 삭제 클릭 시 
    		    $("#profil-img-change3").on("click", function() {
    		        console.log("이미지 삭제 버튼 클릭됨");

    		        $.ajax({
    		            url: "delete-profil-img",
    		            type: "POST",
    		            success: function(response) {
    		                console.log("이미지 삭제 성공");
    		                
    		                var imgElement = document.getElementById("preview-img");
    		                
    		                if (imgElement) { 
    		                    imgElement.src = "resources/강아지기본이미지.JPG"; 
    		                    // 강아지 기본 이미지로 변경
    		                }
    		                
    		                modalBox.classList.remove('active');  // 모달창 닫기
    		                
    		                location.reload();  // 페이지 자동 새로고침 
    		                
    		            },
    					error: function(xhr, status, error){
    						console.log(error);
    					}
    		        });
    		    });
    		
    		 
    		    // 모달창 안에서 프로필 정보 변경 클릭시 
    		    $("#profil-img-change2").on("click", function() {
    		        console.log("프로필 정보 변경 버튼 클릭됨");

    		     	// 폼 데이터 가져오기
    		        var formData = $("#profil-text-form").serialize();
    		        
    		        $.ajax({
    		            url: "profil-text",
    		            type: "POST",
    		            data: formData,
    		            success: function(response) {
    		                console.log("프로필 정보 변경 성공");
    		                
    		                modalBox.classList.remove('active');  // 모달창 닫기
    		                
    		                location.reload();  // 페이지 자동 새로고침 
    		                
    		            },
    		            error: function(xhr, status, error) {
    		                console.log(error);
    		            }
    		        });
    		    });
    		
    		
    		
		})//end dom
		
    </script>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<% 
    UsersDTO dto = (UsersDTO) session.getAttribute("User"); 	
	
	String DetailAddress = dto.getDetailAddress();
	int Post = dto.getPost();
    String UserName = dto.getUserName();
    String UserAlias = dto.getUserAlias();
    String PhoneNumber = dto.getPhoneNumber();
    String Email1 = dto.getEmail1();
    String Email2 = dto.getEmail2();
    String Password = dto.getPassword();
    String RodeAddress = dto.getRodeAddress();
    String HouseAddress = dto.getHouseAddress();
    String DogName = dto.getDogName();
    String DogType = dto.getDogType();
    String UserType = dto.getUserType();

    byte[] userImgBytes = dto.getUSERIMG();  // 바이트 배열 형태의 이미지 데이터
    String imageSrc = null;
    if(userImgBytes == null){  
    	 imageSrc = "강아지기본이미지" ;  //강아지기본이미지.JPG
    } else {
    	String base64Image = Base64.getEncoder().encodeToString(userImgBytes);
    	 imageSrc = "data:image/jpeg;base64," + base64Image;
    }
%>
<div id="full">
<h1>mypage</h1>

	<!-- 반나눠서 왼쪽 부분  -->
	<div id="screen_left">
		<div id="screenleft-1">
				<div class="circle">
					<% if(userImgBytes == null ){ %>
					<img src="resources/<%= imageSrc %>.JPG" height="350" width="350"/>
					<% } else { %>
					<img src="<%= imageSrc %>" height="350" width="350"/>
					<% } %>
					<button>프로필변경</button>
				</div>
				<div class="view">
						<div class="view_title">회원정보</div>
						<div class="view_text">
							이름:<input type="text" id="name" value="<%=UserName%>"disabled><Br>
							닉네임:<input type="text" id="nickname" value="<%=UserAlias%>"disabled><Br>
							전화번호:<input type="text" id="tel" value="<%=PhoneNumber%>"disabled><Br>
							이메일:<input type="text" id="email1" value="<%=Email1%>"disabled>@<input type="text" id="<%=Email2%>" value="naver.com" disabled><Br>
							주소 :<input type="text" id="address" value="<%=RodeAddress%>"disabled><Br>
						</div>
						<div class="view_title">반려견 정보</div>
						<div class="view_text">
							이름 :<input type="text" id="dogname" value="<%=DogName%>"disabled> <Br>
							품종 :<input type="text" id="dogbreed" value="<%=DogType%>"disabled> <Br>
						</div>
						
 <!-- ======================= 프로필 변경 모달창 ===========================================  -->
						<div id="userbutton">
							 <!-- <input type="button" value="수정"> -->
							 <button class="open" id="open">프로필 변경</button>
							 <div id="modal-box">
							 	<div id="modal-contents">
							 		<button id="close" style="color: white-space; background-color: red;" >닫기&times;</button>
							 		<h1 id="title">my profile</h1>
							 		<div id="profil">
							 		<!-- 이미지 변경 폼 들어갈 부분 -->
							 		<form id="profil-img-form" action="profil-img" method="post" enctype="multipart/form-data"> <!-- enctype 안적으면 파일 안넘어감  -->
							 			<div id="profil-img">
											        <!-- <img id="preview-img" src="resources/sun.png" alt="sun" style="width: 300px; height: 300px;"><br> -->
											<% if(userImgBytes == null ){ %>
											<img  id="preview-img" src="resources/<%= imageSrc %>.JPG" alt="profile image" style="width: 300px; height: 300px;"><br>
										    <% } else { %>
										    <img id="preview-img" src="<%= imageSrc %>" height="350" width="350"/><br>
										    <% } %>
										    <input type="file" id="file" value="파일찾기" name="file"><br>
							 				<div  id="button-group">
										        <input type="button" id="profil-img-change" value="이미지 변경">
										        <input type="button" id="profil-img-change3" value="이미지 삭제">
										    </div>
							 			</div>
							 		</form>
							 		<!-- 회원정보  수정  -->
							 		<form id="profil-text-form" action="profil-text" method="post">	
							 			<div id="desc">
							 				<p class="user">회원정보</p>
							 				<div id="aa">
								 				<p class="user">이름: <input type="text" id="name" name="UserName" value="<%=UserName%>"></p>
								 				<p class="user">닉네임:<input type="text" id="nickname" name="UserAlias" value="<%=UserAlias%>"></p>
								 				<p class="user">연락처:<input type="text" id="tel" name="PhoneNumber" value="<%=PhoneNumber%>" placeholder="'-'을 포함하여 입력하세요."></p>
								 				<p class="user">이메일:<input type="text" id="Email1" name="Email1" value="<%=Email1%>" placeholder="직접 입력해주세요.">@
										        <input type="text" name="Email2" id="Email2" name="Email2" value="<%=Email2%>"> 
										        <select name="select_email" id= "select_email" onchange="input_email();">
										            <option value="daum.net">daum.net</option>
										            <option value="naver.com">naver.com</option>
										            <option value="google.com">google.com</option>
										        </select>
								 				</p>
								 				<p class="user">주소:  
								 				<input type="text"  id="sample4_postcode"     name="Post"        value="<%=Post%>" readonly><Br>
								 				<input type="text"  id="sample4_roadAddress"  name="RodeAddress" value="<%=RodeAddress%>" style="width: 350px;" readonly><Br>
								 				<input type="text"  id="sample4_jibunAddress" name="HouseAddress" value="<%=HouseAddress%>" style="width: 350px;" readonly><Br>
								 				<input type="text"  id="DetailAddress_xxx" name="DetailAddress" value="<%=DetailAddress%>" style="width: 350px;" placeholder="상세주소를 입력해주세요.">
								 				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" id="zipcode-button">
								 				</p>
							 					
							 				<br>
							 				<!-- ... -->
										    <input type="hidden" name="UserID" value="<%= dto.getUserID() %>">
										    <input type="hidden" name="Password" value="<%= dto.getPassword() %>">
										    <input type="hidden" name="UserType" value="<%= dto.getUserType() %>">
										    <input type="hidden" name="USERIMG" value="<%= dto.getUSERIMG() %>">
										    <!-- ... -->
								 				<p class="user">반려견 정보</p>
								 				<p class="user">이름:<input type="text" id="dogname" name="DogName" value="<%=DogName%>" placeholder="직접 입력해주세요."></p>
								 				<p class="user">품종:<input type="text" id="dogbreed" name="DogType" value="<%=DogType%>" placeholder="직접 입력해주세요."></p>
								 				<input type="button" id="profil-img-change2" value="프로필 정보 변경">
							 				</div>
							 			</div>
							 		</form>	
							 		</div>
							 	</div>
							 </div>
						</div>		 
				</div>
		</div>
	</div>
	
 <!-- ======================= 프로필 변경 모달창 끝 ===========================================  -->
	
	<!-- 반나눠서 오른쪽 부분  -->
	<div id="screenright">
	
		<div id="rightbox1" class="rightbox">
		<jsp:include page = "../mypage/calendar.jsp" flush="true"/>
		<!-- <span id="rightbox_title">
  		</span> -->
		<!-- <h1>MyCalendar</h1> -->
  		 <div id='calendar'></div>
	   		    <!-- 달력 끝 -->

		</div>
		
		<div id="rightbox2" class="rightbox">
		 <!-- 장바구니 시작 -->
			 <span id="rightbox_title">장바구니</span>
			 <input type="button" value="결제하러가기">
			 <div id="shoppingbasket" >	
				<% 
					//장바구니  정보 가져와야함 
					/*
					CartDTO cDTO = (CartDTO)session.getAttribute("cDTO");
					int CartNum = cDTO.getCartNum();
					String UserID = cDTO.getUserID();
					int ProductID = cDTO.getProductID();
					String ProductName= cDTO.getProductName();
					int Price = cDTO.getPrice();
					String Psize = cDTO.getPsize();
					int Amount = cDTO.getAmount();
					String Color = cDTO.getColor();
					String Image = cDTO.getImage();
					*/
					
					List<CartDTO> list = (List<CartDTO>)request.getAttribute("list");
						for(int i=0; i < list.size(); i++){
							int num = list.get(i).getCartNum();
							String UserID = list.get(i).getUserID();
							int ProductID = list.get(i).getProductID();
							String ProductName = list.get(i).getProductName();
							int Price = list.get(i).getPrice();
							String Psize = list.get(i).getPsize();
							String Color = list.get(i).getColor();
							int Amount = list.get(i).getAmount();
							String Image = list.get(i).getImage();
				%>
				<div id="shoppingbasket2" >
					<div>
						<img src="resources/storeimages/<%= Image %>.jpg"border="0"  width="200px" height="200px;" style="float: left;" id="image<%=i%>"/>
					</div>
					<div class="shoppingbasket_info">
						<table>
				<colgroup>
					<col style="width: 35%">
					<col style="width: 65%">
				</colgroup>
				<tbody>
					<tr>
						<th>이름</th>
						<td><%= ProductName %></td>
					</tr>
					<tr>
						<th>사이즈</th>  
						<td><%= Psize %></td>
					</tr>
					<tr>
						<th>색상</th>  
						<td><%= Color %></td>
					</tr>
					<tr>
						<th>수량</th>  
						<td><%= Amount %></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><%= Price %></td>
					</tr>
				</tbody>
			</table>
					</div>	
						
				
				
				</div>
				<% } %>
			</div>
	     <!-- 장바구니 끝 -->	
		</div>
		
		<div id="rightbox3" class="rightbox">
		 <!-- 주문list 시작 -->
			<span id="rightbox_title">주문List</span>
			 <div id="orderlist" >	
				<% 
					int a2 = 10; // 대충 10개까지 임의 지정
					//data-xxx= Num 
					for(int i = 1; i <= a2; i++) { 
				%>
				<div id="orderlist2" >
						<img src="resources/storeimages/간식11.jpg" border="0"  width="200px" height="200px;" style="float: left;" id="image<%=i%>"/>
				
				
				
				</div>
				<% } %>
			</div>
	     <!-- 주문list 끝 -->	
		</div>
		
	
	</div>
</div>
<div id="1"></div>
<div id="2"></div>
<!-- 하단 부분 시작 ( 내가 쓴글, 좋아요한 글?)  -->
<div id="full2">
	<form action="mypage">
		<div  id="post-category">
			<input type="submit" name="order" id="post-category1" value="내가 쓴 글">
			<input type="submit" name="order" id="post-category2" value="좋아요 누른 글">
	    </div>
    </form>
<!-- 검색기능 dto꺼내오기-->
<%	PageDTO pDTO= (PageDTO)request.getAttribute("pDTO");
	String order= (String)request.getAttribute("order"); // 정렬에 필요한 변수	%>
	
<!-- 게시물 jsp로 반복문 돌리기 -->	
 <% 
	List<PostsDTO> list2 = pDTO.getList();

 	for(int i = 0; i<list2.size(); i++){
 		
	PostsDTO pdto= list2.get(i);
	String Title= pdto.getTitle();
	String Content= pdto.getContent();
	String Category= pdto.getCategory();
	int Likes= pdto.getLikes();
	String CreationTime= pdto.getCreationTime();
	%> 
    <div class="container" style="margin-left: 5%; margin-right: 5%;">
        <section class="posts">
            <div class="post">
                <img src="resources/a.jpg" id="게시물 1" class="post-img">
                <div class="post-content">
                    <h3><%=Title %></h3><!-- 타이틀 -->
                    <p><%=Content %></p><!-- 내용 -->
                    <div class="post-info">
                        <div class="post-meta">
                            <span class="like">좋아요❤️<%=Likes %><span id="Like"></span></span>
                            <span class="comment">댓글<span id="Comment"></span></span>
                        </div>
                        <span class="post-time"><%=CreationTime %></span> <!-- 시간 표시 태그 -->
                    </div>
                </div>
            </div>
        </section>
    </div>
<%} %>
    <br>

<div class="page">
<jsp:include page = "../common/page.jsp" flush="true"/><br>
</div>
</div> <!-- full2 끝 -->
<jsp:include page = "../common/footer.jsp" flush="true"/><br>






<!-- 모달창 우편주소  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.  //우편번호 : data.zonecode
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
    
//파일찾기에서 파일 클릭시,선택시
document.addEventListener("DOMContentLoaded", function() {
    // 파일 선택 이벤트 리스너 등록
    document.getElementById("file").addEventListener("change", function(event) {
        var file = event.target.files[0]; // 선택한 파일 객체

        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var imgElement = document.getElementById("preview-img");
                if (imgElement) { // 이미지 요소가 존재하는 경우에만 속성 설정
                    imgElement.src = e.target.result; // 이미지 미리보기
                }
            }
            reader.readAsDataURL(file); // 선택한 이미지 파일을 Data URL로 읽어옴
        }
    });
});
    
    
    
    
 // 모달창 이메일 부분 
	function input_email(){
    	document.getElementById("Email2").value=document.getElementById("select_email").value; 
    }
</script>
</body>
</html>