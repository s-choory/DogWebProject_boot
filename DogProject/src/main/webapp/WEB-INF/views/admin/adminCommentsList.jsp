<%@page import="com.example.dto.CommentsDTO"%>
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
		margin-left: 20%;
		margin-right: 20%;
	}
	
	.time {
		width: 170px;
	}
	.content{
		width:320px;
	}

</style>
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript">
	function adminDeleteComment(CommentID, PostID){
		if (confirm("정말 "+CommentID+"번 댓글을 삭제하겠습니까?") == true) {
			location.href="adminDeleteComment?CommentID="+CommentID+"&PostID="+PostID;
		}
	}
</script>
<body>
<%List<CommentsDTO> colist = (List<CommentsDTO>)request.getAttribute("coList");  %>
<% if (colist != null && !colist.isEmpty()) { %>
    <h1 style="margin-top:20px; text-align: center;"><%= colist.get(0).getPostID() %>번 게시물 댓글 내역</h1>
<% } else { %>
    <h1 style="margin-top:20px; text-align: center;">댓글 없음</h1>
<% } %>
    <div class="table-container table-bordered">
    <table class="table">
    	<tr class="table-primary" style="font-weight: bolder;">
    		<td>부모댓글ID</td>
    		<td>작성자ID</td>
    		<td>내용</td>
    		<td>시간</td>
    		<td>삭제유무</td>
    		<td>action</td>
    	</tr>
    	<% 
    		for(int i = 0; i<colist.size(); i++){
    			CommentsDTO coDTO = colist.get(i);
    	%>
    	<tr class="table-light">
    		<td><%= coDTO.getParentCommentID() %></td>
    		<td><%= coDTO.getAuthorID() %></td>
    		<td class="content"><%= coDTO.getContent() %></td>
    		<td class="time"><%= coDTO.getCreationTime() %></td>
    		<td><%= coDTO.getCommentType() %></td>
    		<td style="width: 100px"><button class="btn btn-danger" onclick="adminDeleteComment(<%=coDTO.getCommentID()%>, <%=coDTO.getPostID()%>)">삭제</button></td>
    	</tr>
    	<%} %>
    </table>
    </div>

</body>
</html>