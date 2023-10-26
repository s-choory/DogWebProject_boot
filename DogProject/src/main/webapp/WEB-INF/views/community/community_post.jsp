<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Base64"%>
<%@page import="com.example.dto.UsersDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- displays site properly based on user's device -->
<title>커뮤니티-게시물</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&display=swap" rel="stylesheet">
  <!-- Feel free to remove these styles or customise in your own stylesheet ð -->
  <style>
    .attribution { font-size: 11px; text-align: center; }
    .attribution a { color: hsl(228, 45%, 44%); }
  </style>
  <!-- bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <!--  <link rel="stylesheet" href="test.css"> -->


<link rel="stylesheet" href="resources/postcss/test.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	

$(function() {   //이전페이지로 돌아가는 버튼
	$("#listbtn").click(function() {
		var listurl = "/app/community/?curPage=${ppDTO.curPage}&search=&order=";
		location.href = listurl;
		
	});	
}); 

//////////////////////////////////////////

$(document).ready(function(){ //PostType 컬럼상태가 바뀌는 버튼
	var PostID = $("#PostID").val();
	var AuthorID =$("#AuthorID").val();
	$("#delete_column").on("click",function(){
		  $.ajax({
			 url:'delete',
			 type:'post',
			 data:{
				 PostID:$("#PostID").val(),
				 AuthorID:$("#AuthorID").val()
			 },
			 dataType:"text",
			 success:function(data,status,xhr){
				 location.href = "/app/community";
				 event.preventDefault();
			 },
			 error:function(xhr,status,error){
				 Swal.fire('경고', '삭제할 수 없습니다', 'warning');
		         location.href = "/app/community"; 
			 }
		  });//end ajax
	});//end on  
});//end ready

//////////////////////////////////////////

$(document).ready(function(){ //좋아요 버튼
	var PostID = $("#PostID").val();
	$("#likelike").on("click",function(){
		
		  $.ajax({
			 url:'like',
			 type:'post',
			 data:{
				 PostID:$("#PostID").val(),
			 },
			 dataType:"text",
			 success:function(data,status,xhr){
				 console.log(data);
				 $("#likelike").val('좋아요'+data);
// 				 $("#likelike").val('좋아요${n2222}');
// 				 location.href = "/test/post?PostID="+ PostID;	
// 				 event.preventDefault();
			 },
			 error:function(xhr,status,error){}
		  });//end ajax
	});//end on  
});//end ready



//////////////////////////////////////////

$(document).ready(function() {
	getreplylist();
});


