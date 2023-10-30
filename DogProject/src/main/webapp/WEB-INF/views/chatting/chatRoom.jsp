<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
	<% int roomId = (int)request.getAttribute("roomId"); %>
	let roomId = <%= roomId %>;
	let stompClient = null;
	
	//웹소켓 연결
	function connect() {
	    var socket = new SockJS('http://localhost:8097/app/stomp');
	    stompClient = Stomp.over(socket);
	    stompClient.connect({}, function (frame) {
	        stompClient.subscribe('/room/'+roomId, function (chatMessage) {
	        	//화면에 출력할 메시지를 함수에 전달
	        	showChat(JSON.parse(chatMessage.body));
	        });
	    });
	}

    //소켓연결 해제
    function disconnect() {
        if (stompClient != null) {
            stompClient.disconnect();
        }
    }
    
    //전송버튼 동작부, 채팅메시지 정보 서버에 전달
    function messageSend() {
        stompClient.send("/send/"+roomId, {},
            JSON.stringify({
                'sender' : $("#nickName").val(),
                'message' : $("#message").val()
            }));
        //전송 후 입력란 초기화
        $('#message').val('');
    }
    
	//보낸채팅 보기
	function showChat(chatMessage) {
	    $("#chatArea").append(
   			"[" + chatMessage.sender + "]" + chatMessage.message + "<br>"
   			);
	}
    
    //입장버튼 동작부, div 감추기 (대화명값이 있다면 전송/퇴장 버튼활성화)
	function attend(){
		var nickName = $("#nickName").val();
		if(nickName == null || nickName.trim() == ""){
			Swal.fire('경고', '대화명을 입력해주세요.', 'warning');
			$("#nickName").focus();
		}else{
			connect();
			$("#inputName").hide();
			$("#inputMsg").show();
			$("#message").focus();
		}
	}
    
    //퇴장버튼 동작부, div 감추기
    function absent() {
		disconnect();
		$("#inputMsg").hide();
		$("#inputName").show();
	}
    
$(function() {
	//입장, 엔터키감지 동작
	$('#nickName').keypress(function(e) {
		var keycode = event.keyCode ? event.keyCode : event.whict;
		if(keycode == 13) attend();
		event.stopPropagation();
	});
	
	//전송, 엔터키감지 동작
	$('#message').keypress(function(e) {
		var keycode = event.keyCode ? event.keyCode : event.whict;
		if(keycode == 13) messageSend();
		event.stopPropagation();
	});
});
    
</script>
<style type="text/css">
#inputMsg{
	display: none;
}
	
#dialogContainer {
	max-width: 750px;
	margin-top: 30px;
	padding: 7px 30px 30px 30px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

#chatArea{
	height: 300px;
	overflow: auto;
}

</style>
<title>Title</title>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<div class="container">
	<div class="container" id="dialogContainer">
		<!-- chat-header -->
		<!-- mt-5 mb-2 p-1 -->
		<div class="row mt-5 mb-2 p-1">
			<div class="col ">
				<h2 class="text-primary">대화영역</h2>
				<hr class="border border-danger border-3 opacity-50">
			</div>
		</div>
		<!-- chat-Area -->
		<div class="row" id="chatContainer">
			<div id="chatArea"></div>		
			
		</div>
		
		<!-- chat-input bar -->
		<div class="row">
			<hr class="border border-danger border-2 opacity-50">
			<div id="inputName">
				Nickname : <input type="text" id="nickName" placeholder="대화명을 입력하세요." required>
				<input type="button" value="입장" id="enterBtn" class="btn btn-success" onclick="attend()">
			</div>
			
			<div id="inputMsg">
				Message : <input type="text" id="message" placeholder="보내실 메시지를 입력하세요." required>
				<input type="button" value="전송" id="sendBtn" class="btn btn-info" onclick="messageSend()">
				<input type="button" value="퇴장" id="exitBtn" class="btn btn-danger" onclick="absent()">
			</div>
		</div>
		
	</div>
	
</div>
	<!--  -->
	<!--  -->




</body>
</html>