<%@page import="com.example.dto.RequestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<% 
List<RequestDTO> rlist = (List<RequestDTO>) session.getAttribute("request_UserOrderSelectList");
RequestDTO rdto = (RequestDTO) session.getAttribute("request_selectone");
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
	height: 90px;
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
td {
text-align: center;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function RequestReRequest(){
	$("#submitform").attr("action", "requestRerequest");
	$("#submitform").submit();
}
function RequestList(){
	$("#submitform").attr("action", "requestPage");
	$("#submitform").submit();
}
function Requestclose(){
	opener.location.reload();
	window.close();
}
</script>
</head>
<body>
<div>
	<div class="requestForm_sitename">사이트 이름</div>
	<!-- <div> 문의하기 > 주문내역 : ???? > 취소문의</div> -->
	<% for(int i = 0; i<rlist.size(); i++) { %>
	<% if(rdto.getCount() == rlist.get(i).getCount() && rdto.getRequestid() == rlist.get(i).getRequestid()) { %>
		<table>
		<tr>
			<td width="61px">번호</td>
			<td width="218px">문의 정보</td>
			<td width="112px">작성 시간</td>
			<td width="91px">문의 현황</td>
		</tr>
		<tr>
			<td><%= i+1 %></td>
			<td><%= rlist.get(i).getCategory() %> > <%= rlist.get(i).getTag() %> > <%= rlist.get(i).getRequestid() %></td>
			<td><%= rlist.get(i).getCreatetime().substring(0, 10) %></td>
			<td><%= rlist.get(i).getRequeststate() %></td>
		</tr>
	</table>
		<div> 문의 내용</div>
		<input class="requestForm_textbar" type="text" value="<%= rlist.get(i).getContent() %>" readonly>
		<div> 답변 내용</div>
		<% if(rlist.get(i).getRecontent() == null) { %>
		<input class="requestForm_textbar" type="text" value="고객님들의 문의내용을 순차적으로 확인하고 있습니다. 조금만 기다려주세요." readonly>
		<% } else { %>
		<input class="requestForm_textbar" type="text" value="<%= rlist.get(i).getRecontent() %>" readonly>
		<% } %> <!-- if2문 end -->
	<div style="text-align: center;">
		<input type="button" onclick="RequestReRequest()" value="재문의">
		<span class="button-space"></span>
		<input type="button" onclick="RequestList()" value="목록">
		<span class="button-space"></span>
		<input type="button" onclick="Requestclose()" value="닫기">
	</div>
	<% } %>	<!-- if문 end -->
	<% } %> <!-- for문 end -->
		<form id="submitform">
			<input type="hidden" name="userid" value="<%= rdto.getUserid() %>">
			<input type="hidden" name="orderid" value="<%= rdto.getRequestid() %>">
		</form>
</div>
</body>