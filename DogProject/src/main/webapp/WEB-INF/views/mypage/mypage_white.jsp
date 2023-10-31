<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="com.example.dto.PageDTO"%>
<%@page import="java.util.Date"%>
<%@page import="com.example.dto.PostsDTO"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="com.example.dto.CartDTO"%>
<%@page import="com.example.dto.UsersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>MyPage</title>
		<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="resources/assets/css/main.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/profil.css">
		
		<style type="text/css">

/* 내 정보 부분 스타일 */

	
	#screenleft-1 {
		width: 1200px;
		height: 900px;
		background-color: white;
		position: relative;
		top: 50px;
		left: 50px;
		margin-left:17%;
		
		padding-top: 7%;
		padding-left: 5%;
		padding-right: 15%;
		border: 1px solid #ccc; /* 테두리 추가 */
		border-radius: 5px;
		box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
		display: flex; /* 플렉스 컨테이너로 설정 */
	    flex-direction: row; /* 가로로 나열 */
	}
	
	#userbutton {
		position: relative;
		text-align: center;
	}	
	
	.circle {
		position: relative;
		width: 350px;
		height: 350px;
		border-radius: 50%;
		overflow: hidden;
		margin-right: 20px; /* 요소 간 간격을 위한 마진 설정 */
	}
	
	.view {
		position: relative;
		top: 25px;
		width: 350px;
		height: 350px;
		margin-right: 20px; /* 요소 간 간격을 위한 마진 설정 */
	}
	
	.view_title {
		position: relative;	
		width: 350px;
		height: 50px; 
		border: 1px dashed white; 
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
		border: 1px dashed white; 
		text-align: left;
		line-height: 30px;
		font-size: 14px;
		
		/* font-family: -apple-system,BlinkMacSystemFont,helvetica,"Apple SD Gothic Neo",sans-serif; */
		border-top: 1px solid rgba(220,227,233,.8); 
	}
	
	.view_text input {
 		 width: 110px; /* input 요소의 넓이 조절 */
		 border: none;
		 background-color: transparent;
	}
	
	#tel{
		width:200px;
	}
	
	#address {
		 width: 300px; /* 주소 입력란 너비 */
		 border: none;
		 background-color: transparent;
	}

/* 내 정보 부분 스타일 끝  */

/*  구매목록 부분 스타일 */
/* 상세보기 버튼 */
.OrderList {
    position: absolute;
    top: 100;
    right: 0;
    margin-right: 10px;
    margin-top: 10px;
}
/*  구매목록 부분 스타일 끝 */

/*  장바구니 부분 스타일 */
#shoppingbasket {
	position: relative;
	top: 25px;
	left: 25px;
	bottom: 25px;
	width: 1200px;
	height: 520px;
	white-space: nowrap; /* 세로 스크롤 삭제 */
	overflow-x: scroll; /* 가로 스크롤만 생성 */
	padding-left: 5%;
	padding-right: 5%;
	padding-top: 30px;
	padding-bottom: 5px;
	border: 1px solid #ccc; /* 테두리 추가 */
	border-radius: 5px;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	background-color: white;
}

#shoppingbasket::-webkit-scrollbar {
   	 width: 18px; /* 스크롤 바의 너비 */
	}
#shoppingbasket::-webkit-scrollbar-thumb {
		background: linear-gradient(135deg, #7AFF7A, #429F6B);
	    border-radius: 5px; /* 스크롤 바의 둥근 모서리 */
	}

#shoppingbasket::-webkit-scrollbar-track {
   	 	border-radius: 5px;
		background-color: #f7f8fa
	}   



#shoppingbasket2 {
	swiper-theme-color: #007aff;
	swiper-navigation-size: 44px;
	font-family: '맑은 고딕', 'Malgun Gothic', Microsoft NeoGothic,
		AppleGothicNeoSD, 'Apple SD 산돌고딕 Neo', Droid sans, sans-serif;
	font-size: 1.5rem;
	line-height: 1.4;
	color: #555555;
	letter-spacing: -1px;
	text-align: left;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	width: 70%;
	display: flex;
	margin-right: 4%;
	margin-bottom: 20px; /* 각각의 div 간격 띄우기 */
}

