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
<script type="text/javascript">

function openRequest(requestid) {
	var w = 500;
	var h = 400;
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	var yPos = (document.body.offsetHeight/2) - (h/2);
	
 	window.open("adminRequestResponse?requestid="+requestid, "_blank", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}

</script>
<body>
    <header>
        <h1 style="text-align: center; margin: 30px 0; ">문의 답변 대기 목록</h1>
    </header>
    <div style="text-align: center; margin-bottom: 30px;">
    	<a href="adminPage" >관리자페이지로 이동</a><br><br>
    	<a href="adminRequest2" >문의 답변 완료 목록</a>
	</div>
    <div class="table-container">
    <table class="table">
    	<tr class="table-success" style="font-weight: bolder;">
    		<td>문의번호</td>
    		<td>카테고리</td>
    		<td>태그</td>
    		<td>유저ID</td>
    		<td>내용</td>
    		<td>답변상태</td>
    		<td>action</td>
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
    		<td><button class="btn btn-success" onclick="openRequest(<%=rDTO.getRequestid()%>)">답변</button></td>
    	</tr>
    	<%} %>
    </table>
    </div>

</body>
</html>