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
List<RequestDTO> rlistSee = (List<RequestDTO>)session.getAttribute("request_PageSee");
%>
<meta charset="UTF-8">
<title>DOGGYDOGGY 문의하기</title>
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
.onpaging {
    border: 1px solid;
    width: 15px;
    height: 15px;
}
ul {
margin-bottom: 8px;
}

table, img {
	padding-left: 8px;
}

.table td, 
.table th {
padding: 0.18rem;
text-align: center;
}
.table {
margin-bottom: 0px;
}

.page-link,
a {
color: green;
}
 .background-image {
        position: relative;
    }

    .background-image::before {
        content: "";
        background-image: url("/app/resources/서브로고2.png");
        background-repeat: no-repeat;
        background-size: 40%;
        background-position: center;
        opacity: 0.2;
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: -1;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".rlistinfo").slice(9).hide();
});

function pageChange(num) {
	console.log(num)
	$("#num").val(num);
	console.log($("#num").val(num))
	$("#pageMove").submit();
}
function pageChange2(num) {
	console.log(num)
	var num2 = $("#num").val()+num;
	if(num2 <= 0) {
		num2 = 1;
	}
	if(num2 >= $("#pageMax").val()){
		num2 = $("#pageMax").val()
	}
	pageChange(num2)
}

function Requestclose(){
	opener.location.reload();
	window.close();
}
</script>
</head>
<body>
<div>
<input id="rlistSize" type="hidden" value="<%=rlist.size()%>">	
	<div class="requestForm_sitename">
	<img alt="" src="/app/resources/서브로고.png" width="200">
	</div>
</div>
	<!-- <div> 문의하기 > 주문내역 : ???? > 취소문의</div> -->
	<div class="background-image">
	<form id="request">
	<table class="table">
  		<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">문의 정보</th>
			<th scope="col">작성 시간</th>
			<th scope="col">문의 현황</th>
		</tr>
		</thead>
		<% if(rlistSee.size() != 0) { %>
		<tbody>
		<%
		}
		for(int i = rlistSee.size()-1; i>=0; i-- ) { %>
		<tr>
			<th scope="row"><%= rlistSee.get(i).getCount() %></th>
			<td>
				<a href="requestPost?requestid=<%= rlistSee.get(i).getRequestid() %>&userid=<%=userid%>&count=<%=rlistSee.get(i).getCount() %>">
				<%= rlistSee.get(i).getCategory() %> > <%= rlistSee.get(i).getTag() %> > <%= rlistSee.get(i).getRequestid() %>
				</a>
			</td>
			<td><%= rlistSee.get(i).getCreatetime().substring(0, 10) %></td>
			<td><%= rlistSee.get(i).getRequeststate() %></td>
		</tr>
		<% 
		} %>
		</tbody>
		</table>
		
	</form>

<div style="margin-bottom: 10px;"></div>
	<nav aria-label="Page navigation example">
  		<ul class="pagination justify-content-center">
    		<li class="page-item"><a class="page-link" href="javascript:pageChange(1)">&#60;</a></li>
    		<%  
    		int pageplue = 0;
    		if(rlist.size()%7 == 0){
    			pageplue = 0; }else{
    				pageplue = 1;
    			}
    		for(int i = 1; i<= (rlist.size()/7)+pageplue; i++) { %>
    		<li class="page-item"><a class="page-link" href="javascript:pageChange(<%= i %>)"><%= i %></a></li>
    		<% } %>
    		<li class="page-item"><a class="page-link" href="javascript:pageChange(<%=(rlist.size()/9)+1%>)">&#62;</a></li>
  		</ul>
	</nav>
	<form id="pageMove" action="requestPageChange">
		<input type="hidden" name="num" id="num">
	</form>
	<div style="text-align: center;">
		<input type="hidden" id="pageMax" value="<%=(rlist.size()/7)+1%>">
		<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="#" onclick="Requestclose()">닫기</a></li>
		</ul>
	</div>
	</div>
</body>