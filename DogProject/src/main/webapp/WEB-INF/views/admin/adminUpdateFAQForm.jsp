<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
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
<% String FaqID = (String)request.getParameter("FaqID"); %>
<h1 style="margin-top:20px; text-align: center;"> <%= FaqID %>번 FAQ 수정 </h1>
<form action="adminUpdateFAQ" method="get">
<input type="hidden" name="FaqID" value="<%= FaqID %>">
<input type="text" name="Title" placeholder="제목"><br><br>
<input type="text" name="Content" placeholder="내용" class="content"><br><br>
<button type="submit">수정하기</button><br><br>
</form>
</body>
</html>