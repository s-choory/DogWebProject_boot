<%@page import="com.example.dto.RequestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<% 
String userid = (String)session.getAttribute("request_userid");
int requestid = (int)session.getAttribute("request_requestid");
String category = (String)session.getAttribute("request_category");
List<RequestDTO> rlist = (List<RequestDTO>)session.getAttribute("request_SelectList");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<style>
body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	}
.requestForm_sitename {
	font-size: 25px;
	font-weight: bold;
	padding-bottom: 7px;
	border-bottom: 1px solid green; /* 테두리 추가 */
	background: linear-gradient(135deg, white, #429F6B);
}
select {
	height: 25px;
}
.requestForm_div {
	padding: 7px 0px;
}
.requestForm_div2 {
	padding-top: 4px;
	display: flex;
	justify-content: center;
}
.button-space {
    margin: 0px 5px; 
}
.pagination-container {
        display: flex;
        justify-content: center;
    }

    .pagination {
        display: inline-flex;
    }
img,
.padding_left {

padding-left: 12px;
}
.margin_side {
margin: 0px 12px;
width: 100%-24px;
}
.form-control {
width: 95%;
height: 235px;
margin-bottom: 8px;
}
ul {
margin-bottom: 8px;
}
.page-link{
color: green;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function RequestFormSubmit() {
	var request = $("#request");
	request.attr("action", "requestSave");
	request.submit();
	opener.location.reload();
}
function RequestFormSubmit2() {
	var request = $("#request");
	request.attr("action", "requestSave");
	request.submit();
	opener.location.reload();
}
function Requestclose(){
	opener.location.reload();
	window.close();
}
</script>
</head>
<body>
<div>
	<form id="request">
	<div class="requestForm_sitename">
	<img alt="" src="/app/resources/서브로고.png" width="200">
	</div>
	<!-- <div> 문의하기 > 주문내역 : ???? > 취소문의</div> -->
	<div class="requestForm_div">
		<span class="padding_left"> 문의하기 > </span>
		<span> <%=category%> > </span>
		<select name="tag">
		<% 
		if (category.equals("상품주문")){ %>
			<option value="취소문의">취소</option>
			<option value="반품문의">반품</option>
			<option value="교환문의">교환</option>
			<option value="기타문의">기타</option>
			<%} else {%>
			<option value="삭제요청">삭제요청</option>
			<option value="건의사항">건의사항</option>
			<option value="기타">기타</option>
		<% }%>
		</select>
	</div>
	<div class="padding_left"> <%= userid %> 님 </div>
	<input type="text" class="form-control margin_side" name="content" placeholder="문의 내용을 입력해주세요.">
	<input type="hidden" name="userid" value="<%= userid %>">
	<input type="hidden" name="requestid" value="<%= requestid %>">
	<input type="hidden" id="category" name="category" value="<%= category %>">
	<input type="hidden" name="requeststate" value="답변대기">
	<div class="pagination-container">
    <ul class="pagination justify-content-center">
   		 <% 
		if (category.equals("상품주문")){ %>
        <li class="page-item"><a class="page-link" href="#" onclick="RequestFormSubmit()">전송</a></li>
        <%} else {%>
        <li class="page-item"><a class="page-link" href="#" onclick="RequestFormSubmit2()">전송</a></li>
        <% }%>
    </ul>
    <span class="button-space"></span>
    <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link" href="#" onclick="Requestclose()">닫기</a></li>
    </ul>
	</div>
	</form>
</div>
</body>