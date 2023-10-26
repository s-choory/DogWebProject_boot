<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>div</title>
<link rel="stylesheet" href="dog.css">   <!-- div에 style 주고싶으면 dog.css 사용 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">




	$(function () {
		
		//버튼
		$(".list").on("click",function(){
			var listnumber =   $(this).attr("data-xxx"); // 각각의 특정 id값 뽑아옴
			console.log(listnumber);
			console.log($("#image"+listnumber).attr("img"));
			console.log($("#info"+listnumber)) //없네 안뽑혔음 
			var inputinfo = $("#info"+listnumber);
			console.log($("#info"+listnumber).text());
			 const pictureclick = document.getElementById("pictureclick"); // click시 안보였던 table이 다시 보임
			   
			 	pictureclick.style.display = "table"; //화면에 table 보이게 
			 	pictureclick.scrollIntoView();			  //화면 초점 이곳으로 이동
			
			 
			 
        });//end 버튼
		
        
        
        
        
        
        
        
        
	})//end dom

</script>
</head>
<body>


<table width="90%" cellspacing="0" cellpadding="0" border="0">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>반려동물 동반 가능 문화시설 </b></font> &nbsp;
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
		<td class="td_default" align="center"><strong>식당</strong></td>
		<td class="td_default" align="center"><strong>카페</strong></td>
		<td class="td_default" align="center"><strong>호텔</strong></td>
		<!-- 호텔 + 풀빌라 + 펜션 하나로 -->
		<td class="td_default" align="center"><strong>계곡</strong></td>
		<td class="td_default" align="center"><strong>놀이터</strong></td>
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
	
	<tr>
		<td colspan="10" >
			&nbsp;&nbsp;&nbsp;&nbsp; <!--  칸 좀 벌리려고 씀 -->
		</td>
	</tr>
	
	
	<tr>
		<td class="aaa" align="center">전체보기</td>	
		<td class="aaa" align="center">인기순</td>
		<td class="aaa" align="center">별점높은순</td>
		<td class="aaa" align="center">별점낮은순</td>
		<td class="aaa" align="center" >
			<input type="text"name="localselect" id="localselect" class="check" value="서울시 강남구">
			<input type="button" id="localselectbutton" value="검색">
		</td>
	</tr>

</table>

<br>
<br>
<br>
 <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@ 여기서부터 목록list @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
 
 
<div style="border: 1px solid white; background-color: pink; width: 1000px; height: 500px; overflow: scroll;margin-left:auto; margin-right:auto;" >
 
<% 
int a = 10; // 대충 10개까지 임의 지정
//data-xxx= Num 
for(int i = 1; i <= a; i++) { %>
<div style="border: 1px solid white; background-color: silver; padding: 10px; margin-left:auto; margin-right:auto; width: 70%; text-align: center;" class="list" data-xxx="<%=i%>" id="home2">
	<div style="display: flex; align-items: center;">
		<img style="display: inline-block;" src="images/items/sun.png" border="0" width="200px" id="image<%=i%>">
		<div style="display: inline-block; margin-left: 20px;">
			<div style="display: block; margin-bottom: 10px;">
				<span id="address<%=i%>">주소<%=i%></span>
			</div>
		</div>
		<div style="display: block;">
				<span id="info<%=i%>">
					정보<%=i%><br>
					카테고리: 식당or카페 <br>
					지역: 서울 강남 or 김포 걸포 <br>
					연락처: 010-xxxx-xxxx<br>
					가격: xxx만원<br>
					주차여부: o or x<br>
				</span>
			</div>
	</div>
</div>
<% } %>

</div>

<!-- 출력을 위한 div 태그 -->
<div id="output"></div>

 <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@  목록list 끝  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
 
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@  여기서부터 클릭시 해당 업체 정보  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->

<%
 //파싱해서 각각의 사진 주소 정보 id값 가져와서 알맞은 자리에 넣어주기?
 //파싱하려면 dto를 따로 만들어주고 그안에 저장해야하나? dto 구성요소 (사진,주소,정보)		 
%>

<style>
#pictureclick {
  display: none;
  border: 1px solid red;
  padding: 10px;
  margin-left:auto; 
  margin-right:auto; 
  height: 500px; 
  width: 60%;
  background-color: pink;
}
</style>
<!-- display: none; 속성으로 초기화되며, 클릭시 display: table; 속성이 추가되어 나타남 -->
<table id="pictureclick">
	<tr  height="200px">
		<td  width="25%"><img src="images/items/sun.png" border="0" align="center" width="200" id="사진"></td>
		<td  width="50%">주소</td>
		<td  width="25%">정보<br>
			카테고리: 식당or카페 <br>
			지역: 서울 강남 or 김포 걸포 <br>
			연락처: 010-xxxx-xxxx<br>
			가격: xxx만원<br>
			주차여부: o or x<br>
		
		</td>	
	</tr>
</table>


 <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@  해당업체 정보 끝  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->

</body>
</html>