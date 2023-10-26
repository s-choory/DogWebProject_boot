<%@page import="com.example.dto.RequestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 조회</title>
<style type="text/css">
	
	.content{
		width:500px;
	}
	
	.table-container{
		margin-left: 20%;
		margin-right: 20%;
	}

</style>
</head>
<!-- 부트스트랩 코드 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<body>
    <header>
        <h1>문의 목록</h1>
    </header>
    <div class="table-container">
    <table class="table">
    	<tr class="table-success">
    		<td>문의번호</td>
    		<td>카테고리</td>
    		<td>태그</td>
    		<td>유저ID</td>
    		<td>내용</td>
    		<td>답변상태</td>
    	</tr>
    	<% List<RequestDTO> list = (List<RequestDTO>)request.getAttribute("rList"); 
    		for(int i = 0; i<list.size(); i++){
    		RequestDTO rDTO = list.get(i);
    	%>
    	<tr class="table-light">
    		<td><%= rDTO.getCount() %></td>
    		<td><%= rDTO.getCategory() %></td>
    		<td><%= rDTO.getTag() %></td>
    		<td><%= rDTO.getUserid() %></td>
    		<td class="content"><%= rDTO.getContent() %></td>
    		<td><%= rDTO.getRequeststate() %></td>
    	</tr>
    	<%} %>
    </table>
    </div>
    <a href="#">문의 답변 완료 목록</a>

</body>
</html>