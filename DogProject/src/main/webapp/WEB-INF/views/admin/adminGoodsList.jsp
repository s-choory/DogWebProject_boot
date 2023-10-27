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
<title>모임 조회</title>
<style type="text/css">
	
	.table-container{
		margin-left: 20%;
		margin-right: 20%;
	}
	.action{
		width:150px;
	}
	.action2{
		width:130px;
	}

</style>
</head>
<!-- 부트스트랩 코드 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript">

function openAddProduct() {
	var w = 500;
	var h = 400;
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	var yPos = (document.body.offsetHeight/2) - (h/2);
	
 	window.open("adminAddProductForm", "_blank", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}

function deleteProduct(PRODUCTID) {
	if (confirm("정말 "+PRODUCTID+"번 상품을 삭제하겠습니까?") == true) {
		location.href="adminDeleteProduct?PRODUCTID="+PRODUCTID;
	}
}

</script>
<body>
    <header>
        <h1 style="text-align: center; margin: 30px 0; ">상품 목록</h1>
    </header>
    <div style="text-align: center; margin-bottom: 30px;">
    	<a href="adminPage" >관리자페이지로 이동</a><br><br>
	<button class="btn btn-success" onclick="openAddProduct()">상품 추가하기</button>
	</div>
    <div class="table-container">
    <table class="table">
    	<tr class="table-warning" style="font-weight: bolder;">
    		<td>상품 사진</td>
    		<td>상품 ID</td>
    		<td>상품 이름</td>
    		<td>카테고리</td>
    		<td>상세설명</td>
    		<td>가격</td>
    		<td>재고수량</td>
    		<td>action</td>
    	</tr>
    	<% 
    	List<GoodsDTO> list = (List<GoodsDTO>)request.getAttribute("gList"); 
    		for(int i = 0; i<list.size(); i++){
    		GoodsDTO gDTO = list.get(i);
    	%>
    	<tr class="table-light">
    		<td><img src="resources/storeimages/<%=gDTO.getImage() %>.jpg" width="100" height="100"></td>
    		<td><%= gDTO.getPRODUCTID() %></td>
    		<td><%= gDTO.getPRODUCTNAME() %></td>
    		<td style="width: 50px;"><%= gDTO.getCategory() %></td>
    		<td><%= gDTO.getContent() %></td>
    		<td><%= gDTO.getPrice() %></td>
    		<td><%= gDTO.getSTOCKQUANTITY() %></td>
    		<td class="action2"><button class="btn btn-danger" onclick="deleteProduct(<%=gDTO.getPRODUCTID()%>)">상품 삭제</button></td>
    	</tr>
    	<%} %>
    </table>
    </div>

</body>
</html>