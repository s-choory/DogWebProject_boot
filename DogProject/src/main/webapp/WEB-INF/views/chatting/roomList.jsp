<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.dto.ChatRoomDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<script src="https://unpkg.com/bootstrap-show-password@1.2.1/dist/bootstrap-show-password.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
$(function(){ //roomName userCnt roomPwd
	
	//비밀번호입력 div 감추기/보이기
	$('#secretChk').change(function() {
		var checked = $('#secretChk').is(':checked');
		if(checked){
			$('#roomPwd').attr("required", "required");
			$('#test').show();
		}else{
			$('#roomPwd').removeAttr("required");
			$('#test').hide();
		}
	});
		
    // 모달창 열릴 때 이벤트 처리 => roomId 가져오기
    $("#enterRoomModal").on("show.bs.modal", function (event) {
        roomId = $(event.relatedTarget).data('id');
        //console.log("roomId: " + roomId);

    });
	
});

//비공개대화방 버튼 동작부, 비밀번호 확인
function enterRoom(){
    let enterPwd = $("#enterPwd").val();
    $.ajax({
        url : "chatRoom/confirmPwd/"+roomId,
        async : false,
        type : "post",
        data : {
            "roomPwd" : enterPwd
        },
        success : function(result){
            console.log("동작완료")
            console.log("확인 : "+chkRoomUserCnt(roomId))

            if(result){
                if (chkRoomUserCnt(roomId)) {
                    location.href = "chatRoom/"+roomId;
                }
            }else{
            	Swal.fire('경고', '비밀번호가 일치하지 않습니다.\n입장하시려는 대화방명이 맞는지 확인해주세요.', 'warning');
            }
        }
    });
}

//대화방입장 시 정원확인
function chkRoomUserCnt(roomId){
    let UserCntchk;
    //비동기 처리 설정 false 로 변경 => ajax 통신이 완료된 후 return 문 실행
    //기본설정 async = true 인 경우에는 ajax 통신 후 결과가 나올 때까지 기다리지 않고,
    //먼저 return 문이 실행되서 제대로된 값(원하는 값)이 return 되지않는 문제가 발생.
    $.ajax({
        url : "chatRoom/chkUserCnt/"+roomId,
        async : false,
        type : "GET",
        success : function(result){
            if (!result) {
            	Swal.fire('경고', '대화 중인 사용자가 많아 입장 할 수 없습니다.\n잠시 후 다시 시도해 주세요."', 'warning');
            }
            UserCntchk = result;
        }
    });
    return UserCntchk;
}

//대화방 제거
function delRoom(roomId){
    location.href = "chatRoom/delRoom/"+roomId;
}
	

</script>
<style type="text/css">
/* 동적크기 적용 */
html, body {
	height: 100%;
}

/* 대화방목록 효과 */
#cardList {
    animation: fadein 2s;
    -moz-animation: fadein 2s; /* Firefox */
    -webkit-animation: fadein 2s; /* Safari and Chrome */
    -o-animation: fadein 2s; /* Opera */
}
@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity:0;
    }
    to {
        opacity: 1;
    }
}

.container{
	margin-bottom: 30px;
}

</style>
<title>Title</title>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<div class="container">
	<div class="row mt-5 mb-2 p-1">
		<div class="col">
			<h2 class="text-primary">대화방목록</h2>
		</div>
		<div class="col d-flex flex-row-reverse">
			<button type="button" class="btn btn-outline-primary btn-sm " data-bs-toggle="modal" data-bs-target="#roomModal">대화방 만들기</button> <br>
		</div>
	</div>	
	
	<!-- card Start -->
	<div class="row row-cols-1 row-cols-md-4 g-4" id="cardList">
