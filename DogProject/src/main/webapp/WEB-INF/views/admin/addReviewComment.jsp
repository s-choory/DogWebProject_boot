<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
<style type="text/css">
	
	input{
		width: 450px;
	}
	
	.content{
		height:150px;
	}
</style>
</head>
<body style="text-align: center;">
<% String ReviewID = (String)request.getParameter("ReviewID"); %>
<h1 style="margin-top:20px; text-align: center;"> <%= ReviewID %>번 댓글의 답글입력</h1>
<form action="adminAddReviewComment" method="get">
<input type="hidden" name="ReviewID" value="<%= ReviewID %>">
<input type="text" name="rComment" value="소중한 리뷰 감사합니다. 고객님의 솔직한 리뷰를 감사히 받았습니다. 고객님의 의견을 토대로 제품/서비스를 개선하겠습니다." class="content"><br><br>
<button type="submit">답글 달기</button><br><br>
</form>
</body>
</html>