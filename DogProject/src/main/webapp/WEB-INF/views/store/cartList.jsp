<%@page import="com.example.dto.CartDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script type="text/javascript">

	
	function delCheckedCart(){
		if(confirm("선택한 상품 목록을 삭제하시겠습니까?")){
			var checkedList = [];
			var j = 0;
			for (let i of $(".check")) {
				if(i.checked){
					checkedList[j] = i.value;
					j++;
				}
			}
			location.href = "CartCheckedDel?checkedList="+checkedList;
		}
	}
	
	function orderCheckedConfirm(){
		var checkedList = [];
		var j = 0;
		for (let i of $(".check")) {
			if(i.checked){
				checkedList[j] = i.value;
				j++;
			}
		}
		location.href = "CartOrderListConfirm?checkedList="+checkedList;
	}
	
	function order(num, userid){
		location.href = "CartOrderOneConfirm?num="+num+"&&userid="+userid;
	}
	
	function delAllCart(){
		if(confirm("장바구니 목록을 모두 삭제하시겠습니까?")){
			location.href = "DelAllCartList";
		}
			
	}
	// 수량 증가, 감소
	function amountup(n){
		$.ajax({
			type: "get",
			url: "CartAmountUpdate",
			dataType: "text",
			
			data:{
				num: n,
				Amount:parseInt($("#cartAmount"+n).attr("value"))+1	//이 데이터가 없으면 파라미터로 전달하지 못한다.
			},
			success: function(data, status, xhr){
				console.log(data);
				num = parseInt($("#cartAmount"+n).attr("value"))+1;
				price = parseInt(($("#price"+n).text()).trim());
			
				$("#cartAmount"+n).attr("value",num);
				$("#sum"+n).text(price*num);
				$("#totalPrice").text(parseInt($("#totalPrice").text())+price+'원');
				$("#totalOrderPrice").text(parseInt($("#totalOrderPrice").text())+price+'원');
			},
			error: function(xhr, status, error){
				console.log("error",error);
				console.log("xhr",xhr.status);
				$("#result").text("데이터를 가져올 수 없습니다.");
				}
			});	//end ajax
	};


	function amountdown(n){
		$.ajax({
			type: "get",
			url: "CartAmountUpdate",
			dataType: "text",
			
			data:{
				num: n,
				Amount:parseInt($("#cartAmount"+n).attr("value"))-1	//이 데이터가 없으면 파라미터로 전달하지 못한다.
			},
			success: function(data, status, xhr){
				
				num = parseInt($("#cartAmount"+n).attr("value"))-1;
				price = parseInt(($("#price"+n).text()).trim());
				if(num > 0){
					$("#cartAmount"+n).attr("value",num);
					$("#sum"+n).text(price*num);
					$("#totalPrice").text(parseInt($("#totalPrice").text())-price+'원');
					$("#totalOrderPrice").text(parseInt($("#totalOrderPrice").text())-price+'원');
				}
			},
			error: function(xhr, status, error){
				console.log("error",error);
				console.log("xhr",xhr.status);
				$("#result").text("데이터를 가져올 수 없습니다.");
				}
			});	//end ajax
	};
				
	
	$(function(){
		$("#allCheck").attr("checked", "checked");
		$(".check").attr("checked", "checked");
		
		//전체선택
		$("#allCheck").click(function(){
			if($(".check").attr("checked")){
				$(".check").attr("checked", false);
			}else{
				$(".check").attr("checked", "checked");
			}
		})
		
		//단일상품 삭제
		$(".delCart").click(function(){
			var num = $(this).attr("data-xxx")
			location.href = "delCartList?CartNum="+num;
		})
		
	})
	
	function prod(n){
    	$("#prod"+n).submit();
    }
	
	
