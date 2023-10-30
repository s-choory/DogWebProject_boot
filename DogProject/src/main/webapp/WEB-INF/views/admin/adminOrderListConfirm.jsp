<%@page import="com.example.dto.OrdersDTO"%>
<%@page import="org.springframework.data.domain.jaxb.SpringDataJaxb.OrderDto"%>
<%@page import="com.example.dto.NoticeDTO"%>
<%@page import="com.example.dto.GoodsDTO"%>
<%@page import="com.example.dto.ChatRoomDTO"%>
<%@page import="com.example.dto.RequestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<style type="text/css">
	
	.table-container{
		margin-left: 10%;
		margin-right: 10%;
	}
	.action{
		width:150px;
	}
	.action2{
		width:80px;
	}

</style>
</head>
<!-- 부트스트랩 코드 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript">


function UpdateOrderState2(OrderID) {
	if (confirm("정말 "+OrderID+"번 주문을 입금 확인 하겠습니까?") == true) {
		location.href="adminUpdateOrderState2?OrderID="+OrderID;
	}
}

</script>
<body>
    <header>
        <h1 style="text-align: center; margin: 30px 0; ">주문 확정 목록</h1>
    </header>
    <div style="text-align: center; margin-bottom: 30px;">
    	<a href="adminPage" >관리자페이지로 이동</a><br><br>
    	<a href="adminOrderList" > 주문 입금대기 목록으로 이동</a><br><br>
	</div>
    <div class="table-container">
    <table class="table">
    	<tr class="table-warning" style="font-weight: bolder;">
    		<td>ID</td>
    		<td>주문명</td>
    		<td>주문자</td>
    		<td>생성날짜</td>
    		<td>도로명주소</td>
    		<td>상세주소</td>
    		<td>전화번호</td>
    		<td>결제방식</td>
    		<td>주문현황</td>
    		<td>action</td>
    	</tr>
    	<% 
    	List<OrdersDTO> list = (List<OrdersDTO>)request.getAttribute("oList"); 
    		for(int i = 0; i<list.size(); i++){
    			OrdersDTO oDTO = list.get(i);
    	%>
    	<tr class="table-light">
    		<td><%= oDTO.getOrderID() %></td>
    		<td><%= oDTO.getOrderName() %></td>
    		<td><%= oDTO.getUserID() %></td>
    		<td><%= oDTO.getOrderTime() %></td>
    		<td><%= oDTO.getRodeAddress() %></td>
    		<td><%= oDTO.getDetailAddress() %></td>
    		<td><%= oDTO.getPhoneNumber() %></td>
    		<td><%= oDTO.getPayMethod() %></td>
    		<td><%= oDTO.getOrderState() %></td>
    		<td class="action2"><button class="btn btn-primary" onclick="UpdateOrderState2(<%=oDTO.getOrderID()%>)">배송완료</button></td>
    	</tr>
    	<%} %>
    </table>
    </div>

</body>
</html>