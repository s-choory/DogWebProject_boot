<%@page import="java.util.*"%>
<%@page import="com.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>고객센터/문의하기</title>
<link rel="stylesheet" href="resources/css2/CC.css">
<style>
    .ContactCenter_FAQ_Table {cursor:pointer;}
    .ContactCenter_FAQ_Content{display:none;}
</style> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">



/*$(document).ready(function(){

 	$(".ContactCenter_Notice").click(function(){
  
      $(".ContactCenter_FAQ_Table2").toggleClass("hide"); 
     
     $(".ContactCenter_FAQ_Table2").toggleClass("ContactCenter_FAQ_Content");
 	});
}); */


$(document).ready(function(){
	$(".ContactCenter_FAQ_Name1").click(function(){
		if($(".ContactCenter_FAQ_Content1").is(":visible")){
			$(".ContactCenter_FAQ_Content1").css("display", "none");
		}else{
			$(".ContactCenter_FAQ_Content1").css("display", "block");
		}
	});
});
$(document).ready(function(){
	$(".ContactCenter_FAQ_Name2").click(function(){
		if($(".ContactCenter_FAQ_Content2").is(":visible")){
			$(".ContactCenter_FAQ_Content2").css("display", "none");
		}else{
			$(".ContactCenter_FAQ_Content2").css("display", "block");
		}
	});
});
$(document).ready(function(){
	$(".ContactCenter_FAQ_Name3").click(function(){
		if($(".ContactCenter_FAQ_Content3").is(":visible")){
			$(".ContactCenter_FAQ_Content3").css("display", "none");
		}else{
			$(".ContactCenter_FAQ_Content3").css("display", "block");
		}
	});
});
</script>
</head>
<body>

<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>


<div class="ContactCenter_Top">
	<div class="ContactCenter_Top_Name" align="center">고객센터</div>
	<table class="ContactCenter_Choice_Table">
		<tr>
			<td/>
			<td rowspan="2" class="ContactCenter_Choice_No" id="Notice"><a href="ContactCenter_Notice">공지사항</a></td>
			<td rowspan="2" class="ContactCenter_Choice_Yes" id="FAQ">FAQ</td>
			<td/>
		</tr>
		<tr>
			<td class="ContactCenter_Choice_Side"/>
			<td class="ContactCenter_Choice_Side"/>
		</tr>
	</table>
</div>
	
<div class="ContactCenter_FAQ">
	<%
	List<FAQDTO> list= (List)request.getAttribute("list");
		
	%>
	
	<%for(int i = 1; i <= list.size(); i++) { 
		FAQDTO dto = list.get(i-1);
 		int FaqID = dto.getFaqID();
 	    String Title = dto.getTitle();
 	    String Content = dto.getContent();
 	 

	%>


	<div class="ContactCenter_FAQ_Table">
		<div>
			<span class="ContactCenter_FAQ_Q">Q<%=FaqID %></span>
			<span class="ContactCenter_FAQ_Name<%=FaqID %>"><%=Title%></span>
		</div>
	</div>
	<div class="ContactCenter_FAQ_Table2">
		<div>
			<div class="ContactCenter_FAQ_Content<%=FaqID %>" style=" display:none;"><%=Content%></div>
		</div>
	</div>
	<% } %>
</div>
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</body>
</html>