<%
	//채팅방 리스트
	List<ChatRoomDTO> roomList = (List<ChatRoomDTO>)request.getAttribute("roomList");
	for(int i= 1; i<= roomList.size(); i++){
		int roomId = roomList.get(i-1).getRoomId();
		String roomName = roomList.get(i-1).getRoomName();
		String roomPwd = roomList.get(i-1).getRoomPwd();
%>
<% 
		//채팅방 암호설정된 리스트
		if(roomPwd == null ){
%>
		<div class="col">
			<div class="card h-100">
				<img src="https://img.freepik.com/premium-vector/cute-dog-cartoon-illustration_569774-126.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title"><%=roomName %>
						<i class="bi bi-x-square" onclick="delRoom(<%=roomId%>)"></i>
					</h5>
					<p class="card-text">Manners maketh man</p>
				</div>
				<div class="card-footer bg-transparent d-flex justify-content-center">
					<a href="/app/chatRoom/<%=roomId%>" class="btn btn-outline-dark" onclick="return chkRoomUserCnt(<%=roomId%>);">입장하기</a>
				</div>
			</div>
		</div>

<% 
		//채팅방 일반리스트
		}else if(roomPwd != null ){
%>
		<div class="col">
			<div class="card h-100">
				<img src="https://img.freepik.com/premium-vector/cute-dog-cartoon-illustration_569774-126.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title"><%=roomName %>
						<i class="bi bi-house-lock"></i>
						<i class="bi bi-x-square" onclick="delRoom(<%=roomId%>)"></i>
					</h5>
					<p class="card-text">Manners maketh man</p>
				</div>
				<div class="card-footer bg-transparent d-flex justify-content-center">
					<a href="/app/chatRoom/<%=roomId%>" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#enterRoomModal" data-id="<%=roomId%>">입장하기</a>
				</div>
			</div>
		</div>
			
<%
		}
	}
%>
	<!-- card End -->
	</div>
</div>
	<!-- 대화방만들기, modal start -->
	<div class="modal fade" id="roomModal" tabindex="-1" aria-labelledby="roomModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- modal-header -->
				<div class="modal-header">
					<h5 class="modal-title fs-5">대화방 생성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<!-- form -->
				<form class="needs-validation" action="/app/roomAdd" method="post">
					<!-- modal-body -->
					<div class="modal-body">
						<div class="md-3 ">
							<label for="roomName" class="form-label">대화방 이름</label>
							<input type="text" class="form-control" id="roomName" name="roomName" placeholder="대화방명을 입력해주세요." required>
						</div>
						<div class="form-group my-3">
							<label for="maxUserCnt" class="form-label">채팅방 인원설정</label>
							<div class="col-20">
							<i class="bi bi-person"></i>
								<input type="range" class="form-range" value="1" min="1" max="10" id="maxUserCnt" name="maxUserCnt" style="width: 50%" oninput="document.getElementById('value1').innerHTML= '( '+ this.value + '명)';">
							<i class="bi bi-people"></i>
							<span id="value1"></span>
							</div>
						</div>
						<div class="form-check">
							<label class="form-check-label" for="secretChk"> 채팅방 잠금 </label>
							<input class="form-check-input" type="checkbox" id="secretChk" name="secretChk">
						</div>
						<div class="mb-3" id="test" style="display: none;">
							<label for="roomPwd" class="col-form-label"> 대화방 암호설정</label>
							<div class="input-group">
								<!-- data-toggle 비밀번호 감추기/보이기 -->
								<input type="password" name="roomPwd" id="roomPwd" class="form-control" data-toggle="password" placeholder="설정할 암호를 입력해주세요.">
							</div>
						</div>	
					</div>
					<!-- modal-footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Make</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- modal end -->
	
	<!-- 암호입력, modal start -->
	<div class="modal fade" id="enterRoomModal" tabindex="-1" aria-labelledby="enterRoomModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        	<!-- modal-header -->
	            <div class="modal-header">
	                <h5 class="modal-title fs-5">비공개 대화방 참여</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <!-- modal-body -->
	            <div class="modal-body">
	                <div class="mb-3">
	                    <label for="enterPwd" class="col-form-label">대화방 비밀번호</label>
	                    <!-- data-toggle 비밀번호 감추기/보이기 -->
	                	<input type="password" name="enterPwd" id="enterPwd" class="form-control" data-toggle="password" placeholder="대화방 비밀번호를 입력해주세요." required>
	                </div>
	                <!-- modal-footer -->
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-primary" onclick="enterRoom()">Join</button>
	                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                </div>
                </div>
            </div>
        </div>
    </div>
	<!-- modal end -->
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
	
</body>
</html>