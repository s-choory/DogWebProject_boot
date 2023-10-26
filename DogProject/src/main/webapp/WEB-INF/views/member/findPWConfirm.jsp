<%@page import="com.example.dto.UsersDTO"%>
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
	
	function checkEqualPW(){
		var pw1 = $("#password1").val();
		var pw2 = $("#password2").val();
		
		var validate = /^[a-zA-Z0-9]{4,12}$/;
		
        if(!validate.test(pw1)){ 
            alert("passwd는 4~12자의 영문 대소문자와 숫자조합입니다.");
			event.preventDefault();
            return false;
        }
        if(!validate.test(pw2)){ 
            alert("passwd는 4~12자의 영문 대소문자와 숫자조합입니다.");
			event.preventDefault();
            return false;
        }
		
		if(pw1 != pw2){
            alert("입력하신 비밀번호가 같지 않습니다.");
			event.preventDefault();
		}else{
			$("#myForm").attr("action", "changePW");
		}
		
	}
	
</script>
</head>
<% 
	UsersDTO user = (UsersDTO)request.getAttribute("user"); 
%>
<body>
<div class="link-container">
	<img src="resources/a.jpg" id="로고" width=60 height="60"><br>
	<% if(user != null){ %>
	<h1>비밀번호변경</h1><br>
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
		<button onclick="checkEqualPW()">변경하기</button><br><br>
				    
	<% }else{ %>
		<h1>입력하신 정보에 해당하는 계정이 존재하지 않습니다. 입력 정보를 다시 확인해주세요.</h1>
		<% } %>			
		<a href="findPW" style="color: blue;">이전 페이지로 이동</a><br><br>		
		<a href="login" style="color: blue;">로그인 페이지로 이동</a>
		
	</form>
</div>
</body>
</html>