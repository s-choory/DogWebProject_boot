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
List<CartDTO> list = (List<CartDTO>)session.getAttribute("orderAfterList");
OrdersDTO odto = (OrdersDTO)session.getAttribute("orderDate");
UsersDTO user = (UsersDTO)session.getAttribute("User");
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
.order_middle_unbox {
	display: flex;
	justify-content: center;  
}
.order_middle_box1 {
	width: calc(15% - (5px + (10% /3))); 
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
	width: calc(70% - (5px + (10% /3))); 
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
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function pageMove(){
	window.location.href = "/app/orderList";
}
</script>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<div class="order_middle_unbox">
<%
if(odto.getPayMethod().equals("무통장입금")){ %>
<div>
	<div class="order_top_main2">상품 주문이 정상적으로 접수되었습니다.</div>
	<div class="order_top_info">입금 계좌 안내</div>
	<div style="border-top : 1px solid #ccc; border-bottom : 1px solid #ccc; margin-bottom: 10px; ">
		<table class="order_top_infoNum">
			<tr>
				<td >국민은행</td>
				<td colspan="2" style="padding-left: 10px; text-align: left; width: 80%">123456-78-901234 (예금주 : AconTeam3DogProject)</td>
			</tr>
			<tr>
				<td>신한은행</td>
				<td colspan="2" style="padding-left: 10px; text-align: left; width: 80%">234-567-891234 (예금주 : AconTeam3DogProject)</td>
			</tr>
		</table>
	</div>
	<div class="order_top_sub2">
		ㆍ입금 확인까지 다소 시간이 소요될 수 있습니다.<br>
		ㆍ입금기한 내 입금하지 않으면 주문이 자동취소 처리 됩니다.<br>
		ㆍ은행에 따라 서비스 이용불가시간에는 입금이 어려우니 확인 후 이용해주세요.<br>
	</div>
</div>
<% } else { %>
<div>
	<div class="order_top_main2">상품 결제가 정상적으로 완료되었습니다.</div>
	<div class="order_top_sub2">
		ㆍ오후 3시전 결제 건은 당일 출고가 될 수 있습니다.<br>
		ㆍ상품의 재고현황에 따라 배송이 지연될 수 있습니다.<br>
		ㆍ상세한 결재내역은 기재한 이메일로 전송되었으며, 미입력시 고객센터에 문의해주세요.<br>
	</div>
</div>
<% } %>
</div>
<div class="order_middle_unbox">
<input class="btn btn-outline-secondary" type="button" style="margin: 50px 0px; padding: 20px;" onclick="pageMove()" value="주문리스트 보기">
</div>
<div class="order_middle_name">주문내역 <div></div></div>
<div class="order_middle_box">
	<div class="order_middle_box1">
		<div class="order_middle_box1_top" >
		<div class="order_middle_box1_title">주문번호</div>
		<div class="order_middle_box1_data1" ><%= odto.getOrderID() %></div>
		</div>
		<div class="order_middle_box1_botton">
		<div class="order_middle_box1_title">주문날짜</div>
		<div class="order_middle_box1_data2"><%=odto.getOrderTime().substring(0, 10)%></div>
		<div class="order_middle_box1_data1">(<%=odto.getOrderTime().substring(11, 19)%>)</div>
		</div>
	</div>
	<div class="order_middle_box2">
		<div class="order_middle_box2_title">주문상품</div>
			<%for(int StoreItems = 0; StoreItems<list.size(); StoreItems++){ %>
			<table style="padding-left: 20px; padding-right: 20px;">
				<tr>
					<td rowspan="3"><img src="resources/storeimages/<%= list.get(StoreItems).getImage() %>.jpg" width="100px" height="100px"></td>
					<td class="order_middle_box2_goodsname" colspan="2"><%= list.get(StoreItems).getProductName() %></td>
				</tr>
				<tr>
					<td class="order_middle_box2_goodsinfo" colspan="2">사이즈(<%= list.get(StoreItems).getPsize() %>) 컬러(<%= list.get(StoreItems).getColor() %>) 갯수(<%= list.get(StoreItems).getAmount() %>)</td>
				</tr>
				<tr>
					<td class="order_middle_box2_goodsinfo"><%= list.get(StoreItems).getPrice() %>원 x (<%= list.get(StoreItems).getAmount() %>개)</td>
					<td class="order_middle_box2_goodsprice">상품합계 : <%= list.get(StoreItems).getPrice() * list.get(StoreItems).getAmount() %>원</td>
				</tr>
			</table>
		<%} %>
		<div class="order_middle_box2_goodstotal">배 송 비 : <% int delivery = 3500; if(odto.getTotalPrice() >= 103500) { delivery = 0;} %> <%= delivery %>원</div>
		<div class="order_middle_box2_goodstotal2">총 결제금액 : <%= odto.getTotalPrice() %>원</div>
	</div>
	<div class="order_middle_box3">
		<div class="order_middle_box3_title">배송지 정보</div>
		<div class="order_middle_box3_data2"><%= odto.getUserName() %>, <%= odto.getPhoneNumber() %></div>
		<div class="order_middle_box3_data2">(<%= odto.getPostNumber() %>) <%= odto.getRodeAddress() %> <%= odto.getDetailAddress() %>,</div>
		<div class="order_middle_box3_data2"><%= odto.getHouseAddress() %> <%= odto.getDetailAddress() %></div>
		<div class="order_middle_box3_title" style="padding-top:20px;">결제정보</div>
		<% if(odto.getPayMethod().equals("무통장입금")){ %>
		<div class="order_middle_box3_data2"><%=odto.getPayMethod() %>(<%=odto.getOrderState()%>)</div>
			<% if(odto.getOrderState().equals("입금대기")){ %>
			<div class="order_middle_box3_data2">입금기한 : <a style="font-weight: bold; color: blue;"><%=odto.getOrderTime().substring(0, 10)%> 23:59 </a> 까지</div>
			<div class="order_middle_box3_title" style="padding-top:20px;">입금 계좌</div>
			<div class="order_middle_box3_data2">국민은행 123456-78-901234</div>
			<div class="order_middle_box3_data2">신한은행 234-567-891234</div>
			<div class="order_middle_box3_data1">(예금주 : AconTeam3DogProject)</div>
			<% } %>
		<% } else { %>
		<div class="order_middle_box3_data2"><%=odto.getPayMethod() %><% if(odto.getPaymethodcard() != null ){ %>(<%=odto.getPaymethodcard()%>)<% } else { %>(카카오머니)<% } %></div>
			<% if(odto.getPayMethod().equals("신용카드")){ %>
			<div class="order_middle_box3_data2"><%=odto.getPaymethodnumber().substring(0, 4)%>-<%=odto.getPaymethodnumber().substring(4, 8)%>-<%=odto.getPaymethodnumber().substring(8, 12)%>--<%=odto.getPaymethodnumber().substring(12, 16)%></div>
			<% } %>
		<% } %>
</div>
</div>
<br>
<jsp:include page = "../common/footer.jsp" flush="true"/>
</body>
</html>