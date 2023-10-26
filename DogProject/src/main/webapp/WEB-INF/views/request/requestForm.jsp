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
List<RequestDTO> rlist = (List<RequestDTO>)session.getAttribute("request_UserOrderSelectList");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.requestForm_sitename {
	font-size: 25px;
	font-weight: bold;
	padding-bottom: 7px;
	border-bottom: 1px solid #ccc; /* 테두리 추가 */
}
select {
	height: 25px;
}
.requestForm_textbar {
	width: 476px; 
	height: 230px;
	margin: 7px 0px;
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
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function RequestFormSubmit() {
	var request = $("#request");
	
	request.attr("action", "requestSave");
	request.submit();
	opener.location.reload();
}
</script>
</head>
<body>
<div>
	<form id="request">
	<div class="requestForm_sitename">사이트 이름</div>
	<!-- <div> 문의하기 > 주문내역 : ???? > 취소문의</div> -->
	<% if(category == "상품주문") { %>
	<div class="requestForm_div">
		<span> 문의하기 > </span>
		<span> <%= category %> > </span>
		<select name="tag">
			<option value="취소문의">취소</option>
			<option value="반품문의">반품</option>
			<option value="교환문의">교환</option>
			<option value="기타문의">기타</option>
		</select>
	</div>
	<% } %>
	<div> 아이디 : <%= userid %> </div>
	<input type="text" name="content" class="requestForm_textbar" placeholder="문의 내용을 입력해주세요.">
	<div class="requestForm_div2">
	<input type="hidden" name="userid" value="<%= userid %>">
	<input type="hidden" name="requestid" value="<%= requestid %>">
	<input type="hidden" name="category" value="<%= category %>">
	<input type="hidden" name="requeststate" value="답변대기">
	<input type="button" onclick="RequestFormSubmit()" value="전송">
	<span class="button-space"></span>
	<input type="reset" value="취소">
	</div>
	</form>
</div>
</body>