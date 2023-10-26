<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

	a{
		text-decoration: none;
		color:#54595F;
	}
	
    .footer {
        padding: 5px;
        background-color: #E4E4E4;
        color: #54595F;
        font-size: 16px;
        flex-wrap: wrap;
    }
    
    .footer-topcontainer{
    	margin-top:20px;
    	margin-left:10%;
    	margin-right:10%;
    	display: flex;
    }
    
    .footer-container1{
    
    }
    
    .footer-container1-1{
    	margin-top:30px;
    }
	
    .footer-container2{
    	margin-top:20px;
		margin-left:52%;
		flex-grow;
    }
    
    .footer-middlecontainer{
    	margin-top:30px;
    	margin-bottom:30px;
   		margin-left:10%;
   		margin-right:10%;
    	font-size: 18px;
    	font-weight: bolder;
    }
    
    .footer-bottomcontainer{
    	margin-left:10%;
    	margin-right:10%;
    	margin-bottom: 10px;
    	display: flex;
    }
    
    .footer-container3{
    }
    
	.footer-container4{
    	margin-left:50%;
    	margin-top:100px;
		justify-content: flex-end;
	}
</style>
<footer class="footer">

<div class="footer-topcontainer">
	<div class="footer-container1">
		<a href="/app/">도기도기 홈</a><br>
		<a href="community">도기도기 커뮤니티</a><br>
		<a href="dogshop_main">도기도기 샵</a><br>
		<div class="footer-container1-1">
		이용약관	&nbsp; 개인정보처리방침	&nbsp;	사업자정보확인	&nbsp;   
		</div>
		공지/문의
	</div>
	<div class="footer-container2">
		<img src="${pageContext.request.contextPath}/resources/로고아이콘.png" width=140 height=115>
	</div>
</div>

<div class="footer-middlecontainer">
	
	Follow Us &nbsp;&nbsp;
	<a href="https://www.instagram.com/acorn7979/"><img src="${pageContext.request.contextPath}/resources/인스타아이콘.png" width=25 height=25></a>&nbsp;&nbsp;&nbsp;
	<a href="https://blog.naver.com/acornedu"><img src="${pageContext.request.contextPath}/resources/네이버아이콘.png" width=25 height=25></a>&nbsp;&nbsp;&nbsp;
	<a href="https://www.facebook.com/acornaca/"><img src="${pageContext.request.contextPath}/resources/페이스북아이콘.png" width=25 height=25></a>

</div>

<div class="footer-bottomcontainer">
	<div class="footer-container3">
		도기도기 주식회사 | 대표 김선동<br>
		서울특별시 강남구 테헤란로 124 5층 501호<br>
		통신판매업신고번호: 2023-서울강남-06234<br>
		사업자등록번호: 123-45-78900<br>
		호스팅: Amazon Web Services<br>
	</div>
	<div class="footer-container4">
		© 2023 All Rights Reserved 
	</div>
</div>
</footer>