</script>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<!-- <div style="margin-left: 10%"> -->
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
<style type="text/css">

	#button {
    padding-top: 60px;
	}
	.btn-group-vertical {
    flex-direction: column;
    padding-top: 35px;
	}
	table {
		width: 70%;
	}
	strong{
	margin: -91px;
	}

	.button-box button{
	display: flex;
    padding-left: 20px;
    padding-right: 20px;
    margin-top:30px;
    margin-left: 50px;
    margin-right: 100px;
    flex-wrap: nowrap;
    justify-content: center;
    flex-direction: row;
    align-items: center;
    font-weight: bolder;
	}
	td.td_default p{
	display: flex;
	text-align: center;
	}
	.total-price{
	display: flex;
	text-align: center;
	justify-content: center;
	position: relative;
	}
	.total-price dl {
    display: table-cell;
    padding: 5px 10px 5px 10px;
    font-size: 16px;
    text-align: right;
    padding-right: 10px;
	}
	.priceimg {
	size: 30px;
	padding-top: 15px;
	padding-left: 20px;
	padding-right: 20px;
	}
	.priceimg2 {
	size: 30px;
	padding-top: 5px;
	padding-left: 20px;
	padding-right: 20px;
	}
	
	/* 체크박스 숨기기 */
	input[type="checkbox"] {
	    display: none;
	}
	
	input[type="checkbox"] + label {
	    width: 20px;
	    height: 20px;
	    background-image: url('resources/img/icon/check-off.png'); 
		background-size: cover; 
	    background-repeat: no-repeat;
	    cursor: pointer;
	    margin: -5px;
	}
	
	input[type="checkbox"]:checked + label {
	    background-image: url('resources/img/icon/check-on.png'); /* 체크된 상태일 때의 이미지 파일 경로를 넣어주세요 */
	}
	hr{
	margin: 0;
	}
	.Cart-img {
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    margin-bottom: 20px;
	}

	.Cart-img img {
    max-width: 250px;
    max-height: 250px;
	}
	a{
    	text-decoration: none;
    	color: black;
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
    .no-data img{
    	height: 450px;
    	width: 300px;
    	padding-bottom: 25px;
    }	
    td{
    margin-bottom: 30px;
    }
    .btn-group-vertical>.btn-group:not(:last-child)>.btn, .btn-group-vertical>.btn:not(:last-child):not(.dropdown-toggle) {
    border-radius: 7px;
    margin-bottom: 7px
	}
	.btn-group-vertical>.btn-group:not(:first-child)>.btn, .btn-group-vertical>.btn~.btn {
  /*   border-top-left-radius: 0;
    border-top-right-radius: 0; */
    border-radius: 7px;
	}
	input {
	border: initial;
	}
	
</style>
<!-- <div class="Cart-img"><img src="resources/img/dog/cart-img.png"></div> -->
<%
List<CartDTO> list = (List<CartDTO>)request.getAttribute("list");
if(list.isEmpty()){
 	%>
 	<div class="no-data">
    	<div><img src="resources/img/dog/nodata.png" alt="No Results Found"></div><br>
    	<div><p>장바구니에 담겨있는 상품이 없습니다</p></div>
    </div>
<% } else { %>
<div class="Cart-img"><img src="resources/img/dog/cart-img.png"></div>



<!-- <div class="Cart-img"><img src="resources/img/dog/cart-img.png"></div>
 -->


<table cellpadding="10" class="mx-auto">

<!-- 	<tr>
		<td height="30">
	</tr>
	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; 
		<font size="5"><b>장바구니</b></font> &nbsp;
		</td>
	</tr>
	<tr>
		<td height="15">
	</tr>
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="7">
	</tr> -->
	<tr>
		<td class="td_default" align="center"><strong>전체선택</strong>
		<input type="checkbox" name="allCheck" id="allCheck"><label for="allCheck"></label></td>
		<td class="td_default" align="center"><strong>주문번호</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="center"><strong>판매가</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td class="td_default" align="center"><strong>합계</strong></td>
		<td></td>
		<td></td>
	</tr>

	<tr>
		<td height="7">
	</tr>
	
	
	
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
<%
int totalPrice = 0;
int deliveryCharge= 0; 		
	for(int i=0; i < list.size(); i++){
		int num = list.get(i).getCartNum();
		String UserID = list.get(i).getUserID();
		int ProductID = list.get(i).getProductID();
		String ProductName = list.get(i).getProductName();
		int Price = list.get(i).getPrice();
		String Psize = list.get(i).getPsize();
		String Color = list.get(i).getColor();
		int Amount = list.get(i).getAmount();
		String Image = list.get(i).getImage();

%>	

    
<%-- <form id="prod<%= i %>" action="goodsRetrieve" method="post">
	 <input type="hidden" name="gProductID" value="<%=ProductID%>">
	 <a href="#" onclick="prod(<%=i%>)"></a>
</form> --%>

		<tr>
			
			<td class="td_default" width="80" id="selectbox">
			<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. -->
			<input type="checkbox" name="check" id="mycheck<%= num %>" class="check" value="<%= num %>"/><label for="mycheck<%= num %>"></label></td>
			<td class="td_default" width="80"><%= num %></td>
			<td class="td_default" width="80">
			<form id="prod<%= i %>" action="goodsRetrieve" method="post">
			<input type="hidden" name="gProductID" value="<%=ProductID%>">
			<a href="#" onclick="prod(<%=i%>)"><img src="resources/storeimages/<%= Image %>.jpg" border="" align="center" width="80" height="60" /></a>
			</form>
			</td>
				
			<td class="td_default" width="300" style='padding-left: 20px;'>
		      	  	<form id="prod<%= i %>" action="goodsRetrieve" method="post">
					<input type="hidden" name="gProductID" value="<%=ProductID%>">
					<a href="#" onclick="prod(<%=i%>)" style="font-weight: bolder;"> <%= ProductName %> </a>
					</form>
				<br> <font size="2" color="#665b5f">[옵션 : 사이즈(<%= Psize %>)
					, 색상(<%= Color %>)]
			</font></td>
		
			<td id= "price<%= num %>" class="td_default" align="center" width="150px" style="font-weight:600;">
				<%= Price %>원
			</td>
			<td class="td_default_amount" align="center" width="90"><input
				class="input_default" type="text" name="cartAmount"
				id="cartAmount<%=num%>" style="text-align: right" maxlength="3"
				size="2" value="<%= Amount %>"></input></td>
					<td class="btn-group-vertical" role="group" aria-label="Vertical button group" >
					  <button type="button" class="btn btn-secondary btn-sm" style="font-size:8px;" onclick="amountup(<%=num%>)">∧</button>
					  <button type="button" class="btn btn-secondary btn-sm" style="font-size:8px;" onclick="amountdown(<%=num%>)">∨</button>
					</td>
			<td class="td_default" align="center" width="150px"
				style='padding-left: 5px'><span id="sum<%=num%>" style="font-weight:600;" >
				<%= Price*Amount %>
				</span>원</td>
				
			<td width="130px">
			    <button class="orderButton btn btn-primary" onclick="order(<%=num%>, '<%=UserID%>')">주문</button>
			</td>
			
			<td width="130px">
			    <button class="deleteButton delCart btn btn-secondary" data-xxx="<%= num %>" onclick="delCart(<%=num%>)">삭제</button>
			</td>

				
				
<%-- 			<td><input type="button" value="주문"
				onclick="order(<%=num%>, '<%=UserID%>')"></td>
				
			<td class="td_default" align="center" width="30"
				style='padding-left: 10px'><input type="button" value="삭제"
				data-xxx="<%= num %>" class="delCart" onclick="delCart(<%=num%>)"></td> --%>	
				
			<td height="10"></td>
		</tr>
		<!-- 주문금액이 100000 이상 배송비 무료  -->
<%	
	totalPrice += Price*Amount;
	if (totalPrice >= 100000) {
		deliveryCharge = 0;
	}else {
		deliveryCharge = 3500;
		}
	int totalOrderPrice = totalPrice + deliveryCharge;
	}
%>

	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="20">
	</tr>
</table>

<div class="total-price">
	<dl>
		<dt>
			총 상품금액
		</dt >
		<dd>
			<span id="totalPrice" ><%= totalPrice %>원</span>
		</dd>
	</dl>
	<span class="priceimg"><img src="resources/img/icon/plus.png" width="30" height="30"></span>
	<dl>	
		<dt>
			총 배송비
		</dt>
		<dd>
			<span id="deliveryCharge"><%= deliveryCharge%>원</span>
		</dd>
	</dl>
	<span class="priceimg2"><img src="resources/img/icon/equal.png"></span>
	<dl>	
		<dt>
			총 결제예정금액
		</dt>
		<dd>
			<span id="totalOrderPrice" style="font-weight:600;">
			<%= totalPrice+deliveryCharge %>원
			</span>
		</dd>
	</dl>
	<!-- <div class="total-money"> -->
<%-- 		<div>
			<span id="totalPrice"><%= totalPrice %>원</span>
		</div>
		<div>
			<span id="deliveryCharge">3500원</span>
		</div>
		<div>
			<span id="totalOrderPrice"><%= totalPrice + 3500 %>원</span>
		</div> --%>
	<!-- </div> -->
</div>

<div class="button-box">
<table width="90%" cellspacing="0" cellpadding="0" border="0" class="mx-auto" id="button">
	<tr>
		<td colspan="5">
			<button class="btn btn-outline-Dark" onclick="orderCheckedConfirm()"> 선택한 상품 주문하기 </button>
		</td>
		<td colspan="5">
			<button class="btn btn-outline-danger" onclick="delAllCart()"> 장바구니 비우기</button>
		</td>
		<td colspan="5">
			<button class="btn btn-outline-danger" onclick="delCheckedCart()"> 선택한 상품 삭제하기</button>
		</td>
		<!-- <td>
			<a class="a_black" href="dogshop_main"> 계속 쇼핑하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
		</td> -->
	</tr>
	<tr>
		<td height="50">
	</tr>
</table>
</div>
<% } %>
<jsp:include page = "../common/footer.jsp" flush="true"/>
    