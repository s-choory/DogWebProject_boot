<%@page import="com.example.dto.FAQDTO"%>
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
<title>FAQ 목록</title>
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

function openUpdateFAQ(FaqID) {
	var w = 500;
	var h = 400;
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	var yPos = (document.body.offsetHeight/2) - (h/2);
	
 	window.open("adminUpdateFAQForm?FaqID="+FaqID, "_blank", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}

function openAddFAQ() {
	var w = 500;
	var h = 400;
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	var yPos = (document.body.offsetHeight/2) - (h/2);
	
 	window.open("adminAddFAQForm", "_blank", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}


function deleteFAQ(FaqID) {
	if (confirm("정말 "+FaqID+"번 공지를 삭제하겠습니까?") == true) {
		location.href="adminDeleteFAQ?FaqID="+FaqID;
	}
}

</script>
<body>
    <header>
        <h1 style="text-align: center; margin: 30px 0; ">FAQ 목록</h1>
    </header>
    <div style="text-align: center; margin-bottom: 30px;">
    	<a href="adminPage" >관리자페이지로 이동</a><br><br>
    	<a href="adminNoticeList" >공지 목록으로 이동</a><br><br>
	<button class="btn btn-success" onclick="openAddFAQ()">FAQ 추가하기</button>
	</div>
    <div class="table-container">
    <table class="table">
    	<tr class="table-dark" style="font-weight: bolder;">
    		<td>ID</td>
    		<td>제목</td>
    		<td>내용</td>
    		<td>action</td>
    		<td>action</td>
    	</tr>
    	<% 
    	List<FAQDTO> list = (List<FAQDTO>)request.getAttribute("nList"); 
    		for(int i = 0; i<list.size(); i++){
    			FAQDTO fDTO = list.get(i);
    	%>
    	<tr class="table-light">
    		<td><%= fDTO.getFaqID() %></td>
    		<td><%= fDTO.getTitle() %></td>
    		<td style="width: 500px;"><%= fDTO.getContent() %></td>
    		<td class="action2"><button class="btn btn-primary" onclick="openUpdateFAQ(<%=fDTO.getFaqID()%>)">수정</button></td>
    		<td class="action2"><button class="btn btn-danger" onclick="deleteFAQ(<%=fDTO.getFaqID()%>)">삭제</button></td>
    	</tr>
    	<%} %>
    </table>
    </div>

</body>
</html>