<%@page import="java.util.*"%>
<%@page import="com.example.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>고객센터/문의하기</title>
<!-- <link rel="stylesheet" href="resources/css2/CC.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	$(".back").click(function(){
		window.location.href="/test/ContactCenter_Notice";

	});
});
 
$(function() {
	$("#listbtn").click(function() {
		var listurl = "ContactCenter_Notice?curPage=${pnDTO.curPage}&search=&order=";
		location.href = listurl;
		
	});	
}); 

	
</script>
<style type="text/css">
body{
	margin: 0;
	font-family: 'Exo', sans-serif;
}

	h1 {
    line-height: 38px;
    font-size: 38px;
    letter-spacing: -1px;
    text-shadow: 0 0 2px rgba(0,0,0,.1);
    font-weight: 700;
    color: var(--color-text1);
    text-align: center;
}
	h2 {
    line-height: 38px;
    font-size: 38px;
    letter-spacing: -1px;
    text-shadow: 0 0 2px rgba(0,0,0,.1);
    font-weight: 700;
    color: var(--color-text1);
    text-align: center;
  
}
 .NoticeDetail_detail_top__3e1t0 {
    position: relative;
    padding: 70px 0 29px 35px;
 	text-align: center;
   	border-bottom-width: 10px;
   	border: inherit;
  	/* height:300px;
  	width: 500px; */
  	margin: 40px 250px 40px 250px; 
  /* 	border-bottom: 3px solid rgba(34,34,34,.1);  */
} 


#NoticeTitle{
  position: absolute;
  font-size:35px;
  top:6px;
  left:40px;
  /*  right: 0px; */ 
  /* bottom: 0px;  */
}
#NoticeTime{
  position: absolute;
  top:30px;
  left:70px;
  
}
#NoticeHit{
  position: absolute;
/*   top:25px; */
 
  right:3px;
 
}
#NoticeWriter{
  position: absolute;
  top:8px;
  left:70px;
}
#NoticePicture{
  position: absolute;
  top:8px;
  left:12.5px;
}
#div6{

  position: relative;
  padding: 30px 0 29px 35px;
  text-align: center;
  border-bottom-width: 10px;
  border:inherit;
  border-bottom: inherit;
  	/* height:300px;
  	width: 500px; */
}


 .NoticeDetail_detail_top__3e1t1 {
    position: relative;
    padding: 35px 0 29px 35px;
   	border-bottom-width: 10px;
   	border: none;
  	/* height:300px;
  	width: 500px; */
  	margin: 40px 250px 40px 250px;  
} 

.listbtn{
	background-color: transparent;
	border-style:solid;
	border-radius:10px;
	font-size: 25px;
	position: absolute;
    right: 0;
    bottom: 0;
}

 .ContactCenter_Notice_Bottom_Center {
	top: 100px;
	bottom: 100px;

} 


hr .hr{
	border-bottom: 10px solid rgba(34,34,34,.1); 
	border: none;
}


</style>
</head>
<body>

<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>


<div class="ContactCenter_Notice">
	<form action="readForm" method="post">
		<input type="hidden" id="NoticeID" name="NoticeID" value="${read.noticeID}">
		<input type="hidden" id="page" name="page" value="${pnDTO.curPage}">
	</form>

	<h1>공지사항</h1>
	<div class="ContactCenter_Notice_Top_Count">게시물 번호입니다 == ${read.noticeID}</div>
		
		<div class="NoticeDetail_detail_top__3e1t0">
			<div id="NoticeTitle" class="ContactCenter_Notice_Top_Name">[공지사항]제목입니다 ===== ${read.title}</div>
			<div id="div6">
			<div id="NoticeWriter">운영자</div>
			<div id="NoticePicture"><img src="resources/네이버아이콘.png" alt="운영자 사진" width="45" height="45"></div>
			<div id="NoticeTime" class="ContactCenter_Notice_Top_Uploaddate">${read.creationTime}</div>
			<div id="NoticeHit" class="ContactCenter_Notice_Top_Count">조회수 입니다 ====== ${read.hit}</div>
			</div>
			<hr class="hr"> 
		</div>

	
	<div class="NoticeDetail_detail_top__3e1t1">
     <div class="ContactCenter_Notice_Bottom_Center">글입니다 ==== ${read.content}</div>
     </div>

	<div class="NoticeDetail_detail_top__3e1t1">
	<button type="button" id="listbtn" class="listbtn">이전 페이지가 적용된 목록으로</button>
	</div>
	
</div>


<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</body>
</html>

