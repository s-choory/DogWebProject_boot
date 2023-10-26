<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
	    margin: 0;
	    padding: 0;
	    background-color: #3c3c3c; 
	    font-family: Arial, sans-serif;
  	}
  	
	.link-container {
		margin-left: 30%;
		margin-right: 30%;
		margin-top: 2%;
		color:white;
		text-align: center; /* 중앙 정렬을 위해 추가 */
	}
	
	#로고{	
		margin-bottom: 20px;
	}
	
	.form-list {
	    margin-bottom: 5px;
	    border: 1px solid #ccc;
	    background-color: #3c3c3c; /* 배경색 설정 */
	    color: white; /* 텍스트 색상 설정 */
	}
	
	.form-item {
	    border: 0.5px solid;
	    height:30px;
	    padding : 5px;
	}
	
	.form-item label {
	    display: block; /* 라벨을 블록 레벨 요소로 만들어 좌측 정렬 */
	    margin-bottom: 5px; /* 라벨 아래 간격 설정 */
	}
	
	.zipcode-container {
	    display: flex;
	    align-items: center;
	}
	
	#zipcode-button {
	    margin-left: 10px; /* 원하는 간격으로 조정하세요 */
	}

	.form-item input[type="text"],
	.form-item input[type="password"] {
	    width: 100%;
	    padding: 5px;
	    border: none;
	    outline: none;
	    background-color: inherit; /* 부모 요소의 배경색을 상속 */
	    color: inherit; /* 부모 요소의 텍스트 색상을 상속 */
	}
	.next-button {
		position: fixed;
		bottom: 20px;
		left: 50%;
		transform: translateX(-50%);
		background-color: #FFC81E;
		color: white;
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 14px;
		width: 200px;
	}
	
	.next-buttonOFF {
		position: fixed;
		bottom: 20px;
		left: 50%;
		transform: translateX(-50%);
		background-color: #828282;
		color: #a0a0a0;
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 14px;
		width: 200px;
	}
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	var Code;
	var ChkFlag = false;
	
	$(function(){
		$("#phoneChk").click(function(){
		    $.ajax({
		        type:"POST", // post 형식으로 발송
		        url:"sendNumber", // controller 위치
		        dataType: "text",
		        data: {
		        	PhoneNumber:$("#PhoneNumber").val()
		        },
		        cache : false,
		        success:function(data){
		            if(data == "error"){ //실패시 
		                alert("휴대폰 번호가 올바르지 않습니다.")
		            }else{            //성공시        
		                alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주세요.")
		                Code = data; // 성공하면 데이터저장
		            }
		        }
		        
		    });
		});
		 
		//휴대폰 인증번호 대조
		$("#phoneChk2").click(function() {
			if ($("#phone2").val() == Code) { // 위에서 저장한값을 비교한다
				alert('인증성공');
				ChkFlag = true;
			} else {
				alert('인증실패');
				ChkFlag = true;	//임시로 넣은 코드
			}
		});
		
		$(".link-container").click(function(){
			if(ChkFlag == true){
				$(".next-button").removeClass("next-buttonOFF");
				$("#nextBtn").prop("disabled", false);
			} else {
				$(".next-button").addClass("next-buttonOFF");
				$("#nextBtn").prop("disabled", true);
			}
		})
	})
</script>
</head>
<% String UserID = (String)request.getParameter("UserID"); %>
<body>
<div class="link-container">
	<img src="resources/a.jpg" id="로고" width=60 height="60"><br>
	<h1>비밀번호찾기</h1><br>
	<form method="Post" name="myForm" id="myForm" action="findPWConfirm">
	<input type="hidden" name="UserID" value="<%=UserID%>">
	<div style="display: flex; align-items: center;">회원정보에 등록한 휴대전화 인증</div>
		
		<div class="form-list">
		    <div class="form-item">
		        <input type="text" placeholder="이름" name="UserName" id="UserName" />
		    </div>
		
		    <div class="form-item">
		        <div style="display: flex; align-items: center;">
		            <select>
		                <option>+82</option>
		            </select>
		            <input type="text" placeholder="휴대번호 (01012341234)" name="PhoneNumber" id="PhoneNumber">
		            <a href="#" id="phoneChk" style="color: white;">인증번호발송</a>
		        </div>
		    </div>
		    
		    <div class="form-item">
			    <div style="display: flex; align-items: center;">
			        <input type="text" placeholder="인증번호 6자리 숫자 입력" id="phone2">
		    	    <a href="#" id="phoneChk2" style="color: white;">인증번호확인</a>
		    	</div>
		    </div>
		</div>
		<br><br><br><br>
		
	<button class="next-button next-buttonOFF" id="nextBtn" disabled="disabled">다음</button>
	</form>
</div>
</body>
</html>