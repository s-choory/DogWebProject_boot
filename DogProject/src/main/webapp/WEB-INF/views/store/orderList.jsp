<%@page import="com.example.dto.UsersDTO"%>
<%@page import="com.example.dto.OrdersDTO"%>
<%@page import="com.example.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
UsersDTO udto = (UsersDTO)session.getAttribute("User");
List<CartDTO> clist = (List<CartDTO>)session.getAttribute("clist");
List<OrdersDTO> olist = (List<OrdersDTO>)session.getAttribute("olist");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	}
.order_top_main{
	padding-top: 30px;
	font-size: 40px;
	font-weight: bold;
	text-align: center;
}
.order_top_main2{
	padding-top: 60px;
	padding-bottom: 80px;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	width: 100%;
}
.order_top_info{
	font-size: 22px; 
	font-weight: bold;
	padding-bottom: 10px;
}
.order_top_infoNum{
	border-top: 1px; 
	width:100%; 
	text-align: center;
	font-size: 17px; 
}
.order_top_infoNum td{
	padding: 10px 0px;
}
.order_top_sub{
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	padding-bottom: 30px;
}
.order_top_sub2{
	font-size: 14px;
	padding-bottom: 100px;
	font-weight: bold;
	text-align: center;
}
.order_middle_top{
	width: 80%;
	border: 1px;
}
.order_middle_name {
	margin-left: 15%;
	margin-bottom: 10px;
	font-size: 30px;
	font-weight: bold;
}
.order_middle_plus {
}
.order_middle_box {
	display: flex;
    margin-left: 15%;
    margin-right: 15%;
    margin-bottom: 10px;
    border: 1px solid #ccc; /* 테두리 추가 */
    border-radius: 5px;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}
.order_middle_more {
	width: 70%;
	margin: 0px 15% 10px 15%;
    padding: 10px 0px;
    border: 1px solid #ccc; /* 테두리 추가 */
    border-radius: 5px;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	text-align: center;"
}
.order_middle_request {
	padding: 10px 0px;
    margin: 0px 20px 20px 20px;
    border: 1px solid #ccc; /* 테두리 추가 */
    border-radius: 5px;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	text-align: center;"
}
.order_middle_unbox {
	display: flex;
	justify-content: center;  
}
.order_middle_box1 {
	width:11%; 
	border-right: 1px solid #ccc;
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.order_middle_box1_top {
	height: 50%; 
	border-bottom: 1px solid #ccc; 
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.order_middle_box1_botton {
	height: 50%; 
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.order_middle_box1_title {
	padding-bottom: 10px;
	font-size: 18px;
	font-weight: bold;
	text-align: center; 
		width:100%;
}
.order_middle_box1_data1 {
	font-size: 15px;
	text-align: center;
		width:100%;
}
.order_middle_box1_data2 {
	font-size: 15px;
	text-align: center;
		width:100%;
}
.order_middle_box2 {
	width: 70%; 
	border-right: 1px solid #ccc;
}
.order_middle_box2_title {
	padding-top: 30px;
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 10px;
	font-size: 24px;
	font-weight: bold;
}
.order_middle_box2_data1 {
	padding-bottom: 30px;
	padding-left: 30px;
	padding-right: 30px;
	font-size: 15px;
}
.order_middle_box2_data2 {
	padding-left: 30px;
	padding-right: 30px;
	font-size: 15px;
}
.order_middle_box2_image {
	width: 60px;
}
.order_middle_box2_goodsname {
	width: 100%;
	font-size: 20px;
	font-weight: bold;
	padding-left: 10px;
}
.order_middle_box2_goodsinfo {
	font-size: 15px;
	color: gray;
	padding-left: 10px;
}
.order_middle_box2_goodsprice {
	text-align: right;
}
.order_middle_box2_goodstotal {
	text-align: right;
	padding: 20px 20px;
}
.order_middle_box2_goodstotal2 {
	text-align: right;
	padding-bottom: 30px;
	padding-left: 20px;
	padding-right: 20px;
	font-weight: bold;
}
.order_middle_box3 {
 	width: calc(25% - (5px + (10% /3))); 
 		display: flex;
	flex-direction: column;
	justify-content: center;
}
.order_middle_box3_title {
	padding: 20px 20px 10px 20px;
	font-size: 18px;
	font-weight: bold;
}
.order_middle_box3_data1 {
	padding-bottom: 20px;
	padding-left: 20px;
	padding-right: 20px;
	font-size: 15px;
}
.order_middle_box3_data2 {
	padding-left: 20px;
	padding-right: 20px;
	font-size: 15px;
}
#ordersMore {
	margin-left: 15%;
    margin-right: 15%;
	text-align: center;
	font-size: 20px;
	border: 1px solid #ccc;
    padding: 10px 0px;
    border-radius: 5px;
}
 .no-data{
    	display: flex;
    	justify-content: center;
    	padding: 100px 0;
    	flex-direction: column;
    	color: #707070;
    	text-align: center;
    	font-size: 30px;
    	font-family: 'Hi-melody', sans-serif;
    	font-weight: bolder;
    }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var maxOrders = $("#olistSize").val(); //불러온 리스트 최댓값.
	var ordersCount = 5; //초기 출력 갯수.
	var ordersSee = 5; //더보기 클릭시 출력될 갯수.
	var clickCount = 1;

	$(".order_middle_box").slice(ordersCount).hide();
	
	var showlength= $(".order_middle_box").length-$(".order_middle_box:hidden").length;
	$("#olistHideSize").text(showlength);
	$("#orderMore").on("click", function(e){
		e.preventDefault();
		var hiddenOrders = $(".order_middle_box:hidden");
		var count = hiddenOrders.length;
		if (count > maxOrders) {
			count = maxOrders;
		}
		
		hiddenOrders.slice(0, ordersSee).show();
		
		if($(".order_middle_box:hidden").length === 0 ){
			$("#orderMore").hide();
		}
		clickCount++;
		$("#olistHideSize").text(clickCount*5);
	})
});
function openRequestForm(orderid, userid) {
 	window.open("requestPage?userid="+userid+"&requestid="+orderid+"&category=상품주문","_blank","width=500,height=400,resizable=no,scrollbars=no");
}
</script>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<input type="hidden" id="olistSize" value="<%=olist.size()%>">
<div class="order_middle_unbox">
<div>
	<div class="order_top_main">주문리스트</div>
	<div class="order_top_sub2" style="font-weight: bold; f">소중한 내 강아지를 위한 쇼핑!</div>
