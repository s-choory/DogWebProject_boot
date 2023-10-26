<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>모임생성</h1>

<form action="" method="get">
	모임 제목:<input type="text" name = "title" placeholder="제목을 입력하세요"><br>
	모임 내용:<input type="text" name = "desciption" style="width: 40%" placeholder="내용을 입력하세요"><br>
	시작 시간:<input type="text" name = "startTime" placeholder="ex) 12:00"><br>
	종료 시간:<input type="text" name = "endTime" placeholder="ex) 14:00"><br>
	참가자 수:<input type="text" name = "maxParticipants" placeholder="ex) 3명"><br>
<input type="submit" value="생성하기">
</form>
</body>
</html>