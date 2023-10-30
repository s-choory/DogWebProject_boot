<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
<style type="text/css">

	body {
	    margin: 0;
	    padding: 0;
	    background-color: #3c3c3c; 
	    font-family: Arial, sans-serif;
  	}
  	
	.link-container {
		margin-left: 30%;
		margin-right: 30%;
		margin-top: 2%;
	}	
	
	#로고{
		margin-bottom: 20px;
	}
		
	.check-container {
		display: flex;
		align-items: center;
	}
	
	.check {
		appearance: none;
		width: 20px;
		height: 20px;
		border: 2px solid #828282;
		border-radius: 5px;
		background-color: transparent;
		cursor: pointer;
		position: relative;
	}
	
	.check:checked {
		background-color: #7AFF7A;
		transition: opacity 0.3s ease-in-out;
	}
	
	.check::before {
		content: "v";
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		font-size: 16px;
		color: black;
		opacity: 0;	/* 투명도 설정하여 클릭 전에는 안보이게  */
		transition: opacity 0.3s ease-in-out;
		font-weight: bolder;
	}
	
	.check:checked::before {
		opacity: 1;
	}
	
	.chk_title {
		color:white;
		font-weight: bolder;
	}
	
	.chk_content{
		color: #828282;
		font-size: 13px;
	}
	
	.mini-container {
		max-height: 100px;
		overflow-y: auto; /* 스크롤 적용 */
		border: 1px solid #828282;
		padding: 10px;
		margin-top: 10px;
		margin-left: 5%;
		margin-bottom: 10px;
		border-radius: 5px; 
	}
	
	.mini-container::-webkit-scrollbar {
    width: 6px; /* 스크롤 바의 너비 */
	}
	
	.mini-container::-webkit-scrollbar-thumb {
	    background-color: #828282; /* 스크롤 바 색상 */
	    border-radius: 10px; /* 스크롤 바의 둥근 모서리 */
	}
	
	.mini-container::-webkit-scrollbar-track {
	    background-color: transparent; /* 스크롤 바 트랙 색상 */
	}

	.next-button {
		position: fixed;
		bottom: 20px;
		left: 50%;
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
	
	.next-buttonOFF {
		position: fixed;
		bottom: 20px;
		left: 50%;
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

</style>
</head>

<body>
<div class="link-container">
<a href="/app/"><img src="resources/로고아이콘.png" id="로고" width=80 height="60"></a><br>

<div class="check-container">
	<input type="checkbox" id="chk_all" class="check" />
	<span class="chk_title">전체 동의하기</span>
</div>
<div class = "chk_content" style="margin-left: 5%">실명 인증된 아이디로 가입, 위치기반서비스 이용약관(선택), 이벤트・혜택 정보 수신(선택) 동의를 포함합니다.</div>
<br>

<input type="checkbox" id="chk1" class="check" />
<span class="chk_title"><a style="color: #7AFF7A; font-size: 15px">[필수]</a> 페이지 이용약관 ></span>
<div class="mini-container">
	<div class = "chk_content"><span style="font-size: 15px; color: white;">환영합니다.<br></span><br>이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...이용약관 어쩌구...</div>
</div>
<br>

<input type="checkbox" id="chk2" class="check" />
<span class="chk_title"><a style="color: #7AFF7A; font-size: 15px">[필수]</a> 개인정보 수집 및 이용 ></span>
<div class="mini-container">
	<div class = "chk_content">
		개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....개인정보수집 어쩌구....
	</div>
</div>
<br>

<input type="checkbox" id="chk3" class="check" />
<span class="chk_title"><a style="color: #7AFF7A; font-size: 15px">[필수]</a> 위치기반서비스 이용약관 ></span>
<div class="mini-container">
	<div class = "chk_content">
		위치기반서비스 약관 어쩌구....위치기반서비스 약관 어쩌구....위치기반서비스 약관 어쩌구....위치기반서비스 약관 어쩌구....위치기반서비스 약관 어쩌구....위치기반서비스 약관 어쩌구....위치기반서비스 약관 어쩌구....위치기반서비스 약관 어쩌구....위치기반서비스 약관 어쩌구....위치기반서비스 약관 어쩌구....위치기반서비스 약관 어쩌구....
	</div>
</div>
<br>

<input type="checkbox" class="check" />
<span class="chk_title"><a style="color: #b4b4b4; font-size: 15px">[선택]</a> 이벤트・혜택 정보 수신 ></span>
<div class="mini-container">
	<div class = "chk_content">
		이벤트... 휴대폰/이메일 동의... 어쩌구...
	</div>
</div>
<br><br><br><br><br>


<button class="next-button next-buttonOFF" id="nextBtn" disabled="disabled">다음</button>

</div>

</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>

	$(function(){
		$("#chk_all").change(function(){
	        if(this.checked){
	            $(".check").prop("checked", true);
	        }
	        else{
	            $(".check").prop("checked", false);
	        }
		});
		
		$(".check").change(function() {
            if($("#chk1").prop("checked") && $("#chk2").prop("checked") && $("#chk3").prop("checked")){
				$(".next-button").removeClass("next-buttonOFF");
				$("#nextBtn").prop("disabled", false);
			} else {
				$(".next-button").addClass("next-buttonOFF");
				$("#nextBtn").prop("disabled", true);
			}
		});
		
		// 필수 체크항목에 동의했을 시 동작처리
	    $("#nextBtn").click(function() {
	        if (!$("#nextBtn").prop("disabled")) {
	            location.href = "membership_sign";
	        }
	    });
		
	})
</script>
</html>