</div>
</div>

<%
if(olist.size() != 0) {%>
<div class="order_middle_name">주문내역 </div>
<%
for(int i = 0; i<olist.size(); i++ ) { %>
<div class="order_middle_box">
	<div class="order_middle_box1">
		<div class="order_middle_box1_top" >
		<div class="order_middle_box1_title">주문번호</div>
		<div class="order_middle_box1_data1" ><%= olist.get(i).getOrderID() %></div>
		</div>
		<div class="order_middle_box1_botton">
		<div class="order_middle_box1_title">주문날짜</div>
		<div class="order_middle_box1_data2"><%=olist.get(i).getOrderTime().substring(0, 10)%></div>
		<div class="order_middle_box1_data1">(<%=olist.get(i).getOrderTime().substring(11, 19)%>)</div>
		</div>
	</div> <!-- box1 end -->
	<div class="order_middle_box2">
		<div class="order_middle_box2_title">주문상품</div>
			<%for(int StoreItems = 0; StoreItems<clist.size(); StoreItems++){ %>
			<% if(olist.get(i).getOrderID() == clist.get(StoreItems).getOrderNumber()) { %>
			<table style="margin: 0px 20px">
				<tr>
					<td rowspan="3"><img src="resources/storeimages/<%= clist.get(StoreItems).getImage() %>.jpg" width="100px" height="100px"></td>
					<td class="order_middle_box2_goodsname" colspan="2"><%= clist.get(StoreItems).getProductName() %></td>
				</tr>
				<tr>
					<td class="order_middle_box2_goodsinfo" colspan="2">사이즈(<%= clist.get(StoreItems).getPsize() %>) 컬러(<%= clist.get(StoreItems).getColor() %>) 갯수(<%= clist.get(StoreItems).getAmount() %>)</td>
				</tr>
				<tr>
					<td class="order_middle_box2_goodsinfo"><%= clist.get(StoreItems).getPrice() %>원 x (<%= clist.get(StoreItems).getAmount() %>개)</td>
					<td class="order_middle_box2_goodsprice">상품합계 : <%= clist.get(StoreItems).getPrice() * clist.get(StoreItems).getAmount() %>원</td>
				</tr>
			</table>
		<% }} %>
		<div class="order_middle_box2_goodstotal">배 송 비 : <% int delivery = 3500; if(olist.get(i).getTotalPrice() >= 103500) { delivery = 0;} %> <%= delivery %>원</div>
		<div class="order_middle_box2_goodstotal2">총 결제금액 : <%= olist.get(i).getTotalPrice() %>원</div>
	</div> <!-- box2 end -->
	<div class="order_middle_box3">
		<div class="order_middle_box3_title">주문자 정보</div>
		<div class="order_middle_box3_data2"><%= olist.get(i).getUserName() %>, <%= olist.get(i).getPhoneNumber() %></div>
		<div class="order_middle_box3_data2">(<%= olist.get(i).getPostNumber() %>) <%= olist.get(i).getRodeAddress() %> <%= olist.get(i).getDetailAddress() %>,</div>
		<div class="order_middle_box3_data2"><%= olist.get(i).getHouseAddress() %> <%= olist.get(i).getDetailAddress() %></div>
		<div class="order_middle_box3_title" style="padding-top:20px;">결제수단</div>
		<% if(olist.get(i).getPayMethod().equals("무통장입금")){ %>
		<div class="order_middle_box3_data2"><%=olist.get(i).getPayMethod() %>(<%=olist.get(i).getOrderState()%>)</div>
			<% if(olist.get(i).getOrderState().equals("입금대기")){ %>
			<div class="order_middle_box3_data2">입금기한 : <a style="font-weight: bold; color: blue;"><%=olist.get(i).getOrderTime().substring(0, 10)%> 23:59 </a> 까지</div>
			<div class="order_middle_box3_title" style="padding-top:20px;">입금 계좌</div>
			<div class="order_middle_box3_data2">국민은행 123456-78-901234</div>
			<div class="order_middle_box3_data2">신한은행 234-567-891234</div>
			<div class="order_middle_box3_data1">(예금주 : AconTeam3DogProject)</div>
			<% } %>
		<% } else { %>
			<% if(olist.get(i).getPayMethod().equals("신용카드")){ %>
			<div class="order_middle_box3_data2"><%=olist.get(i).getPayMethod() %><% if(olist.get(i).getPaymethodcard() != null ){ %>(<%=olist.get(i).getPaymethodcard()%>)<% } else { %>(카카오머니)<% } %></div>
			<div class="order_middle_box3_data1"><%=olist.get(i).getPaymethodnumber().substring(0, 4)%>-<%=olist.get(i).getPaymethodnumber().substring(4, 8)%>-<%=olist.get(i).getPaymethodnumber().substring(8, 12)%>--<%=olist.get(i).getPaymethodnumber().substring(12, 16)%></div>
			<% } else { %>
			<div class="order_middle_box3_data1"><%=olist.get(i).getPayMethod() %><% if(olist.get(i).getPaymethodcard() != null ){ %>(<%=olist.get(i).getPaymethodcard()%>)<% } else { %>(카카오머니)<% } %></div>
			<% } %>
		<% } %>
			<a class="order_middle_request btn btn-outline-secondary" onclick="openRequestForm(<%= olist.get(i).getOrderID() %>, '<%= udto.getUserID() %>')"> 문의하기</a>
		</div> <!-- box3 end -->
</div>  <!-- box end -->
<% } %>
<% if(olist.size() > 5) { %>
<a class="btn btn-outline-secondary order_middle_more" id="orderMore" >더보기 (<span id="olistHideSize"></span>/<%=olist.size()%>)</a>
<%}} else {%>
<div class="no-data">
    	<div><img src="resources/img/dog/nodata.png" alt="No Results Found"></div><br>
    	<div><p>검색 결과가 없습니다</p></div>
	</div>
	<% } %>
	<br>
<jsp:include page = "../common/footer.jsp" flush="true"/>
</body>
</html>