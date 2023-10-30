<%@page import="com.example.dto.UsersDTO"%>
<%@page import="com.example.dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
int OrderID = (int)session.getAttribute("OrderID"); 
List<CartDTO> list = (List<CartDTO>)session.getAttribute("orderList"); 
UsersDTO user = (UsersDTO)session.getAttribute("User"); 
int total = 0;
String email = user.getEmail1() + "@" + user.getEmail2();


%>
<meta charset="UTF-8">
<link href="resource/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/resource/styles/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/resource/styles/cart.css">
<link rel="stylesheet" type="text/css" href="resources/resource/styles/cart_responsive.css">
<title>상품주문</title>
<!-- 포트원 결제 -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- 포트원 결제 -->
<script>
function payMethod() {
	if($(".payChoice:checked").val() === "신용카드"){
		console.log("신용카드");
		requestPay();
	} else if ($(".payChoice:checked").val() === "토스페이"){
		console.log("토스페이");
		requestPay();
	} else if ($(".payChoice:checked").val() === "무통장입금"){
		console.log("무통장입금");
		$("#validation-form").attr("action", "orderConfirmation");
		$("#validation-form").submit();
	}
}  

var IMP = window.IMP; 
IMP.init("imp67011510"); 

function requestPay() {
	
	var rp_pg = "";
	var rp_merchant_uid = $("#OrderID").val();
	var rp_merchant_uid2 = $("#UserID").val();
	var rp_name = $("#mname").val();
	var rp_amount = $("#PaymentAmount").val();
	var rp_buyer_email = $("#Email").val();
	var rp_buyer_name = $("#orderName").val();
	var rp_buyer_tel = $("#phone").val();
	var rp_buyer_addr = $("#sample4_roadAddress").val();
	var rp_buyer_postcode = $("#sample4_postcode").val();
	if($(".payChoice:checked").val() === "신용카드") {
		rp_pg = 'html5_inicis.INIpayTest';
	} else if($(".payChoice:checked").val() === "토스페이"){
		//rp_pg = 'kakaopay.TC0ONETIME'; //카카오페이
		rp_pg = 'tosspay.tosstest'; //토스페이로 변경시 60줄,317줄 코드 변경
	}//if, else if end
 
	IMP.request_pay({
		pg : rp_pg,
		pay_method : 'card',
		merchant_uid : rp_merchant_uid2+rp_merchant_uid,
		name : rp_name,
		amount : rp_amount,
		buyer_email : rp_buyer_email,
		buyer_name : rp_buyer_name,
		buyer_tel : rp_buyer_tel,
		buyer_addr : rp_buyer_addr,
		buyer_postcode : rp_buyer_postcode,
		bypass : {
	        acceptmethod : "noeasypay"
		}//bypass end
	},// IMP.request_pay {} end
	function (data) {
	if (data.success) {
		var msg = "결제 완료";
		msg += '고유ID : ' + data.imp_uid; 
		msg += '// 상점 거래ID : ' + data.merchant_uid; 
		msg += '// 결제 금액 : ' + data.paid_amount; 
		msg += '// 카드 승인번호 : ' + data.apply_num; 
		console.log(msg);
		console.log(data); //imp_uid로 아임포트로부터 결제정보 조회
		console.log(data.card_name); //imp_uid로 아임포트로부터 결제정보 조회
		console.log(data.card_number); //imp_uid로 아임포트로부터 결제정보 조회
		$("#cardname").val(data.card_name);
		$("#cardnumber").val(data.card_number);
		$("#validation-form").attr("action", "orderConfirmation");
		$("#validation-form").submit();
	} else {
		var msg = "결제 실패";
		msg += '에러 내용 : ' + data.error_msg; ;
		console.log(msg);
	}
	} ) //IMP.request_pay () end;
}//function requestPay() end
</script>
<script type="text/javascript">
$(function(){

	$("#bankTransferInfo").slice(0).hide();
	$("#kakaoPayInfo").slice(0).hide();
	
	$("#bankTransfer").on("click",function(){
			$("#bankTransferInfo").slice(0).show();
			$("#creditCardInfo").hide();
			$("#kakaoPayInfo").hide();
	})
	$("#creditCard").on("click",function(){
			$("#bankTransferInfo").hide();
			$("#creditCardInfo").slice(0).show();
			$("#kakaoPayInfo").hide();
	})
	$("#kakaoPay").on("click",function(){
			$("#bankTransferInfo").hide();
			$("#creditCardInfo").hide();
			$("#kakaoPayInfo").slice(0).show();
	})
})
	/* //form submin 이벤트 발생시, 문구출력 후 서브밋정지
	window.addEventListener('load', () => {
		  const forms = document.getElementsByClassName('validation-form');
		  Array.prototype.filter.call(forms, (form) => {
		    form.addEventListener('submit', function (event) {
		      if (form.checkValidity() === false) {
		        event.preventDefault();
		        event.stopPropagation();
		      }
		      form.classList.add('was-validated');
		    }, false);
		  });
		}, false);	 */
	
	
	//배송정보 전달버튼
	$(document).ready(function(){	
		$("#same").on("click",function(){
			if(this.checked){
				$("#orderName").val($("#mname").val());
				$("#sample4_postcode").val($("#mpost").val());
				$("#sample4_roadAddress").val($("#maddress1").val());
				$("#sample4_jibunAddress").val($("#maddress2").val());
				$("#sample4_detailAddress").val($("#maddress3").val());
				$("#phone").val($("#mphone").val());
			}else{
				$("#orderName").val("");
				$("#sample4_postcode").val("");
				$("#sample4_roadAddress").val("");
				$("#sample4_jibunAddress").val("");
				$("#sample4_detailAddress").val("");
				$("#phone").val("");
			}
		});//end click 
		
		
	    //주문버튼 - 보류기능
// 	    $("#payBtn").on("click",function(){
//         	$(".validation-form").submit();
//         });
		
		
	});	
