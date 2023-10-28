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
		height:300px;
	}
</style>
</head>
<body style="text-align: center;">
<% String NoticeID = (String)request.getParameter("NoticeID"); %>
<h1 style="margin-top:20px; text-align: center;"> <%= NoticeID %>번 공지 수정 </h1>
<form action="adminUpdateNotice" method="get">
<input type="hidden" name="NoticeID" value="<%= NoticeID %>">
<input type="text" name="Title" placeholder="제목"><br><br>
<input type="text" name="Content" placeholder="내용" class="content"><br><br>
<button type="submit">공지 수정하기</button><br><br>
</form>
</body>
</html>