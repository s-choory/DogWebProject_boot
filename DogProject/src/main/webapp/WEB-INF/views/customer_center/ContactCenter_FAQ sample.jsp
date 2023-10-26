<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>고객센터/문의하기</title>
<link rel="stylesheet" href="resources/css2/CC.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
//제목 클릭 시 내용 보기
$(document).on('click', '#FAQ td.ContactCenter_FAQ_Name', function() {
  var $content = $(this).parent().next('tr').find('.ContactCenter_FAQ_Content');
  // 이미 열려있는 항목인지 체크하여 토글
  if ($content.is(':visible')) {
    $content.hide();
  } else {
    // 문의 내용 가져오기
    var question = $(this).text().trim();
    var answer = getAnswer(question); // 문의 내용에 맞게 답변 조회
    $content.html(answer); // 내용 업데이트
    // 다른 항목 내용 닫기
    $('.ContactCenter_FAQ_Content').not($content).hide();
    $content.show();
  }
});

function getAnswer(question) {
  // 문의 내용에 맞는 답변 조회
  // ...
  return '이 항목의 답변입니다.';
}
</script>
</head>
<body>
<div class="ContactCenter_Top">
	<div class="ContactCenter_Top_Name" align="center">고객센터</div>
	<table class="ContactCenter_Choice_Table">
		<tr>
			<td/>
			<td rowspan="2" class="ContactCenter_Choice_No" id="Notice">공지사항</td>
			<td rowspan="2" class="ContactCenter_Choice_Yes" id="FAQ">FAQ</td>
			<td/>
		</tr>
		<tr>
			<td class="ContactCenter_Choice_Side"/>
			<td class="ContactCenter_Choice_Side"/>
		</tr>
	</table>
</div>
<div class="ContactCenter_Notice">
	<table class="ContactCenter_FAQ_Table">
	<tr>
		<td class="ContactCenter_FAQ_Q">Q</td>
		<td class="ContactCenter_FAQ_Name">&nbsp;&nbsp;제목</td>
	</tr>
	<tr>
		<td colspan="2" class="ContactCenter_FAQ_Content">
	</tr>
	</table>
</div>
</body>
</html>
