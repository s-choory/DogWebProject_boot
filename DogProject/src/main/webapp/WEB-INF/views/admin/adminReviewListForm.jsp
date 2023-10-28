<%@page import="com.example.dto.ReviewsDTO"%>
<%@page import="com.example.dto.ChatMessageDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.input-textbox{
		width:500px;
		height:100px;
    	word-wrap: break-word; /* 긴 단어 또는 URL이 너비를 벗어날 때 줄 바꿈 */
	}
	.table-container{
		margin-left: 5%;
		margin-right: 5%;
	}
	
	.time {
		width: 170px;
	}
	.content{
		width:300px;
	}
 .hidden {
    display: none;
}

</style>
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript">

	function addReviewComment(ReviewID){
		var w = 800;
		var h = 600;
		var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
		var yPos = (document.body.offsetHeight/2) - (h/2);
		
	 	window.open("addReviewComment?ReviewID="+ReviewID, "_blank", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
	}

</script>
<body>
<%List<ReviewsDTO> list = (List<ReviewsDTO>)request.getAttribute("rList");  %>
<% if (list != null && !list.isEmpty()) { %>
    <h1 style="margin-top:20px; text-align: center;"><%= list.get(0).getProductID() %>번 상품 리뷰 내역</h1>
<% } else { %>
    <h1 style="margin-top:20px; text-align: center;">리뷰 없음</h1>
<% } %>

	<div>
	
	</div>    	
	
    <div class="table-container table-bordered">
    <table class="table">
    	<tr class="table-primary" style="font-weight: bolder;">
    		<td>리뷰ID</td>
    		<td>작성자</td>
    		<td>내용</td>
    		<td>답글</td>
    		<td>별점</td>
    		<td>action</td>
    	</tr>
    	<% 
    		for(int i = 0; i<list.size(); i++){
    			ReviewsDTO rDTO = list.get(i);
    	%>
    	<tr class="table-light">
    		<td><%= rDTO.getReviewID() %></td>
    		<td><%= rDTO.getUserAlias() %></td>
    		<td class="content"><%= rDTO.getReviewContent() %></td>
    		<td class="content"><%= rDTO.getrComment() %></td>
    		<td><%= rDTO.getRating()%></td>
    		<td class="action2"><button class="btn btn-success" onclick="addReviewComment(<%=rDTO.getReviewID()%>)">답글</button></td>
    	</tr>
    	<%} %>
		
    </table>
    </div>
</body>
</html>