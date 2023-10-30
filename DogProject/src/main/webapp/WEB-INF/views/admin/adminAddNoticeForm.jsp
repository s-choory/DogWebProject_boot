<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 추가</title>
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
<h1 style="margin-top:20px; text-align: center;"> 공지 추가 </h1>
<form action="adminAddNotice" method="get">
<input type="text" name="Title" placeholder="제목"><br><br>
<input type="text" name="Content" placeholder="내용" class="content"><br><br>
<button type="submit">공지 추가하기</button><br><br>
</form>
</body>
</html>