function getreplylist() { ////댓글 리스트 출력 이벤트
	var replyurl = "${root}replyui/";
	var PostID = $("#PostID").val();

	$.ajax({
		url : replyurl + PostID,
		type : 'post',
		dataType : 'json',
		async : false,
		success : function(result, status, xhr) {
			var comments = "";
			if (result.length < 1) {
				comments = "등록된 댓글이 없습니다.";
			} else {
				$.each(
						result,
						function(idx, ele) {
					
							if (this.commentType === 'deleted') {	
							comments += '<div id="CommentID'+this.commentID+'" class="grid-container"><div>삭제된 글입니다</div></div>';
							
							} else if(!this.parentCommentID){
							comments += '<div id="CommentID'+this.commentID+'" class="grid-container grid-container--posted">';
							comments += '<picture class="user">';
							comments += '<img src="resources/a.jpg" alt="julius avatar">';
							comments += '</picture>';
							comments += '<h3>'
									+ '작성자 : '
									+ this.authorID
									+ '</h3>&nbsp;&nbsp;&nbsp;&nbsp;';
							comments += '<p class="time">'
							comments += '작성 날짜 : '
									+ this.creationTime
									+ '</p>';
									+ '<br/>';
							comments += '<p class="comment">';
							comments += '댓글 내용 : &nbsp;&nbsp;&nbsp;'
									+ this.content;
							comments += '</p>';
							comments += '<br/>';
					
							
							comments += '<input type="hidden" id="CommentType" name="CommentType" value="'+ this.commentType +'">';
							comments += '<input type="hidden" id="ParentCommentID" name="ParentCommentID" value="'+ this.parentCommentID +'">';
							comments += '<button type="button" class="purple" style="border: none" onclick="updateviewBtn('
									+ this.commentID
									+ ',\''
									+ this.creationTime 
									+ '\', \''
									+ this.content
									+ '\', \''
									+ this.authorID
									+ '\')"><img src="resources/postcss/icon-edit.svg" alt="edit button" width="27" height="27">';
							comments += 'EDIT</button>';
							comments += '<button type="button" class="red delete" onclick="deleteBtn('
									+ this.commentID
									+ ',\''
									+ this.authorID
									+ '\')"><img src="resources/postcss/icon-delete.svg" alt="delete button" width="27" height="27">';
							//comments +='<button type="button" onclick="replydelete('+this.commentID+')">'>';
							comments += 'DELETE</button>';
							comments += '<button type="button" id="reply" class="purple" style="border: none" onclick="commentsviewBtn('
								+ this.commentID
								+ ')"><img src="resources/postcss/icon-reply.svg" alt="reply button" width="27" height="27">';
							comments += 'REPLY</button>';
							comments += '</div>';

							}else{
								
								comments += '<div id="CommentID'+this.commentID+'" class="grid-container grid-container--posted reply">';
								comments += '<picture class="user">';
								comments += '<img src="resources/a.jpg" alt="julius avatar">';
								comments += '</picture>';
								comments += '<h3>'
										+ '작성자 sdsdsdsdd: '
										+ this.authorID
										+ '</h3>&nbsp;&nbsp;&nbsp;&nbsp;';
								comments += '<p class="time">'
								comments += '작성 날짜 : '
										+ this.creationTime
										+ '</p>';
										+ '<br/>';
								comments += '<p class="comment">';
								comments += '댓글 내용 : &nbsp;&nbsp;&nbsp;'
										+ this.content;
								comments += '</p>';
								comments += '<br/>';
						
								
								comments += '<input type="hidden" id="CommentType" name="CommentType" value="'+ this.commentType +'">';
								comments += '<input type="hidden" id="ParentCommentID" name="ParentCommentID" value="'+ this.parentCommentID +'">';
								comments += '<button type="button" class="purple" style="border: none" onclick="updateviewBtn('
										+ this.commentID
										+ ',\''
										+ this.creationTime 
										+ '\', \''
										+ this.content
										+ '\', \''
										+ this.authorID
										+ '\')"><img src="resources/postcss/icon-edit.svg" alt="edit button" width="27" height="27">';
								comments += 'EDIT</button>';
								comments += '<button type="button" class="red delete" onclick="deleteBtn('
										+ this.commentID
										+ ',\''
										+ this.authorID
										+ '\')"><img src="resources/postcss/icon-delete.svg" alt="delete button" width="27" height="27">';
								//comments +='<button type="button" onclick="replydelete('+this.commentID+')">'>';
								comments += 'DELETE</button>';
								comments += '<button type="button" id="reply" class="purple" style="border: none" onclick="commentsviewBtn('
									+ this.commentID
									+ ')"><img src="resources/postcss/icon-reply.svg" alt="reply button" width="27" height="27">';
								comments += 'REPLY</button>';
								comments += '</div>';	
								
								
							}

							console.log(ele);
							});
						}
						;
						$("#replylist").html(comments);
					}
					
				});
	}//end

	//////////////////////////////////////////////

	
	$(document).ready(function() { /////////댓글 작성 이벤트

		$('#submit-button').click(function() {
			console.log("들어오기는 함?");
			var Content = $('#rCONTENT').val();
			PostID = ${read.postID};
			var count= ${replyCount};

			var writeurl = "${root}replywrite/";
			$.ajax({
				url : writeurl + PostID + '/' + Content,
				type : 'post',
				dataType : 'json',
				async : false,
				success : function(result) {
					getreplylist();
					$('#rCONTENT').val('');
					count++;
					$('#replyCount').text(count+"개의 댓글");
				},
				error : function(error) {
					console.log("에러 : " + error);
					location.href = "/app/login"; 
				}
			})
		});

	});

	/////////////////////////////////////////////////////
	
	$(document).ready(function() {
		updateBtn();
	});

	function updateBtn(CommentID, AuthorID) {// 댓글 수정해주는 이벤트
		event.preventDefault();
		if (confirm("정말 수정하시겠습니까??") == true) { //확인

			var updateurl = "${root}replyupdate/";
			var reply_content = $("#reply_edit_content").val();

			$.ajax({
				url : updateurl + CommentID + '/'+AuthorID+ '/'+ reply_content,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					getreplylist();
				},
				error : function(error) {
					console.log("에러 : " + error);
				}
			});

		} else {//취소
			return false;
		}
	};

	
	$(document).ready(function() {   //댓글 수정해주는 이벤트
		updateviewBtn();
	});

	function updateviewBtn(CommentID, CreationTime, Content, AuthorID) {
		console.log("들어와라");

		var commentsview = "";

		commentsview += '<div id="CommentID'+CommentID+'">';
		commentsview += '<strong>';
		commentsview += '작성자 : ' + AuthorID;
		commentsview += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
		commentsview += '작성 날짜 : ' + CreationTime;
		commentsview += '<br/><p>';
		commentsview += '댓글 내용 : &nbsp;&nbsp;&nbsp;';
		commentsview += '<textarea class="form-control" id="reply_edit_content">';
		commentsview += Content;
		commentsview += '</textarea>';
		commentsview += '</p>';
		commentsview += '<br/>';
		commentsview += '<button type="button" class="btn btn-outline-success"';
		commentsview += 'onclick="updateBtn(' + CommentID + ',\'' + AuthorID
				+ '\')">댓글작성</button>';
		commentsview += '<button type="button" class="btn btn-outline-success" onclick="getreplylist()" >';
		commentsview += '취소';
		commentsview += '</button>';
		commentsview += '</div>';
		commentsview += '<br/>';

		$('#CommentID' + CommentID).replaceWith(commentsview);
		$('#CommentID' + CommentID + '#reply_content').focus();

	};
	//////////////////////////////////////////
	
	
	$(document).ready(function() {   ////댓글 컬럼 deleted로 변경하는 이벤트
		deleteBtn();
	});

	function deleteBtn(CommentID, AuthorID) { 
		event.preventDefault();
		if (confirm("정말 댓글 삭제하시겠습니까??") == true) { //확인

			var deleteurl = "${root}replydelete/";
	
			$.ajax({
				url : deleteurl + CommentID + '/' + AuthorID,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					getreplylist();
				},
				error : function(error) {
					 Swal.fire('경고', '삭제할 수 없습니다', 'warning');
				}
			});
		} else {//취소
			return false;
		}
	};

	
	//////////////////////////////////////////
	
	$(document).ready(function() {   //대댓글 작성해주는 이벤트
		commentBtn();
	});
	
	function commentBtn(CommentID) {
			console.log("들어오기는 함?????");
			var Content = $('#cCONTENT').val();
			PostID = ${read.postID};
			ParentCommentID = CommentID;
			var count= ${replyCount};

			var writeurl = "${root}replywritewrite/";
			$.ajax({
				url : writeurl + PostID + '/' + Content + '/' + ParentCommentID,
				type : 'post',
				dataType : 'json',
				async : false,
				success : function(result) {
					getreplylist();
					$('#cCONTENT').val('');
					count++;
					$('#replyCount').text(count+"개의 댓글");
				},
				error : function(error) {
					console.log("에러 : " + error);
					/* location.href = "/test/login"; */
				}
			})
	};
	
	

	$(document).ready(function() {   //대댓글 작성해주는 이벤트
		commentsviewBtn();
	});

	function commentsviewBtn(CommentID) {
		console.log("들어와라");

		var commentsview = "";
		

		commentsview += '<div class="grid-container grid-container--new">';
		commentsview += '<div class="input-group">';
		
		commentsview += '<input type="hidden" id="PostID" name="PostID" value="${retrieve.postID}">';
		commentsview += '<br/><p>';
		commentsview += '<input type="hidden" id="postType" name="postType" value="${retrieve.postType}">';
		commentsview += '<input type="hidden" id="AuthorID" name="AuthorID" value="${read.authorID}">';
		commentsview += '<input type="file" id="imageInput" style="display: none;">';
		commentsview += ' <label for="imageInput" class="attach-button">사진 첨부</label>';
		commentsview += ' <textarea class="form-control" type="text" id="cCONTENT" name="cCONTENT" value="" placeholder="Add a comment..."></textarea>';
		
		commentsview += ' </div>';
		commentsview += '<picture class="user">';
		commentsview += '<img src="resources/a.jpg" alt="julius avatar">';
		commentsview += '</picture>';
		
		
		
		commentsview += '<button type="button" class="btn btn1"';
		commentsview += 'onclick="commentBtn(' + CommentID + ')">대댓글작성</button>';
		commentsview += '<button type="button" class="btn btn-outline-success" onclick="getreplylist()" >';
		commentsview += '취소';
		commentsview += '</button>';
		commentsview += '</div>';
		commentsview += '<br/>';
		
		
		/* $('#CommentID' + CommentID).append(commentsview); */
		$(commentsview).insertAfter('#CommentID' + CommentID);
		
		/* $('#CommentID' + CommentID + '#reply_content').focus(); */
		event.preventDefault();

	};
	
	
	//////////////////////////////////////////
	
	
