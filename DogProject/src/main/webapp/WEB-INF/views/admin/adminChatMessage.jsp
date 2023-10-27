<%@page import="com.example.dto.ChatMessageDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.input-textbox{
		width:500px;
		height:100px;
    	word-wrap: break-word; /* 긴 단어 또는 URL이 너비를 벗어날 때 줄 바꿈 */
	}
	.table-container{
		margin-left: 20%;
		margin-right: 20%;
	}
	
	.time {
		width: 170px;
	}
	.content{
		width:300px;
	}

</style>
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<body>
<%List<ChatMessageDTO> list = (List<ChatMessageDTO>)request.getAttribute("mList");  %>
<h1 style="margin-top:20px; text-align: center;"> <%= list.get(0).getRoomId() %>번방 채팅 내역</h1>

    <div class="table-container table-bordered">
    <table class="table">
    	<tr class="table-primary" style="font-weight: bolder;">
    		<td>작성자</td>
    		<td>내용</td>
    		<td>시간</td>
    	</tr>
    	<% 
    		for(int i = 0; i<list.size(); i++){
   			ChatMessageDTO mDTO = list.get(i);
    	%>
    	<tr class="table-light">
    		<td><%= mDTO.getSender() %></td>
    		<td class="content"><%= mDTO.getMessage() %></td>
    		<td class="time"><%= mDTO.getSendDate() %></td>
    	</tr>
    	<%} %>
    </table>
    </div>
</body>
</html>