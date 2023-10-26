<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.center-container {
		margin-top: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
	
	.input-textbox{
		width:500px;
		height:100px;
    	word-wrap: break-word; /* 긴 단어 또는 URL이 너비를 벗어날 때 줄 바꿈 */
	}
	


</style>
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<body>
<h1 style="margin-top:20px; margin-bottom: 100px; text-align: center;"> 답변 입력 </h1>
<form action="adminRequestResponseConfirm">
	<input type="hidden" name="requestid" value="<%=request.getParameter("requestid") %>">
	<input type="text" name="recontent" class="input-textbox"><br>
	<div class="center-container">
		<button type="submit" class="btn btn-primary btn-sm">완료</button>
	</div>
</form>
</body>
</html>