$(function() {   
	$("#modify").click(function(){
		
		var PostID = $("#PostID").val()	
			location.href = "/app/updatePost?PostID="+PostID;	           		
	
	});
}); 
	
</script>
<style type="text/css">
	body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	} 
	
	.box {
    width: 60px;
    height: 60px; 
    border-radius: 70%;
    overflow: hidden;
    
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	.postComment{
		border: 1px solid #ccc;
	    border-radius: 10px;
	    margin-top: 20px;
	    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	    margin-right: 10%;
	}
	.postComment2{
		border: 1px solid #ccc;
	    border-radius: 10px;
	    margin-top: 20px;
	    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	    margin-right: 10%;
	}
	
	  /* 스크롤 고정 입력창 스타일 */
    .fixed-input {
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        background-color: white;
        padding: 10px;
        display: flex;
        align-items: center;
    }
    .input-field {
        flex-grow: 1;
        margin-right: 10px;
        padding: 5px;
        border: 1px solid #ccc;
    }
    .attach-button {
        padding: 5px 10px;
        background-color: #f8bd24;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    } 
 /*    .submit-button {
        padding: 5px 10px;
        background-color: #35424a;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    } */
   	

</style>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>

<nav class = "title" style="margin-left: 10%;">
	<form action="readForm" method="post">
		<input type="hidden" id="PostID" name="PostID" value="${read.postID}">
		<input type="hidden" id="page" name="page" value="${ppDTO.curPage}">
		 <input type="hidden" id="AuthorID" name="AuthorID" value="${read.authorID}">
	</form>

<h1>${read.postID}번 게시물  ===  ${read.title}</h1>
	<span id ="tag1">#${read.tag}</span>
</nav>


	<hr align="center" style="border: ridge 3px orange; width: 85%;">
<div class = "postContent" style="margin-left: 10%;">
	<img src="resources/a.jpg" id="로고" width=500 height=300 value="">
	<br>
	<hr>
	<span>${read.content}</span><br>
	<hr>
	file Link: <a href="${upload.fileurl}" target="_blank">${upload.filename}</a>
</div>

<span style="text-align: center; display: block; font-size: 40px">❤️</span>
<form action="like" method="post">
   <input type="hidden" name="PostID" id="LikePostID" value="${read.postID}">
	<span style="text-align: center; display: block;"><input type="button" id="likelike" value="좋아요${n2222}"></span>
  </form> 
<a style="text-align: right; display: block; margin-right: 20%;">공유</a>
<hr align="center" style="border: ridge 3px orange; width: 85%;">



<div class="postComments" style="margin-left: 10%;">
    <div id="replyCount">${replyCount}개의 댓글</div>
    최신순<input type="radio" name="commentRadio" value="최신순">
    인기순<input type="radio" name="commentRadio" value="인기순">
</div>   

   <div class="grid-container grid-container--new">

    <div class="input-group">
  
   		<input type="hidden" id="PostID" name="PostID" value="${read.postID}"> 
   		<input type="hidden" id="postType" name="postType" value="${read.postType}">
   		<input type="hidden" id="AuthorID" name="AuthorID" value="${read.authorID}">
   		<input type="file" id="imageInput" style="display: none;">
	    <label for="imageInput" class="attach-button">사진 첨부</label>
   		  
      <textarea class="form-control" type="text" id="rCONTENT" name="rCONTENT" value="" placeholder="Add a comment..."></textarea>
    </div>
 <% 	boolean userFlag = true;
	if(session.getAttribute("User") == null) {
		userFlag = false;
	}else { 

    UsersDTO dto = (UsersDTO) session.getAttribute("User"); 	
	
	int Post = dto.getPost();
    String UserName = dto.getUserName();
    String UserAlias = dto.getUserAlias();
    String UserType = dto.getUserType();

    byte[] userImgBytes = dto.getUSERIMG();  // 바이트 배열 형태의 이미지 데이터
    String imageSrc = null;
    if(userImgBytes == null){  
    	 imageSrc = "강아지기본이미지" ;  //강아지기본이미지.JPG
    } else {
    	String base64Image = Base64.getEncoder().encodeToString(userImgBytes);
    	 imageSrc = "data:image/jpeg;base64," + base64Image;
    	}
%>   
   <!-- </form> -->
 	<% if(userFlag == true){%>
      <img src="resources/<%= imageSrc %>.JPG" alt="julius avatar">
 	<% } else{%>
      <img src="resources/강아지기본이미지.JPG" alt="julius avatar">
     <% } }%>
    <button class="btn btn1" type="button" name="button" id="submit-button">Send</button>
    
  
	 
 </div> 

		<!-- 댓글이 들어갈 div -->
		<div id="replylist"></div>

	
   
   
  <%--   <div class="fixed-input"><!-- 댓글 작성을 위한 폼 -->
    	<form name="replyForm" method="post">
    		<input type="hidden" id="PostID" name="PostID" value="${read.postID}"> 
    		<input type="hidden" id="postType" name="postType" value="${read.postType}">
    		 <input type="hidden" id="AuthorID" name="AuthorID" value="${read.authorID}">
	        <input type="file" id="imageInput" style="display: none;">
	        <label for="imageInput" class="attach-button">사진 첨부</label>
	     <!--    <label for="AUTHORID">작성자:</label><input type="text" id="rAUTHORID" name="rAUTHORID" placeholder="아이디를 입력하세요..."> -->
	        <label for="CONTENT">댓글 내용:</label><input type="text"  id="rCONTENT" name="rCONTENT" class="input-field" placeholder="내용을 입력하세요...">
	        <button type="button" class="submit-button" id="submit-button">댓글 등록</button>
        </form>
    </div> --%>
    
 
<button type="button" id="listbtn" class="listbtn">이전 페이지가 적용된 목록으로</button>
 <form method="get" action="updatePost">   
 	<input type="hidden" id="AuthorID" name="AuthorID" value="${read.authorID}">
 	<input type="hidden" id="PostID" name="PostID" value="${read.postID}"> 
 	<input type="hidden" id="Content" name="Content" value="${read.content}"> 
 	<input type="hidden" id="Title" name="Title" value="${read.title}"> 
	<button type="button" id="delete_column" class="delete_column">게시글의 컬럼이 변경되는 삭제</button>
	<button type="button" id="modify" class="modify">게시글 제발 수정</button>
</form>
<%-- <a href="delete?PostID=${read.postID}">삭제</a> --%>
	
	
	
<br>
<jsp:include page = "../common/footer.jsp" flush="true"/><br><br><br>
</body>
</html>