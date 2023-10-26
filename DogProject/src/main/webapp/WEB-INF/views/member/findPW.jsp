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
	    border: 1px solid gray;
	    background-color: #3c3c3c; /* 배경색 설정 */
	    color: white; /* 텍스트 색상 설정 */
	}
	
	.form-item {
	    border: 1px solid gray;
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
		font-weight: bolder;
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
	
	$(function(){
		
		<%	String msg = (String)session.getAttribute("msg");
		if(msg != null){%>
			Swal.fire('경고', '<%=msg%>', 'warning');
		<% } 
			session.removeAttribute("msg");
		%>
		
		$("#UserID").keyup(function(){
			$(".next-button").removeClass("next-buttonOFF");
			$("#nextBtn").prop("disabled", false);
		});
		
	});
	
</script>
</head>
<body>
<div class="link-container">
<a href="/app/"><img src="resources/로고아이콘.png" id="로고" width=80 height="60"></a><br>
	<h1>Find Password</h1><br>
	<form method="get" name="myForm" id="myForm" action="findPW2">
		
		<div class="form-list">
		    <div class="form-item">
		        <input type="text" placeholder="아이디" name="UserID" id="UserID" />
		    </div>
		</div>
		<br><br><br><br>
		
	<button class="next-button next-buttonOFF" id="nextBtn" disabled="disabled">다음</button>
	</form>
</div>
</body>
</html>