#shoppingbasket2>div {
	/* 기존 스타일 속성 */
	flex: 1; /* 추가된 스타일 속성 */
}

#shoppingbasket_info { -
	-swiper-theme-color: #007aff; -
	-swiper-navigation-size: 44px;
	font-family: '맑은 고딕', 'Malgun Gothic', Microsoft NeoGothic,
		AppleGothicNeoSD, 'Apple SD 산돌고딕 Neo', Droid sans, sans-serif;
	font-size: 1.5rem;
	line-height: 1.4;
	color: #555555;
	letter-spacing: -1px;
	text-align: left;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	width: 400px;
	display: inline-block;
	margin-right: 4%;
}

/* 장바구니 부분 스타일 끝*/

/*  달력 부분 스타일 */
	.fc-toolbar-title{
		color: black;
		font-weight: bolder;
	}
	.fc .fc-daygrid-day-number {
    position: relative;
    z-index: 4;
    padding: 4px;
    color: black;
	}
	.fc-daygrid-dot-event .fc-event-title {
    flex-grow: 1;
    flex-shrink: 1;
    min-width: 0;
    overflow: hidden;
    font-weight: bold;
    color: black;
	}
	.fc-direction-ltr .fc-daygrid-event .fc-event-time {
    margin-right: 3px;
    color: black;
	}
	.fc-v-event{
    flex-grow: 1;
    flex-shrink: 1;
    min-height: 0;
    background-color: white;
	}
	.fc-event-title-container {
	background-color: white;
	}
	.fc-v-event .fc-event-time {
    flex-grow: 0;
    flex-shrink: 0;
    max-height: 100%;
    overflow: hidden;
    background-color: white;
    color: black;
	}
	.fc-sticky {
    position: sticky;
    color: black;
    font-weight: bold;
	}
	.fc-daygrid-block-event .fc-event-time, .fc-daygrid-block-event .fc-event-title {
    padding: 1px;
    background-color: white;
    color: black;
    font-weight: bold;
	}
	.fc-col-header {
	background-color: white;
	color: black;
	}
	.fc-timegrid-event-harness-inset .fc-timegrid-event{
    box-shadow: 0px 0px 0px 1px #fff;
    border-color: black;
    box-shadow: 0px 0px 0px 1px #000;
	}
	.fc .fc-timegrid-slot-label-cushion {
    display: inline-block;
    white-space: nowrap;
    color: black;
    font-weight: bold;
	}
	.cal-title{
	font-weight: bold;
	color: black;
	}
/* 달력부분 스타일 끝  */

/* post 부분 */

#full2 {
		margin-top:7%;
		width: 1300px;
		height: auto;
		background-color: white;
		justify-content: center;
	}
	.post {
		width: 1100px;
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
	
		position: relative;
	    border: none;
	    display: inline-block;
	    padding: 15px 30px;
	    border-radius: 15px;
	    font-family: "paybooc-Light", sans-serif;
	    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
		
		background-color: #A0FA78; 
    	color: #1e6b7b;
	
        margin-right: 10px;      /* 오른쪽 여백 설정 */ 
    }
	
	#post-category1:hover, #post-category2:hover {
    background-color: #06f; /* 호버 시 배경색을 #06f(초록)으로 변경 */
    color: #fff; /* 호버 시 텍스트 색상을 #fff(흰색)으로 변경 */
}
	.userxx{
		padding:0 0 30px 30px;
	}
	.dogxx{
		margin-top:20px;
		padding:30px 30px 0 30px;
	}
	
	.modal-input-text{
		border: 0;
		border-radius: 10px;
		box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
		height:50px;
		padding:5px 5px 5px 10px;
	} 
