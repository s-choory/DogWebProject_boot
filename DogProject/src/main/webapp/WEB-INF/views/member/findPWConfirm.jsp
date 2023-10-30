<%@page import="com.example.dto.UsersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
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
	
	.success-button{
		margin-top: 10px;
		margin-bottom: 30px;
		height:30px;
		background: linear-gradient(135deg, #7AFF7A, #429F6B); /* 그라데이션 색상 지정 */
		border-radius: 10px;
		font-weight: bolder;
		border: 0;
		transition: transform 0.3s;
		cursor: pointer;
	}
	
	.success-button:hover{
		transform: translateY(-5px);
	}

	
	.button-contatiner{
		display: flex;
		justify-content: space-between;
		text-align: center;
	}
	
	.other-button{
		margin: 0 auto;
		height:30px;
		background: white; /* 그라데이션 색상 지정 */
		border-radius: 10px;
		font-weight: bolder;
		border: 0;
		width:150px;
		margin-bottom: 10px;
		transition: transform 0.3s;
		cursor: pointer;
	}
	
	.other-button:hover{
		transform: translateY(-5px);
	}
	
	
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	function checkEqualPW(){
		var pw1 = $("#password1").val();
		var pw2 = $("#password2").val();
		
		var validate = /^[a-zA-Z0-9]{4,12}$/;
		
        if(!validate.test(pw1)){ 
        	Swal.fire('경고', 'passwd는 4~12자의 영문 대소문자와 숫자조합입니다.', 'warning');
			event.preventDefault();
            return false;
        }
        if(!validate.test(pw2)){ 
        	Swal.fire('경고', 'passwd는 4~12자의 영문 대소문자와 숫자조합입니다.', 'warning');
			event.preventDefault();
            return false;
        }
		
		if(pw1 != pw2){
        	Swal.fire('경고', '입력하신 비밀번호가 일치하지 않습니다.', 'warning');
			event.preventDefault();
		}else{
			$("#myForm").attr("action", "changePW");
		}
		
	}
	function login(){
		location.href="login";
	}
	
	function findPW(){
		location.href="findPW";
	}
	
</script>
</head>
<% 
	UsersDTO user = (UsersDTO)request.getAttribute("user"); 
%>
<body>
<div class="link-container">
<a href="/app/"><img src="resources/로고아이콘.png" id="로고" width=80 height="60"></a><br>
	<% if(user != null){ %>
	<h1>Result Find Password</h1><br>
	<form method="post" name="myForm" id="myForm" action="">
		<input type="hidden" name="UserID" value="<%= user.getUserID() %>">
		<div class="form-list">
		    <div class="form-item">
		    	<div style="display: flex; align-items: center;">
		    		<input type="password" name="Password" id="password1" placeholder="변경할 비밀번호 입력">
			    </div>
		    </div>
		    <div class="form-item">
		    	<div style="display: flex; align-items: center;">
		    		<input type="password" id="password2" placeholder="비밀번호 확인">
			    </div>
		    </div>
		</div>
		<button class="success-button" onclick="checkEqualPW()">변경하기</button><br>
				    
	<% }else{ %>
		<h1>입력하신 정보에 해당하는 계정이 존재하지 않습니다.<br><br> 입력 정보를 다시 확인해주세요.</h1>
		<% } %>
		<div class="button-contatiner">
			<button onclick="findPW()" class="other-button">이전 페이지로 이동</button><br>
			<button onclick="login()" class="other-button">로그인 페이지로 이동</button><br>
		</div>
	</form>
</div>
</body>
</html>