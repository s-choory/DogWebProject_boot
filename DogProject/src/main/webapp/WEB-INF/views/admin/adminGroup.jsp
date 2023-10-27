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
		width:100px;
	}

</style>
</head>
<!-- 부트스트랩 코드 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript">

function openChatMessage(roomId) {
	var w = 1000;
	var h = 800;
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	var yPos = (document.body.offsetHeight/2) - (h/2);
	
 	window.open("adminChatMessage?roomId="+roomId, "_blank", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}

function deleteChatroom(roomId) {
	if (confirm("정말 "+roomId+"번방을 삭제하겠습니까?") == true) {
		location.href="adminDeleteGroup?roomId="+roomId;
	}
}

</script>
<body>
    <header>
        <h1 style="text-align: center; margin: 30px 0; ">모임 방 목록</h1>
    </header>
    <div style="text-align: center; margin-bottom: 30px;">
    	<a href="adminPage" >관리자페이지</a><br>
	</div>
    <div class="table-container">
    <table class="table">
    	<tr class="table-primary" style="font-weight: bolder;">
    		<td>방 ID</td>
    		<td>방 이름</td>
    		<td>최대 유저 수</td>
    		<td>방 비밀번호</td>
    		<td>action</td>
    		<td>action</td>
    	</tr>
    	<% List<ChatRoomDTO> list = (List<ChatRoomDTO>)request.getAttribute("chatList"); 
    		for(int i = 0; i<list.size(); i++){
    		ChatRoomDTO cDTO = list.get(i);
    		String roomPW = cDTO.getRoomPwd();
    		if(roomPW == null){
    			roomPW = "[비번없음]";
    		}
    	%>
    	<tr class="table-light">
    		<td><%= cDTO.getRoomId() %></td>
    		<td><%= cDTO.getRoomName() %></td>
    		<td><%= cDTO.getMaxUserCnt() %></td>
    		<td><%= roomPW %></td>
    		<td class="action"><button class="btn btn-primary" onclick="openChatMessage(<%=cDTO.getRoomId()%>)">채팅 내역 보기</button></td>
    		<td class="action2"><button class="btn btn-danger" onclick="deleteChatroom(<%=cDTO.getRoomId()%>)">방 삭제</button></td>
    	</tr>
    	<%} %>
    </table>
    </div>

</body>
</html>