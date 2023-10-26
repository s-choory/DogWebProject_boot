<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css2/MI.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  var chatWindow = $("#chat-window");
  var inputBox = $("#input-box");

  // 메시지 추가 버튼 클릭 시 새 메시지 추가
  $("#send-button").click(function() {
    var user = $("#user_id").val();
    var message = inputBox.val();

    $.ajax({
		url: "test_page2.php",
		type: "post",
		dataType: "json",
		data: { user: user, message: message },
		success: function(response) {
			console.log(response);
			if (response && response.length) {
				chatWindow.empty();
				for (var i = response.length - 1; i >= 0; i--) {
					var messageDiv = $("<div></div>").html("<strong>" + response[i].user + "</strong>: " + response[i].message);
					chatWindow.append(messageDiv);
				}
			}
		},
	  error: function(xhr, status, error) {
		console.log(xhr.responseText);
	  }
	});

	$("#input-box").val("");
  });

//   // 일정 시간마다 새로운 메시지 가져오기
//   setInterval(function() {
//     // AJAX 요청
//     $.ajax({
//       url: "test_page2.php",
//       type: "GET",
//       success: function(response) {
//         var messages = JSON.parse(response);
//         chatWindow.empty();
//         for (var i = messages.length - 1; i >= 0; i--) {
//           var messageDiv = $("<div></div>");
//           messageDiv.html("<strong>" + messages[i].user + "</strong>: " + messages[i].message);
//           chatWindow.append(messageDiv);
//         }
//       }
//     });
//   }, 1000);
// });

</script>
<title>Insert title here</title>
</head>
<body>
<div class="MI_Top_center">
 	<ul class="MI_Top_3">동네 설정</ul>
  	<ul class="MI_Top_1">경로 설정</ul>
</div>
<div id="chat-window"></div>
  <input type="text" id="user_id" class="input-box" style="width:110px;" placeholder="닉네임">
  <input id="input-box" class="input-box" type="text">
  <button id="send-button">전송</button>


<div class="MI_Top_center">
 	<ul class="MI_Top_1">모임 생성</ul>
  	<ul class="MI_Top_3">모임 찾기</ul>
</div>


<div class="MI_Bottom_center1">
<%
for(int i=1;i<=10;i++){
	int classnum = i%2;
%>
<div class="MI_Botton_list">
	<ul class="MI_Botton_ul1">
		<li class="MI_Botton_ul1-1">
			<img alt="모임이미지" src="resources/img/a.jpg" width="150px" height="150px">
		</li>
	</ul>
	<ul class="MI_Botton_ul2">
		<li class="MI_Botton_li1">모임 제목</li>
		<li class="MI_Botton_li2">모임 슬로건</li>
		<li class="MI_Botton_li2">모임 태그</li>
		<li class="MI_Botton_li3">모임 지역</li>
		<li class="MI_Botton_li4">모임 인원수</li>
	</ul>
</div>
<% } %>
</div>
</body>
</html>