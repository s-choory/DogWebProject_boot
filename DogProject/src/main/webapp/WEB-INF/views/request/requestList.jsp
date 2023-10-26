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
td {
text-align: center;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
var rlistSize = ""; //전체 데이터 갯수
var rangeSize = ""; //페이지당 출력 갯수.
var pageSwitch = ""; //초기 페이지 값.
function pageChange() {
	console.log("호출");
}
function pageChangeOne() {
	
}

$(document).ready(function(){
	
	rlistSize = $("#rlistSize").val(); //전체 데이터 갯수
	rangeSize = 9; //페이지당 출력 갯수.
	pageSwitch = 1; //초기 페이지 값.
	
	$(".rlistinfo").slice(rangeSize).hide();
	
});


function pageChange(num){
	pageSwitch = num;
$(".rlistinfo").slice().hide();
var hideLists = $(".rlistinfo:hidden").length;
hideLists.slice((pageSwitch-1)*rangeSize, rangeSize*pageSwitch).show();
var count = hideLists.length;
if (count > maxOrders) {
	count = maxOrders;
}

</script>
</head>
<body>
<div>
<input id="rlistSize" type="hidden" value="<%=rlist.size()%>">	
	<form id="request">
	<div class="requestForm_sitename">사이트 이름</div>
	<!-- <div> 문의하기 > 주문내역 : ???? > 취소문의</div> -->
	<table>
		<tr>
			<td width="61px">번호</td>
			<td width="218px">문의 정보</td>
			<td width="112px">작성 시간</td>
			<td width="91px">문의 현황</td>
		</tr>
	</table>
		<% for(int i = rlist.size()-1; i>0; i-- ) { %>
		<table class="rlistinfo">
		<tr>
			<td width="61px"><%= i+1 %></td>
			<td width="218px">
				<a href="requestPost?requestid=<%= rlist.get(i).getRequestid() %>&userid=<%=userid%>&count=<%=rlist.get(i).getCount() %>">
				<%= rlist.get(i).getCategory() %> > <%= rlist.get(i).getTag() %> > <%= rlist.get(i).getRequestid() %>
				</a>
			</td>
			<td width="112px"><%= rlist.get(i).getCreatetime().substring(0, 10) %></td>
			<td width="91px"><%= rlist.get(i).getRequeststate() %></td>
		</tr>
		</table>
		<% } %>
	</form>
	<div style="text-align: center;">
	<a href="javascript:pageChange(1)">&#60;&#60;</a>
	<a href="javascript:(-1)">&#60;</a>
	<% for(int i = 1; i<rlist.size()%10+1; i++) { %>
		<a href="javascript:test(<%= i %>)"><%= i %></a>
	<% } %>
	<a href="javascript:(-1)">&#62;</a>
	<a href="javascript:pageChange(<%=rlist.size()%10+1%>)">&#62;&#62;</a>
	</div>
</div>

</body>