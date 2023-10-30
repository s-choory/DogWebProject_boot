<%@page import="com.example.dto.PageDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="com.example.dto.PostsDTO"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.table-container{
		margin-left: 20%;
		margin-right: 20%;
	}
    .page {
       display: flex;
       justify-content: center;
       align-items: center;
       margin: 20px 0;
    }
       .page a, .page span {
       margin: 0 5px;
       padding: 10px;
       text-decoration: none;
       color: #71777d;
       transition: background-color 0.3s, color 0.3s;
       font-size: 18px;
    }

    .page a:hover {
        background-color: #71777d;
        color: #fff;
    }
    .page-link .disabled {
    background-color: #f8bd24; /* 원하는 배경색 지정 */
	color: #fff;
	border: 1px solid #f8bd24;
	
	}
</style>
</head>
<script type="text/javascript">

function adminReviewList(PostID) {
	var w = 700;
	var h = 500;
	var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
	var yPos = (document.body.offsetHeight/2) - (h/2);
	
 	window.open("adminCommentsList?PostID="+PostID, "_blank", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}

function adminDeletePost(PostID) {
	if (confirm("정말 "+PostID+"번 게시물을 삭제하겠습니까?") == true) {
		location.href="adminDeletePost?PostID="+PostID;
	}
}

</script>
<body>
    <header>
        <h1 style="text-align: center; margin: 30px 0; ">게시물 목록 조회</h1>
    </header>
    <div style="text-align: center; margin-bottom: 30px;">
    	<a href="adminPage" >관리자페이지로 이동</a><br><br>
	</div>
<%
	PageDTO pDTO= (PageDTO)request.getAttribute("pDTO");
	String order= (String)request.getAttribute("order"); // 정렬에 필요한 변수
%>
    <div class="table-container">
    <table class="table">
    	<tr class="table-success" style="font-weight: bolder;">
    		<td>postid</td>
    		<td>이미지</td>
    		<td>작성자</td>
    		<td>제목</td>
    		<td>내용</td>
    		<td>작성날짜</td>
    		<td>action</td>
    		<td>action</td>
    	</tr>
    	<% List<PostsDTO> list = pDTO.getList();
	     	
	     	for(int i = 0; i<list.size(); i++){
	     		
	    	PostsDTO dto= list.get(i);
	    	int postid=dto.getPostID();
	    	String userid = dto.getAuthorID();
	    	String Image= dto.getImage();
	    	String Title= dto.getTitle();
	    	String post_content=dto.getContent();
	    	String textOnly =  post_content.replaceAll("<[^>]+>", "");
	    	String previewText = textOnly.substring(0, Math.min(textOnly.length(), 50)) + (textOnly.length() > 50 ? "..." : "");
	    	int likes = dto.getLikes();
	    	String category= dto.getCategory();
	    	String postimage=dto.getImage();
	    	String defaultimage="resources/default.png";
	    	Pattern pattern = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");
	        Matcher matcher = pattern.matcher(post_content);
	        if (matcher.find()) {
	            postimage = matcher.group(1);
	     	}
	    		if (postimage==null) postimage=defaultimage;
	    	String Category= dto.getCategory();
	    	int Likes= dto.getLikes();
	    	String CreationTime= dto.getCreationTime();
    	%>
    	<tr class="table-light">
    		<td><%= postid %></td>
    		<td><img src="<%=postimage%>" width="100" height="100"></td>
    		<td><%= userid %></td>
    		<td><%= Title %></td>
    		<td style="width: 500px;"><%= textOnly %></td>
    		<td><%= CreationTime %></td>
    		<td><button class="btn btn-success" onclick="adminReviewList(<%=postid%>)">댓글</button></td>
    		<td><button class="btn btn-danger" onclick="adminDeletePost(<%=postid%>)">삭제</button></td>
    	</tr>
    	<%} %>
    </table>
    </div>
<div class="page">
<jsp:include page = "../common/page.jsp" flush="true"/><br>
</div>
</body>
</html>