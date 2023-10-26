<%@page import="java.util.*"%>
<%@page import="com.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>고객센터/문의하기</title>
<link rel="stylesheet" href="resources/css2/CC.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	$(".back").click(function(){
		window.location.href="/app/ContactCenter_Notice";

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
	
</style>
</head>
<body>
<div class="ContactCenter_Top">
	<div class="ContactCenter_Top_Name" align="center">고객센터</div>
	<table class="ContactCenter_Choice_Table">
		<tr>
			<td/>
			<td rowspan="2" class="ContactCenter_Choice_Yes" id="Notice">공지사항</td>
			<td rowspan="2" class="ContactCenter_Choice_No" id="FAQ"><a href="ContactCenter_FAQ">FAQ</a></td>
			<td/>
		</tr>
		<tr>
			<td class="ContactCenter_Choice_Side"/>
			<td class="ContactCenter_Choice_Side"/>
		</tr>
	</table>
</div>
<div class="ContactCenter_Notice">
	<form action="readForm" method="post">
		<input type="hidden" id="NoticeID" name="NoticeID" value="${read.noticeID}">
		<input type="hidden" id="page" name="page" value="${pnDTO.curPage}">
		  

	</form>

	<h2>${read.noticeID}번 게시물</h2>
	<table class="ContactCenter_Notice_Table">
		<tr>
			<td class="ContactCenter_Notice_Top_Count">게시물 번호입니다 == ${read.noticeID}</td>
			<td class="ContactCenter_Notice_Top_Name">제목입니다 ===== ${read.title}</td>
			
		</tr>
		<tr>
			<td class="ContactCenter_Notice_Top_Uploaddate">작성일자 입니다 ====== ${read.creationTime}</td>
			<td class="ContactCenter_Notice_Top_Count">조회수 입니다 ====== ${read.hit}</td>
		</tr>
	
    <tr class="tt">
    	<td class="ContactCenter_Notice_Top_Writer">글</td>
        <td class="ContactCenter_Notice_Bottom_Center">글입니다 ==== ${read.content}</td>
 
    </tr>

	</table>
	
	<button type="button" id="listbtn" class="listbtn">이전 페이지가 적용된 목록으로</button>
</div>
</body>
</html>