/* post 부분 끝 */



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
    		        
    		     // 이름 필드 검사
    		        var name = $("#name-2").val().trim();
    		        if (name === "") {
    		            alert("이름 칸이 비어있습니다.");
    		            return;
    		        }

    		        // 닉네임 필드 검사
    		        var nickname = $("#nickname-2").val().trim();
    		        if (nickname === "") {
    		            alert("닉네임 칸이 비어있습니다.");
    		            return;
    		        }

    		        // 연락처 필드 검사
    		        var tel = $("#tel-2").val().trim();
    		        if (tel === "") {
    		            alert("연락처 칸이 비어있습니다.");
    		            return;
    		        }

    		       // 이메일 필드 검사
    		       var email1 = $("#Email1-2").val().trim();
    		       var email2 = $("#Email2-2").val().trim();
    		       if (email1 === "" || email2 === "") {
    		           alert("이메일 칸이 비어있습니다.");
    		           return;
    		       }

    		       // 주소 필드 검사
    		       var postcode = $("#sample4_postcode").val().trim();
    		       var roadAddress = $("#sample4_roadAddress").val().trim();
    		      // var jibunAddress = $("#sample4_jibunAddress").val().trim();  //지번은 가끔 빈칸인 지번주소도 있으므로 제외 시킴
    		       
    		       if (postcode === "" || roadAddress === "") {
    		           alert("주소 칸이 비어있습니다.");
    		           return;
    		       }
    		      	
	    		    // 세부주소 필드 검사
	   		        var DetailAddress = $("#DetailAddress_xxx").val().trim();
	   		        if (DetailAddress === "") {
	   		            alert("상세주소 칸이 비어있습니다.");
	   		            return;
	   		        }
    		      
	   		  		//반려견 이름,품종은 안함 
	   		        
    		        
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
	<body class="is-preload">
<jsp:include page = "../common/top.jsp" flush="true"/>
<jsp:include page = "../common/side.jsp" flush="true"/>
		<!-- Header -->
			<div id="header">

				<div class="top">
		
					<!-- Logo -->
<% 
    UsersDTO dto = (UsersDTO) session.getAttribute("User"); 	
	// 삼항연산자를 사용해서 db값이 null 인경우  화면에 빈칸으로 표시되도록 null이 아니면 그 값이 표시되도록  
	String DetailAddress = dto.getDetailAddress() != null ? dto.getDetailAddress() : "";
	int Post 			 = dto.getPost();
	String UserName      = dto.getUserName() != null ? dto.getUserName() : "";
	String UserAlias 	 = dto.getUserAlias() != null ? dto.getUserAlias() : "";
	String PhoneNumber   = dto.getPhoneNumber() != null ? dto.getPhoneNumber() : "";
	String Email1        = dto.getEmail1() != null ? dto.getEmail1() : "";
	String Email2        = dto.getEmail2()!= null ? dto.getEmail2(): "";
	String Password      = dto.getPassword()!=null?dto.getPassword(): "";	
	String RodeAddress   = dto.getRodeAddress()!=null?dto.getRodeAddress(): "";	
	String HouseAddress  = dto.getHouseAddress()!=null?dto.getHouseAddress(): "";	
	String DogName       = dto. getDogName()!=null?dto. getDogName(): "";	
	String DogType       = dto. getDogType()!=null?dto. getDogType(): "";	
	String UserType      = dto.getUserType()!=null?dto.getUserType(): "";	

    byte[] userImgBytes = dto.getUSERIMG();  // 바이트 배열 형태의 이미지 데이터
    String imageSrc = null;
    if(userImgBytes == null){  
    	 imageSrc = "강아지기본이미지" ;  //강아지기본이미지.JPG
    } else {
    	String base64Image = Base64.getEncoder().encodeToString(userImgBytes);
    	 imageSrc = "data:image/jpeg;base64," + base64Image;
    }
