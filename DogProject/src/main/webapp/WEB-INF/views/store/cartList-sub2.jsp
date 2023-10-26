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
    	console.log(1);
    	$("#prod"+n).submit();
    	console.log(2);
    }
	
	
</script>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<!-- <div style="margin-left: 10%"> -->
<style type="text/css">

	.mx-auto {
    display: flex;
    margin-right: auto!important;
    margin-left: auto!important;
    justify-content: center;
	}
	#button {
    padding-top: 60px;
	}
	.btn-group-vertical {
    flex-direction: column;
    padding-top: 30;
	}
	table {
    display: flex;
    caption-side: bottom;
    border-collapse: collapse;
    justify-content: center;
    align-content: center;
    align-items: center;
    text-align: center;
	}
	.tr-total{
	padding-right: 350px;
	padding-left: 350px;
	text-align: center;
	}
	.tr-total td{
	padding-left: 230px;
	padding-right: 230px;
	text-align: center;
	}

	.button-box button{
	display: flex;
    padding-left: 20px;
    padding-right: 20px;
    margin-left: 100px;
    margin-right: 100px;
    flex-wrap: nowrap;
    justify-content: center;
    flex-direction: row;
    align-items: center;
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
	padding-top: 5px;
	padding-left: 20px;
	padding-right: 20px;
	}
	/* 체크박스 숨기기 */
	 input[type="checkbox"] {
	    display: none;
	}
	
	/* 커스텀 체크박스 이미지 설정 */
	 input[type="checkbox"] + label {
	    /* display: inline-block; */
	    width: 30px;
	    height: 30px;
	    background-image: url('resources/img/icon/check-off.png'); /* 여기에 원하는 이미지 파일 경로를 넣어주세요 */
		background-size: cover; /* 이미지 크기 조절 (원본 크기 유지) */
	    background-repeat: no-repeat;
	    cursor: pointer; /* 커서를 손가락으로 바꾸어 클릭 가능하게 만듭니다 */
	}
	
	/* 체크된 상태일 때 이미지 변경 */
	 input[type="checkbox"]:checked + label {
	    background-image: url('resources/img/icon/check-on.png'); /* 체크된 상태일 때의 이미지 파일 경로를 넣어주세요 */
	}
	
	/* 체크박스와 라벨을 정확하게 연결하기 위해 for 속성 사용 */
	/* 라벨에 "for" 속성이 사용되어야 합니다. */
	
	

	
	
</style>

<table width="90%" cellpadding="10" border="0" class="mx-auto">
	<tr>
		<td height="30">
	</tr>
	<tr>
		<td colspan="5" class="td_default"><!-- &nbsp;&nbsp;&nbsp; --> 
		<font size="5"><b>장바구니</b></font> <!-- &nbsp; -->
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
	</tr>
	<tr>
		<td class="td_default" align="center">
		<input type="checkbox" name="allCheck" id="allCheck"><label for="allCheck"></label><strong>전체선택</strong></td>
		<td class="td_default" align="center"><strong>주문번호</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="center"><strong>판매가</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td class="td_default" align="center"><strong>합계</strong></td>
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
List<CartDTO> list = (List<CartDTO>)request.getAttribute("list");
int totalPrice = 0;
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
			<img src="resources/storeimages/<%= Image %>.jpg" border="0" align="center" width="80" />
			</td>
				
			<td class="td_default" width="300" style='padding-left: 30px'>
		      	  	<form id="prod<%= i %>" action="goodsRetrieve" method="post">
					<input type="hidden" name="gProductID" value="<%=ProductID%>">
					<a href="#" onclick="prod(<%=i%>)"> <%= ProductName %> </a>
					</form>
				<br> <font size="2" color="#665b5f">[옵션 : 사이즈(<%= Psize %>)
					, 색상(<%= Color %>)]
			</font></td>
		
			<td id= "price<%= num %>" class="td_default" align="center" width="110">
				<%= Price %>
			</td>
			<td class="td_default" align="center" width="90"><input
				class="input_default" type="text" name="cartAmount"
				id="cartAmount<%=num%>" style="text-align: right" maxlength="3"
				size="2" value="<%= Amount %>"></input></td>
					<td class="btn-group-vertical" role="group" aria-label="Vertical button group" >
					  <button type="button" class="btn btn-secondary btn-sm" style="font-size:8px;" onclick="amountup(<%=num%>)">∧</button>
					  <button type="button" class="btn btn-secondary btn-sm" style="font-size:8px;" onclick="amountdown(<%=num%>)">∨</button>
					</td>
			<td class="td_default" align="center" width="80"
				style='padding-left: 5px'><span id="sum<%=num%>">
				<%= Price*Amount %>
				</span></td>
			<td><input type="button" value="주문"
				onclick="order(<%=num%>, '<%=UserID%>')"></td>
			<td class="td_default" align="center" width="30"
				style='padding-left: 10px'><input type="button" value="삭제"
				data-xxx="<%= num %>" class="delCart" onclick="delCart(<%=num%>)"></td>
			<td height="10"></td>
		</tr>
		
<%	
	totalPrice += Price*Amount;
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
			<span id="totalPrice"><%= totalPrice %>원</span>
		</dd>
	</dl>
	<span class="priceimg"><img src="resources/img/icon/plus.png"></span>
	<dl>	
		<dt>
			총 배송비
		</dt>
		<dd>
			<span id="deliveryCharge">3500원</span>
		</dd>
	</dl>
	<span class="priceimg"><img src="resources/img/icon/equal.png"></span>
	<dl>	
		<dt>
			총 결제예정금액
		</dt>
		<dd>
			<span id="totalOrderPrice"><%= totalPrice + 3500 %>원</span>
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
<jsp:include page = "../common/footer.jsp" flush="true"/>
    