</script>
<style>
body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	}
.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.cart_container {
	padding-top: 0px;
	padding-bottom: 0px;
}
. bankTransfer {
	border: 1px #ccc;

}
</style>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<div class="super_container">
		<form id="validation-form" method="post">
			<div class="container mx-auto">
				<div class="input-form-backgroud row">
					<div class="input-form col-md-12 mx-auto">
						<h4 class="mb-3">주문자 정보</h4>
						<div class="row">

							<!-- 입력란 시작 -->
							<div class="col-md-3 mb-3">
								<label for="name">이름</label> <input type="text"
									class="form-control" name="mname" id="mname" placeholder="이름"
									value="<%= user.getUserName() %>" required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="name">전화번호</label> <input type="text"
									class="form-control" name="mphone" id="mphone"
									placeholder="전화번호" value="<%= user.getPhoneNumber() %>" required>
								<div class="invalid-feedback">전화번호를 입력해주세요.</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="name">우편번호</label> <input type="text"
									class="form-control" name="mpost" id="mpost" placeholder="우편번호"
									value="<%=user.getPost() %>" required>
								<div class="invalid-feedback">우편번호를 입력해주세요.</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="name">도로명주소</label> <input type="text"
									class="form-control" name="addr1" id="maddress1"
									placeholder="도로명주소" value="<%= user.getRodeAddress()%>" required>
								<div class="invalid-feedback">도로명주소를 입력해주세요.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="nickname">지번주소</label> <input type="text"
									class="form-control" name="addr2" id="maddress2"
									placeholder="지번주소" value="<%= user.getHouseAddress()%>" required>
								<div class="invalid-feedback">지번주소를 입력해주세요.</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 mb-3">
								<label for="name">상세주소</label> <input type="text"
									class="form-control" name="addr3" id="maddress3"
									placeholder="상세주소" value="<%= user.getDetailAddress()%>" required>
								<div class="invalid-feedback">상세주소를 입력해주세요.</div>
							</div>
						</div>

						<!-- 체크박스 -->
						<div class="mb-1"></div>
						<div class="form-check col-md-12">
							<input class="form-check-input" type="checkbox" value=""
								id="same"> <label class="form-check-label"
								for="flexCheckDefault"> 배송지가 동일할 경우 선택하세요. </label>
							<hr class="mb-4">
						</div>



						<h4 class="mb-3">배송지 정보</h4>
						<!-- 입력란 시작 -->
						<div class="row">
							<div class="col-md-3 mb-3">
								<label for="name">이름</label> <input type="text"
									class="form-control" name="UserName" id="orderName"
									placeholder="이름" required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="name">전화번호</label> <input type="text"
									class="form-control" name="PhoneNumber" id="phone" placeholder="전화번호"
									required>
								<div class="invalid-feedback">전화번호를 입력해주세요.</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="name">우편번호</label> <input type="text"
									class="form-control" name="PostNumber" id="sample4_postcode"
									placeholder="우편번호" required>
								<div class="invalid-feedback">우편번호를 입력해주세요.</div>
							</div>
							<div class="col-md-3 mb-3">
								<br> <input type="button" class="btn btn-dark"
									value="우편번호 찾기" onclick="sample4_execDaumPostcode()">
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="name">도로명주소</label> <input type="text"
									class="form-control" name="RodeAddress" id="sample4_roadAddress"
									placeholder="도로명주소" value="" required>
								<div class="invalid-feedback">도로명주소를 입력해주세요.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="name">지번주소</label> <input type="text"
									class="form-control" name="HouseAddress" id="sample4_jibunAddress"
									placeholder="지번주소" value="" required>
								<div class="invalid-feedback">지번주소를 입력해주세요.</div>
							</div>
							<div class="col-md-12 mb-3">
								<label for="name">상세주소</label> <input type="text"
									class="form-control" name="DetailAddress" id="sample4_detailAddress"
									placeholder="상세주소" value="" required>
								<div class="invalid-feedback">상세주소를 입력해주세요.</div>
							</div>
							<div class="col-md-12 mb-3">
								<label for="name">요청사항(선택)</label> <input type="text"
									class="form-control" name="Requested" id="sample4_Requested" style="height: 100px;"
									placeholder="배송관련 요청사항을 입력해주세요." value="">
								<div class="invalid-feedback">배송관련 요청사항을 입력해주세요.</div>
							</div>
						</div>
						<hr class="mb-4">
						<input type="radio" name="PayMethod" class="payChoice" id="creditCard" value="신용카드" checked> 신용카드
						<input type="radio" name="PayMethod" class="payChoice" id="kakaoPay" value="토스페이"> 토스페이
						<input type="radio" name="PayMethod" class="payChoice" id="bankTransfer" value="무통장입금"> 무통장입금
						<div class="form-control" id="creditCardInfo" style="color:black; font-size:13px; margin-top: 17px;">
						※결제지원 카드사<br>
						신한, 비씨(페이북), 현대, 롯데, 하나, 삼성, 국민, 우리, 농협, 씨티, 신협, 광주, 수협, 전북, 제주, 우체국, KDB산업, 저축은행, MG새마을, 해외VISA, 해외MASTER, 해외JCB, 은련(해외카드), KB증권, 카카오뱅크, 미래에셋대우, 토스뱅크, 우리비씨, 삼성앱신용카드<br>				
						</div>
						<div class="form-control" id="kakaoPayInfo" style="color:black; font-size:13px; margin-top: 17px;">
						※결제지원 방식<br>
						QR결제 : 스마트폰 카메라 및 모든 QR스캐너로 스캔하여 결제하는 방식
						연락처 : 휴대폰번호, 생년월일을 입력하여 결제요청 메시지를 토스 어플로 받아 결제하는 방식
						</div>
						<div class="form-control" id="bankTransferInfo" style="color:black; font-size:13px; margin-top: 17px;">
						※무통장입금 전용 입금계좌<BR>
						국민은행 : 123456-78-901234 (예금주 : AconTeam3DogProject)<br>
						신한은행 : 234-567-891234 (예금주 : AconTeam3DogProject)
						</div>
					</div>
				</div>
			</div>
			<br>

			<!-- 상품정보,헤더 -->
			<div class="cart_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div
								class="cart_bar d-flex flex-row align-items-center justify-content-start">
								<div class="cart_bar_title_name">Product</div>
								<div class="cart_bar_title_content ml-auto">
									<div
										class="cart_bar_title_content_inner d-flex flex-row align-items-center justify-content-end">
										<div class="cart_bar_title_price l-5">Price</div>
										<div class="cart_bar_title_quantity">Quantity</div>
										<div class="cart_bar_title_total">Total</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- 레코드 시작부 -->
					<div class="row">
						<div class="col">
							<div class="cart_products">
								<ul>
									<% for(int i=0;i<list.size();i++) { 
										total += list.get(i).getPrice() * list.get(i).getAmount(); 
									%>
									<li
										class=" cart_product d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">

										<!-- 상품 이미지 -->
										<div class="cart_product_image">
											<img src="resources/storeimages/<%= list.get(i).getImage() %>.jpg" alt="" width="100">
										</div> <!-- 상품 이름 -->
										<div class="cart_product_name" id="mainName<%=i%>" value="<%= list.get(i).getProductName() %>">
											<a><%= list.get(i).getProductName() %></a><br> <font size="2"
												color="#665b5f">옵션 : <%= list.get(i).getPsize() %> / 색상 : <%= list.get(i).getColor() %></font>
										</div>
										<div class="cart_product_info ml-auto">
											<div
												class="cart_product_info_inner d-flex flex-row align-items-center justify-content-md-end justify-content-start">
												<!-- 상품 가격 -->
												<div class="cart_product_price"><%= Integer.toString(list.get(i).getPrice()).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",")%> 원</div>
												<!--상품 수량 -->
												<div class="cart_product_price"><%= list.get(i).getAmount() %> 개</div>
												<!-- 총합 가격 -->
												<div class="cart_product_total" id="sum"><%= Integer.toString(list.get(i).getPrice() * list.get(i).getAmount()).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",") %> 원</div>
											</div>
										</div>
									</li>
									<% } %>
								</ul>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div id="deliveryPrice" style="text-align: right; font-size: 18px; padding: 30px 10px 0px 0px;">
								배송비 : <% int delivery_fee = 3500; if(total >= 100000){delivery_fee = 0;}%> <%= Integer.toString(delivery_fee).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",") %>원
							</div>
							<div id="totalPrice" style="text-align: right; font-size: 18px; font-weight: bold; padding: 30px 10px 30px 0px; border-bottom: solid 1px #b5b5b5">
								총 결제금액 : <%= Integer.toString(total+delivery_fee).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",") %> 원
							</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" id="PaymentAmount" name="TotalPrice" value="<%=total + delivery_fee %>">
			<input type="hidden" id="OrderID" name="OrderID" value="<%=OrderID %>">
			<input type="hidden" id="Email" name="Email" value="<%=email %>">
			<input type="hidden" id="UserID" name="UserID" value="<%=user.getUserID() %>">
			<input type="hidden" id="cardname" name="cardname" value="">
			<input type="hidden" id="cardnumber" name="cardnumber" value="">
		</form>
			<div class="cart_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div
								class="cart_control_bar d-flex flex-md-row flex-column align-items-start justify-content-start">
								<button class="button_clear cart_button" id="delAllCart">Cancel</button>
								<!-- 계속쇼핑하기버튼 -->
								<button onclick="payMethod()" class="button_update cart_button_2 ml-md-auto"
									id="payBtn">Payment</button>
							</div>
						</div>
					</div>
				</div>
			</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
 function sample4_execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
             var extraRoadAddr = ''; // 도로명 조합형 주소 변수

             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraRoadAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraRoadAddr !== ''){
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
             }
             // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
             if(fullRoadAddr !== ''){
                 fullRoadAddr += extraRoadAddr;
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
             document.getElementById('sample4_roadAddress').value = fullRoadAddr;
             document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

             // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
             if(data.autoRoadAddress) {
                 //예상되는 도로명 주소에 조합형 주소를 추가한다.
                 var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                 document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
             } else if(data.autoJibunAddress) {
                 var expJibunAddr = data.autoJibunAddress;
                 document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

             } else {
                 document.getElementById('guide').innerHTML = '';
             }
         }
     }).open();
 }
</script>
</div>
<script src="resources/resource/js/cart_custom.js"></script>
<br>
<jsp:include page = "../common/footer.jsp" flush="true"/>
</body>
</html>