%>
						<div id="logo">
							<%-- <span class="image avatar48"><img src="<%= imageSrc %>" alt="" /></span> --%>
							<h1 id="title"><%=UserName%></h1>
							<p>마이페이지</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="#top" id="top-link"><span class="icon solid fa-address-card">내 정보</span></a></li>
								<li><a href="#portfolio" id="portfolio-link"><span class="icon solid fa-calendar-check">달력/산책일지</span></a></li>
								<li><a href="#about" id="about-link"><span class="icon solid fa-shopping-basket">장바구니</span></a></li>
								<li><a href="#contact" id="contact-link"><span class="icon solid fa-shopping-cart">구매목록</span></a></li>
								<li><a href="#post" id="post-link"><span class="icon solid fa-comment">POST</span></a></li>
							</ul>
						</nav>

				</div>

				<div class="bottom">

					<!-- Social Icons -->
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
							<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
						</ul>
				</div>

			</div>

		<!-- Main -->
			<div id="main">

				<!-- 내 정보 -->
		<section id="top" class="two">
			<div id="screenleft-1">
				<div class="circle">
					<%
						if (userImgBytes == null) {
					%>
					<img src="resources/<%=imageSrc%>.JPG" style="width: 350px; height: 350px;" />
					<%
						} else {
					%>
					<img src="<%=imageSrc%>" style="width: 350px; height: 350px;" />
					<%
						}
					%>
					<button>프로필변경</button>
				</div>
				<div class="view">
				<div class="userxx">
					<div class="view_title">회원정보</div>
					<div class="view_text">
						이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							id="name" value="<%=UserName%>" disabled><Br>
						닉네임&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="nickname"
							value="<%=UserAlias%>" disabled><Br> 전화번호&nbsp;<input
							type="text" id="tel" value="<%=PhoneNumber%>" disabled><Br>
						이메일&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="email1"
							value="<%=Email1%>" disabled>@<input type="text"
							id="<%=Email2%>" value="naver.com" disabled><Br>
						주소 &nbsp;&nbsp; <input type="text"
							id="address" value="<%=RodeAddress%>" disabled><Br>
					</div>
				</div>
				<div class="dogxx">
					<div class="view_title">반려견 정보</div>
					<div class="view_text">
						이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							id="dogname" value="<%=DogName%>" disabled> <Br>
						품종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							id="dogbreed" value="<%=DogType%>" disabled> <Br>
					</div>
				</div>
					<!-- ======================= 프로필 변경 모달창 ===========================================  -->
					<div id="userbutton">
						<!-- <input type="button" value="수정"> -->
						<button class="open" id="open">
							<span id="open2">프로필 변경</span>
						</button>
						<div id="modal-box">
							<div id="modal-contents">
								<button id="close"
									style="color: white-space; background-color: red;">닫기&times;</button>
								<h1 id="title" style="font-weight: bold;">내 정보</h1>
								<div id="profil">
									<!-- 이미지 변경 폼 들어갈 부분 -->
									<form id="profil-img-form" action="profil-img" method="post"
										enctype="multipart/form-data">
										<!-- enctype 안적으면 파일 안넘어감  -->
										<div id="profil-img">
											<!-- <img id="preview-img" src="resources/sun.png" alt="sun" style="width: 300px; height: 300px;"><br> -->
											<%
												if (userImgBytes == null) {
											%>
											<img id="preview-img" src="resources/<%=imageSrc%>.JPG"
												alt="profile image" style="width: 300px; height: 300px;"><br>
											<%
												} else {
											%>
											<img id="preview-img" src="<%=imageSrc%>" height="350"
												width="350" /><br>
											<%
												}
											%>
											<input type="file" id="file" value="파일찾기" name="file"><br>
											<div id="button-group">
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
												<p class="user">
													이름: <input class="modal-input-text" type="text" id="name-2" name="UserName"
														value="<%=UserName%>">
												</p>
												<p class="user">
													닉네임:<input class="modal-input-text" type="text" id="nickname-2" name="UserAlias"
														value="<%=UserAlias%>">
												</p>
												<p class="user">
													연락처:<input class="modal-input-text" type="text" id="tel-2" name="PhoneNumber"
														value="<%=PhoneNumber%>" placeholder="'-'을 포함하여 입력하세요.">
												</p>
												<p class="user">
													이메일:<input class="modal-input-text" type="text" id="Email1-2" name="Email1"
														value="<%=Email1%>" placeholder="직접 입력해주세요.">@ <input class="modal-input-text"
														type="text" id="Email2-2" name="Email2"
														value="<%=Email2%>"> <select class="modal-input-text" name="select_email" id= "select_email" onchange="input_email();">
											            <option value="daum.net">daum.net</option>
											            <option value="naver.com">naver.com</option>
											            <option value="google.com">google.com</option>
											        </select>

												</p>
												<p class="user">
													주소: <input class="modal-input-text" type="text" id="sample4_postcode" name="Post"
														value="<%=Post%>" readonly><Br> <input class="modal-input-text"
														type="text" id="sample4_roadAddress" name="RodeAddress"
														value="<%=RodeAddress%>" style="width: 350px;" readonly><Br>
													<input class="modal-input-text" type="text" id="sample4_jibunAddress"
														name="HouseAddress" value="<%=HouseAddress%>"
														style="width: 350px;" readonly><Br> <input class="modal-input-text"
														type="text" id="DetailAddress_xxx" name="DetailAddress"
														value="<%=DetailAddress%>" style="width: 350px;"
														placeholder="상세주소를 입력해주세요."> <input type="button"
														onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
														id="zipcode-button">
												</p>

												<br>
												<!-- ... -->
												<input type="hidden" name="UserID"
													value="<%=dto.getUserID()%>"> <input
													type="hidden" name="Password"
													value="<%=dto.getPassword()%>"> <input
													type="hidden" name="UserType"
													value="<%=dto.getUserType()%>"> <input
													type="hidden" name="USERIMG"
													value="<%=dto.getUSERIMG()%>">
												<!-- ... -->
												<p class="user">반려견 정보</p>
												<p class="user">
													이름:<input class="modal-input-text" type="text" id="dogname" name="DogName"
														value="<%=DogName%>" placeholder="직접 입력해주세요.">
												</p>
												<p class="user">
													품종:<input class="modal-input-text" type="text" id="dogbreed" name="DogType"
														value="<%=DogType%>" placeholder="직접 입력해주세요.">
												</p>
												<input type="button" id="profil-img-change2"
													value="프로필 정보 변경">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- 달력 산책일지 -->
		<section id="portfolio" class="two">
			<div class="container">

				<header>
					<h2 class="cal-title">Walk Log</h2>
				</header>
				<!-- 달력 부분 -->
				<div id="Calendarxxx">
					<jsp:include page = "../mypage/calendar.jsp" flush="true"/>
					 <div id='calendar'></div>
				</div>
				<!-- 달력 끝 -->
			</div>
		</section>

		<!-- 장바구니 -->
		<section id="about" class="three">
			<div class="container">

				<header>
					<h2>장바구니</h2>
				</header>
				<!-- 장바구니 시작 -->
				<div id="shoppingbasket">
					<%
						//장바구니  정보 가져와야함 

						List<CartDTO> list = (List<CartDTO>) request.getAttribute("list");
						for (int i = 0; i < list.size(); i++) {
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
					<div id="shoppingbasket2">
						<div>
							<img src="resources/storeimages/<%=Image%>.jpg" border="0"
								width="400px" height="400px;" style="float: left; border-radius: 10px;"
								id="image<%=i%>" />
						</div>
						<div class="shoppingbasket_info">
							<table style="width: 35%; height: 400px;">
								<colgroup>
									<col style="width: 35%; height: 400px;">
									<col style="width: 65%; height: 400px;">
								</colgroup>

								<tr>
									<th>이름</th>
									<td><%=ProductName%></td>
								</tr>
								<tr>
									<th>사이즈</th>
									<td><%=Psize%></td>
								</tr>
								<tr>
									<th>색상</th>
									<td><%=Color%></td>
								</tr>
								<tr>
									<th>수량</th>
									<td><%=Amount%></td>
								</tr>
								<tr>
									<th>가격</th>
									<td><%=Price%></td>
								</tr>

							</table>
						</div>



					</div>
					<%
						}
					%>
				</div>
				<!-- 장바구니 끝 -->

			</div>
		</section>

		<!-- 구매목록 -->
		<section id="contact" class="four">
			<div class="container">

				<header>
					<h2>구매목록</h2> 
					<a href="/app/orderList"><button class="OrderList" style="background-color: #A0FA78;">상세보기</button></a>
				</header>
				<!-- 주문list 시작 -->
				<div id="shoppingbasket">
					<%
						List<CartDTO> orderlist_after = (List<CartDTO>) request.getAttribute("list3");
						for (int i = 0; i < orderlist_after.size(); i++) {
							CartDTO cart = orderlist_after.get(i);
							if ("after".equals(cart.getOrderState())) { // OrderState가 "after"인 경우에만 실행
								int num = cart.getCartNum();
								String UserID = cart.getUserID();
								int ProductID = cart.getProductID();
								String ProductName = cart.getProductName();
								int Price = cart.getPrice();
								String Psize = cart.getPsize();
								String Color = cart.getColor();
								int Amount = cart.getAmount();
								String Image = cart.getImage();
					%>
				<div id="shoppingbasket2">
						<div>
							<img src="resources/storeimages/<%=Image%>.jpg" border="0"
								width="400px" height="400px;" style="float: left; border-radius: 10px;"
								id="image<%=i%>" />
						</div>
						<div class="shoppingbasket_info">
							<table style="width: 35%; height: 400px;" >
								<colgroup>
									<col style="width: 35%; height: 400px;">
									<col style="width: 65%; height: 400px;">
								</colgroup>

								<tr>
									<th>이름</th>
									<td><%=ProductName%></td>
								</tr>
								<tr>
									<th>사이즈</th>
									<td><%=Psize%></td>
								</tr>
								<tr>
									<th>색상</th>
									<td><%=Color%></td>
								</tr>
								<tr>
									<th>수량</th>
									<td><%=Amount%></td>
								</tr>
								<tr>
									<th>가격</th>
									<td><%=Price%></td>
								</tr>

							</table>
						</div>



					</div>
					<%
							}
						}
					%>

				</div>
				<!-- 주문list 끝 -->

			</div>
		</section>
		
		<!-- post 부분 -->
		<section id="post" class="two">
			<div class="container">

				<header>
					<h2>post</h2>
				</header>
				<!-- post 부분 -->
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
    LocalDateTime sysdate = LocalDateTime.now();
    List<PostsDTO> post = pDTO.getList();
    if (post != null && !post.isEmpty()) {
    for(int i=1;i<=post.size();i++){ 
    	/* 만약 메인에서 포스트가 안불러와진다면 PostMapper.popular에서 INTERVAL 옵션이 있는데, 몇일 전 올린 게시물만 띄울 지 조정가능*/
    	PostsDTO dto2 = post.get(i-1);
    	int postid=dto2.getPostID();
    	String authorid=dto2.getAuthorID();
    	String title=dto2.getTitle();
    	String post_content=dto2.getContent();
    	String textOnly =  post_content.replaceAll("<[^>]+>", "");
    	String previewText = textOnly.substring(0, Math.min(textOnly.length(), 50)) + (textOnly.length() > 50 ? "..." : "");
    	int likes = dto2.getLikes();
   		String category= dto2.getCategory();
   		String postimage=dto2.getImage();
   		String CreationTime = dto2.getCreationTime();
   		String defaultimage="resources/default.png";
   	/* 	LocalDateTime creationtime = dto.getCreationtime();
   		Duration durationtime = Duration.between(creationtime,sysdate);
   		long differenceInHours=durationtime.toHours(); */
   		Pattern pattern = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");
        Matcher matcher = pattern.matcher(post_content);
        if (matcher.find()) {
            postimage = matcher.group(1);
     }
   		if (postimage==null) postimage=defaultimage;
 %>
    <div class="container" style="margin-left: 5%; margin-right: 5%;">
        <section class="posts">
            <div class="post">
                <img src="<%=postimage%>" id="게시물 1" class="post-img">
                <div class="post-content">
                    <h3><%=title %></h3><!-- 타이틀 -->
                    <p><%=previewText %></p><!-- 내용 -->
                    <div class="post-info">
                        <div class="post-meta">
                            <span class="like">좋아요❤️<%=likes%><span id="Like"></span></span>
                            <span class="comment">댓글<span id="Comment"></span></span>
                        </div>
                        <span class="post-time"><%=CreationTime %></span> <!-- 시간 표시 태그 -->
                    </div>
                </div>
            </div>
        </section>
    </div>
<% } }%>
    <br>

<div class="page">
<jsp:include page = "../common/page.jsp" flush="true"/><br>
</div>
</div> <!-- full2 끝 --> 
				<!-- post 끝 -->
			</div>
		</section>
		
		

	</div>

		<!-- Footer -->
			<!-- <div id="footer"> -->

			<!-- </div> -->

<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="resources/assets/js/browser.min.js"></script>
			<script src="resources/assets/js/breakpoints.min.js"></script>
			<script src="resources/assets/js/util.js"></script>
			<script src="resources/assets/js/main.js"></script>
			
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
        	document.getElementById("Email2-2").value=document.getElementById("select_email").value; 
        }
</script>
</body>
</html>