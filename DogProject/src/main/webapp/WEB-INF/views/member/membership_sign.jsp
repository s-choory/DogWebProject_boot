<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style type="text/css">
	body {
	    margin: 0;
	    padding: 0;
	    background-color: #3c3c3c; 
	    font-family: 'Exo', sans-serif;
  	}
  	
	.link-container {
		margin-left: 37%;
		margin-right: 37%;
		margin-top: 2%;
		color:white;
		text-align: center; /* 중앙 정렬을 위해 추가 */
		border-color: gray;
	}
	
	#로고{	
		margin-bottom: 20px;
	}
	
	.mem1 {
		position: fixed;
		bottom: 20px;
		left: 42%;
		transform: translateX(-50%);
		background-color: #7AFF7A;
		color: white;
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
		width: 200px;
		font-weight: bolder;
	}
	.mem2 {
		position: fixed;
		bottom: 20px;
		left: 58%;
		transform: translateX(-50%);
		background-color: #828282;
		color: #a0a0a0;
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
		width: 200px;
	}
	.form-list {
	    margin-bottom: 5px;
	    border: 1px solid #ccc;
	    background-color: #3c3c3c; /* 배경색 설정 */
	    color: white; /* 텍스트 색상 설정 */
	}
	
	.form-item {
	    border: 0.1px solid gray;
	    height:30px;
	    align-items: center;
	    padding : 10px;
	}
	
	.form-item label {
	    display: block; /* 라벨을 블록 레벨 요소로 만들어 좌측 정렬 */
	    margin-bottom: 5px; /* 라벨 아래 간격 설정 */
	}
	
	.zipcode-container {
	    display: flex;
	    align-items: center;
	}
	
	#zipcode-button {
		background: linear-gradient(135deg, #7AFF7A, #429F6B);
		border: 0px;
		height:30px;
	    margin-left: 10px; /* 원하는 간격으로 조정하세요 */
	    box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
	    font-size: 12px;
	    font-weight: bolder;
	    transition: transform 0.3s;
	}
	#zipcode-button:hover {
		transform: translateY(-5px);
	}

	#select_email {
		padding-left:5px;
		background: linear-gradient(135deg, #7AFF7A, #429F6B);
		height:30px;
	    font-size: 12px;
	    font-weight: bolder;
	    transition: transform 0.3s;
	}
	#select_email:hover{
		transform: translateY(-5px);
	}
	
	.form-item input[type="text"],
	.form-item input[type="password"] {
	    width: 100%;
	    padding: 5px;
	    border: none;
	    outline: none;
	    background-color: inherit; /* 부모 요소의 배경색을 상속 */
	    color: inherit; /* 부모 요소의 텍스트 색상을 상속 */
	}
	
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>

	$(function(){
		
    	
		//아이디 중복 이벤트
		$("#UserID").on("keyup",function(){
			$.ajax({
				type: "post",
				url: "idChk",
				dataType: "text",
				
				data:{
					UserID: $("#UserID").val()	//이 데이터가 없으면 파라미터로 전달하지 못한다.
				},
				success: function(data, status, xhr){
					$("#result").text(data);
					if(data == "사용불가 아이디입니다")
						$("#UserID").parent().attr("style","color:red");
					else if(data == "사용가능 아이디입니다")
						$("#UserID").parent().attr("style","");
				},
				error: function(xhr, status, error){
					console.log("error",error);
					console.log("xhr",xhr.status);
					$("#result").text("데이터를 가져올 수 없습니다.");
				}
			});	//end ajax
		});
		
		$("#UserAlias").on("keyup",function(){
			$.ajax({
				type: "post",
				url: "aliasChk",
				dataType: "text",
				
				data:{
					UserAlias: $("#UserAlias").val()	//이 데이터가 없으면 파라미터로 전달하지 못한다.
				},
				success: function(data, status, xhr){
					$("#result").text(data);
					if(data == "사용불가 별명입니다")
						$("#UserAlias").parent().attr("style","color:red");
					else if(data == "사용가능 별명입니다")
						$("#UserAlias").parent().attr("style","");
				},
				error: function(xhr, status, error){
					console.log("error",error);
					console.log("xhr",xhr.status);
					$("#result").text("데이터를 가져올 수 없습니다.");
				}
			});	//end ajax
		});
		
	})
