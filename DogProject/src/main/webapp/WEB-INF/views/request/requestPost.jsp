<%@page import="com.example.dto.RequestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<% 
List<RequestDTO> rlist = (List<RequestDTO>) session.getAttribute("request_SelectList");
RequestDTO rdto = (RequestDTO) session.getAttribute("request_selectone");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
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

padding-left: 8px;
}
.margin_side {
margin: 0px 12px;
width: 100%-24px;
}
.form-control {
width: 95%;
height: 100px;
margin-bottom: 8px;
}
ul {
margin-bottom: 8px;
}
.page-link{
color: green;
}
table {
	text-align: center;
}
.table {
margin-bottom: 0px;
}
.table td, 
.table th {
padding: 0.26rem;
text-align: center;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function RequestReRequest(){
	$("#submitform").attr("action", "requestRerequest");
	$("#submitform").submit();
}
function RequestList(){
	$("#submitform").attr("action", "requestList");
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
	<div class="requestForm_sitename">
	<img alt="" src="/app/resources/서브로고.png" width="200">
	</div>
	<!-- <div> 문의하기 > 주문내역 : ???? > 취소문의</div> -->
	<% for(int i = 0; i<rlist.size(); i++) { %>
	<% if(rdto.getCount() == rlist.get(i).getCount() && rdto.getRequestid() == rlist.get(i).getRequestid()) { %>
		<table class="table">
  		<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">문의 정보</th>
			<th scope="col">작성 시간</th>
			<th scope="col">문의 현황</th>
		</tr>
		<tbody>
		<tr>
			<th scope="row"><%= rlist.get(i).getCount() %></td>
			<td><%= rlist.get(i).getCategory() %> > <%= rlist.get(i).getTag() %> > <%= rlist.get(i).getRequestid() %></td>
			<td><%= rlist.get(i).getCreatetime().substring(0, 10) %></td>
			<td><%= rlist.get(i).getRequeststate() %></td>
		</tr>
		</tbody>
	</table>
		<div class="margin_side"> 문의 내용</div>
		<textarea class="form-control margin_side" rows="3" cols="60" wrap="hard" readonly="readonly"><%= rlist.get(i).getContent() %></textarea>
		<div class="margin_side"> 답변 내용</div>
		<% if(rlist.get(i).getRecontent() == null) { %>
		<textarea class="form-control margin_side" rows="3" cols="60" wrap="hard" readonly="readonly">문의내용을 순차적으로 확인하고 있습니다. 조금만 기다려주세요.</textarea>
		<% } else { %>
		<textarea class="form-control margin_side" rows="3" cols="60" wrap="hard" readonly="readonly"><%= rlist.get(i).getRecontent() %></textarea>
		<% } %> <!-- if2문 end -->
		
	<div class="pagination-container">
    <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link" href="#" onclick="RequestReRequest()">재문의</a></li>
    </ul>
    <span class="button-space"></span>
    <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link" href="#" onclick="RequestList()">목록</a></li>
    </ul>
    <span class="button-space"></span>
    <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link" href="#" onclick="Requestclose()">닫기</a></li>
    </ul>
	</div>
	<%}} %>
	<form id="submitform">
			<input type="hidden" name="userid" value="<%= rdto.getUserid() %>">
			<input type="hidden" name="orderid" value="<%= rdto.getRequestid() %>">
		</form>
</div>
</body>