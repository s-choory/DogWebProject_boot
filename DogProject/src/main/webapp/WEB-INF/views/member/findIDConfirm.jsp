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
</head>
<% 
	String UserID ="";
	/* 찾은 아이디의 앞부분 세글자만 보이게한다.*/
	String originalString  = (String)request.getAttribute("UserID"); 
	if(originalString != null){
		int charsToKeep = 3; // 앞부분에 몇 글자를 그대로 둘 것인지 설정
		int totalChars = originalString.length();
		
	    String prefix = originalString.substring(0, charsToKeep);
	    String masking = new String(new char[totalChars - charsToKeep]).replace('\0', '*');
	    UserID = prefix + masking;
    }else{
    	UserID = "인증하신 번호에 해당되는 회원 이름이 없습니다. 이름과 번호를 다시 확인해주세요.";
    }
%>
<body>
<div class="link-container">
	<img src="resources/a.jpg" id="로고" width=60 height="60"><br>
	<h1>아이디찾기확인</h1><br>
	<form method="post" name="myForm" id="myForm" action="findID">
		
		<div class="form-list">
		    <div class="form-item">
		    	<div style="display: flex; align-items: center;">
		    		<%= UserID %>
			    </div>
		    </div>
		</div>
				    <% if(originalString != null){ %>
				    <a href="findPW" style="color: blue;">비밀번호 찾기</a><br><br>
				    <% } %>
		<a href="login" style="color: blue;">로그인 페이지로 이동</a><br><br>
		<a href="findID" style="color: blue;">아이디 찾기 페이지로 이동</a>		
		
	</form>
</div>
</body>
</html>