</script>
<script type="text/javascript">
	<%	String msg = request.getParameter("msg");
	if(msg != null){%>
		Swal.fire('경고', '<%=msg%>', 'warning');
	<% } %>
	
    function All_check(){
        var validate = /^[a-zA-Z0-9]{4,12}$/; //id와 password 유효성 검사 정규식
        var n_validate = /^[가-힣]{2,15}$/; //이름 유효성검사 정규식
        var p_validate = /^(010)-\d{4}-\d{4}$|^(011)-\d{4}-\d{4}$|^(016)-\d{4}-\d{4}$|^(017)-\d{4}-\d{4}$|^(018)-\d{4}-\d{4}$|^(019)-\d{4}-\d{4}$|^\d{3}-\d{3,4}-\d{4}$/;
        
        var id = document.getElementById("UserID"); 
        var passwd = document.getElementById("Password"); 
        var passwd2 = document.getElementById("passwd2"); 
        var name = document.getElementById("UserName"); 
        var UserAlias = document.getElementById("UserAlias");
        var PhoneNumber = document.getElementById("PhoneNumber");
        var PostNumber = document.getElementById("sample4_postcode");
        
   /*id 유효성 검사  */
        
        if(id.value==''){
        	Swal.fire('경고', '아이디를 입력하세요.', 'warning');
            return false;
        }
        if(!validate.test(id.value)){
        	Swal.fire('경고', 'id는 4~12자의 영문 대&소문자와 숫자조합입니다.', 'warning');
            return false;
        }
        
        /*passwd 유효성 검사  */
        if(passwd.value==''){ 
        	Swal.fire('경고', '비밀번호를 입력하세요.', 'warning');
            return false;
        }
        if(!validate.test(passwd.value)){ 
        	Swal.fire('경고', 'passwd는 4~12자의 영문 대소문자와 숫자조합입니다.', 'warning');
            return false;
        }
   
        if(passwd2.value!=passwd.value){ 
        	Swal.fire('경고', '비밀번호가 일치하지 않습니다.', 'warning');
            return false;
        }
        
        /*이름 유효성 검사  */       
        if(name.value ==''){
        	Swal.fire('경고', '이름을 입력하세요', 'warning');
            return false;
        }
        
        if(!n_validate.test(name.value)){
        	Swal.fire('경고', '특수문자,영어,숫자는 사용할수 없습니다. 한글만 입력가능합니다.', 'warning');
            return false;
        }
       
        
        if(UserAlias.value ==''){
        	Swal.fire('경고', '별명을 입력하세요.', 'warning');
            return false;
        }
		
        if($("#result").text() === "사용불가 아이디입니다."){
        	Swal.fire('경고', '사용불가 아이디입니다. 아이디를 확인하세요', 'warning');
        	return false;
        }
        
        if(!p_validate.test(PhoneNumber.value)){
        	Swal.fire('경고', '휴대번호를 올바르게 입력하세요. (예: 010-1234-5678)', 'warning');
            return false;
        }
        
        if(!PostNumber.value){
        	Swal.fire('경고', '우편번호를 입력하세요', 'warning');
            return false;
        }
    	
        if(true){
        	Swal.fire('성공', '회원가입에 성공했습니다.<br><br>이메일과 반려견의 정보는<br>마이페이지에서 업데이트 가능합니다.', 'success');
        	return true;
        }
        
    }
       function input_email(){
       	document.getElementById("Email2").value=document.getElementById("select_email").value; 
       }
    
    </script>
</head>
<body>
<div class="link-container">
<a href="/app/"><img src="resources/로고아이콘.png" id="로고" width=80 height="60"><br></a>
	<form method="post" name="myForm" id="myForm" action="memberAdd" onsubmit="return All_check();">
		
<!-- 		<b>계정정보</b> -->
		<div class="form-list">
		    <div class="form-item">
		        <input type="text" placeholder="아이디" name="UserID" id="UserID" />
		    </div>
		
		    <div class="form-item">
		        <input type="password" placeholder="비밀번호" name="Password" id="Password">
		    </div>
		
		    <div class="form-item">
		        <input type="password" placeholder="비밀번호 확인" name="passwd2" id="passwd2">
		    </div>
		</div>
		        <span id="result"></span>
		<br> 
<!-- 		<b>회원정보</b> -->
		<div class="form-list">
		    <div class="form-item">
		        <input type="text" placeholder="이름"name="UserName" id="UserName">
		    </div>
		
		    <div class="form-item">
		        <input type="text" placeholder="별명" name="UserAlias" id="UserAlias">
		    </div>
		
		    <div class="form-item">
		        <input type="text" name="PhoneNumber" id ="PhoneNumber" placeholder="휴대전화 ('-'을 포함하여 입력하세요)">
		    </div>
		
			<div class="form-item">
			    <div class="zipcode-container">
			        <input type="text" name="Post" id="sample4_postcode" placeholder="우편번호" readonly>
			        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" id="zipcode-button">
			    </div>
			</div>
			<div class="form-item">
			    <input type="text" name="RodeAddress" id="sample4_roadAddress" placeholder="도로명주소" readonly>
			</div>
		    <div class="form-item">				
			    <input type="text" name="HouseAddress" id="sample4_jibunAddress" placeholder="지번주소" readonly>
			    <span id="guide" style="color:#999"></span>
			</div>
		    <div class="form-item">				
			    <input type="text" name="DetailAddress" id="" placeholder="상세주소">
			    <span id="guide" style="color:#999"></span>
			</div>
		
		    <div class="form-item">
			    <div class="zipcode-container">
			        <input type="text" placeholder="이메일 아이디" name="Email1" id="Email1">
			        <span>@</span> 
			        <input type="text" placeholder="이메일 주소" name="Email2" id="Email2" placeholder="직접입력"> 
			        <select name="select_email" id= "select_email" onchange="input_email();">
			            <option value="daum.net">daum.net</option>
			            <option value="naver.com">naver.com</option>
			            <option value="google.com">google.com</option>
			        </select>
		        </div>
		    </div>
		</div>
		
		<br>
		
<!-- 		<b>반려견</b> -->
			<div class="form-list">
			<div class="form-item">
				<input type="text" name="DogName" placeholder="이름 (콩이)"><br>
			</div>
			<div class="form-item">
				<input type="text" name="DogType" placeholder="종류 (말티즈)">
			</div>
			</div>
		<br><br><br><br>
		
	<input class="mem1" type="submit" value="회원가입" >
	<input class="mem2" type="reset" value="취소">
	</form>
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

//                 // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
//                 if(data.autoRoadAddress) {
//                     //예상되는 도로명 주소에 조합형 주소를 추가한다.
//                     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//                     document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

//                 } else if(data.autoJibunAddress) {
//                     var expJibunAddr = data.autoJibunAddress;
//                     document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

//                 } else {
//                     document.getElementById('guide').innerHTML = '';
//                 }
            }
        }).open();
    }
</script>
</body>
</html>