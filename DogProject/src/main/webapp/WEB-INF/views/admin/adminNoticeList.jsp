<%@page import="com.example.dto.NoticeDTO"%>
<%@page import="com.example.dto.GoodsDTO"%>
<%@page import="com.example.dto.ChatRoomDTO"%>
<%@page import="com.example.dto.RequestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 조회</title>
<style type="text/css">
	
	.table-container{
		margin-left: 20%;
		margin-right: 20%;
	}
	.action{
		width:150px;
	}
	.action2{
		width:80px;
	}

</style>
</head>
<!-- 부트스트랩 코드 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript">

function openAddNotice() {
	var w = 500;
	var h = 400;
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	var yPos = (document.body.offsetHeight/2) - (h/2);
	
 	window.open("adminAddNoticeForm", "_blank", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}

function openUpdateNotice(NoticeID) {
	var w = 500;
	var h = 400;
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	var yPos = (document.body.offsetHeight/2) - (h/2);
	
 	window.open("adminUpdateNoticeForm?NoticeID="+NoticeID, "_blank", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}
function deleteNotice(NoticeID) {
	if (confirm("정말 "+NoticeID+"번 공지를 삭제하겠습니까?") == true) {
		location.href="adminDeleteNotice?NoticeID="+NoticeID;
	}
}

</script>
<body>
    <header>
        <h1 style="text-align: center; margin: 30px 0; ">공지 목록</h1>
    </header>
    <div style="text-align: center; margin-bottom: 30px;">
    	<a href="adminPage" >관리자페이지로 이동</a><br><br>
	<button class="btn btn-success" onclick="openAddNotice()">공지 추가하기</button>
	</div>
    <div class="table-container">
    <table class="table">
    	<tr class="table-dark" style="font-weight: bolder;">
    		<td>ID</td>
    		<td>제목</td>
    		<td>내용</td>
    		<td>생성날짜</td>
    		<td>조회수</td>
    		<td>action</td>
    		<td>action</td>
    	</tr>
    	<% 
    	List<NoticeDTO> list = (List<NoticeDTO>)request.getAttribute("nList"); 
    		for(int i = 0; i<list.size(); i++){
    			NoticeDTO nDTO = list.get(i);
    	%>
    	<tr class="table-light">
    		<td><%= nDTO.getNoticeID() %></td>
    		<td><%= nDTO.getTitle() %></td>
    		<td style="width: 500px;"><%= nDTO.getContent() %></td>
    		<td><%= nDTO.getCreationTime() %></td>
    		<td><%= nDTO.getHit() %></td>
    		<td class="action2"><button class="btn btn-primary" onclick="openUpdateNotice(<%=nDTO.getNoticeID()%>)">수정</button></td>
    		<td class="action2"><button class="btn btn-danger" onclick="deleteNotice(<%=nDTO.getNoticeID()%>)">삭제</button></td>
    	</tr>
    	<%} %>
    </table>
    </div>

</body>
</html>