<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style type="text/css">
	body {
	    margin: 0;
	    padding: 0;
	    background-color: #3c3c3c; 
	    font-family: "Exo", sans-serif;
  	}
  	
	.link-container {
		margin-left: 37%;
		margin-right: 37%;
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
	    border: 0.1px solid gray;
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
		background-color: #7AFF7A;
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
	
	.form-middle-container{
		display: flex;
		align-items: center;
		font-weight: bolder;
	}
	.form-middle-text1{
		margin-right: 5px;
	}
	.form-middle-text2{
		margin-right: 50px;
	}
	.form-middle-text3 {
	  margin-left: auto; /* 수정된 부분 */
	}
	.form-middle-text3 a{
		color: #a0a0a0;
		text-decoration: none;
		transition: color 0.3s;
		font-size: 14px;
	}
	.form-middle-text3 a:hover{
		color: #7AFF7A;
	}
	.form-middle-text4{
		margin-right: 100px;
	}
	.selectoption{
		height:20px;
		background-color:#7AFF7A; 
		border-radius: 30px;
		font-weight: 600;
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
		            	Swal.fire('경고', '휴대폰 번호가 올바르지 않습니다.', 'warning');
		            }else{            //성공시        
		            	Swal.fire('성공', '인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주세요.', 'success');
		                Code = data; // 성공하면 데이터저장
		            }
		        }
		        
		    });
		});
		 
		//휴대폰 인증번호 대조
		$("#phoneChk2").click(function() {
			if ($("#phone2").val() == Code) { // 위에서 저장한값을 비교한다
				Swal.fire('Success', '인증성공', 'success');
				ChkFlag = true;
			} else {
				Swal.fire('Fail', '인증실패', 'error');
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
s	})
</script>
</head>
<body>
<div class="link-container">
<a href="/app/"><img src="resources/로고아이콘.png" id="로고" width=80 height="60"></a><br>
	<h1>Find ID</h1><br>
	<form method="get" name="myForm" id="myForm" action="findIDConfirm">
		
		<div class="form-list">
		    <div class="form-item">
		        <input type="text" placeholder="이름" name="UserName" id="UserName" />
		    </div>
		
		    <div class="form-item">
		        <div class = "form-middle-container">
		        	<div class="form-middle-text1">
			            <select class="selectoption">
			                <option>+82</option>
			            </select>
		            </div>
		            <div class="form-middle-text2">
		            	<input type="text" placeholder="휴대번호 (01012341234)" name="PhoneNumber" id="PhoneNumber">
		            </div>
		            <div class="form-middle-text3">
		            	<a href="#" id="phoneChk">인증번호발송</a>
		            </div>	
		        </div>
		    </div>
		    
		    <div class="form-item">
			    <div class="form-middle-container">
			    	<div class="form-middle-text4">
			        	<input type="text" placeholder="인증번호 6자리 숫자 입력" id="phone2">
			        </div>
			        <div class="form-middle-text3">	
		    	    	<a href="#" id="phoneChk2">인증번호확인</a>
		    	    </div>
		    	</div>
		    </div>
		</div>
		<br><br><br><br>
		
	<button class="next-button next-buttonOFF" id="nextBtn" disabled="disabled">다음</button>
	</form>
</div>
</body>
</html>