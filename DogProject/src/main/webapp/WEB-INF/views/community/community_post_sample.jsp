<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티-게시물</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	

$(function() {   //이전페이지로 돌아가는 버튼
	$("#listbtn").click(function() {
		var listurl = "/test/?curPage=${ppDTO.curPage}&search=&order=";
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
				 location.href = "/test";
				 event.preventDefault();
			 },
			 error:function(xhr,status,error){
				 alert('삭제할 수 없습니다');
		         location.href = "/test"; 
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
							comments += '<div id="CommentID'+this.commentID+'" class="postComment" style="display: flex; align-items: flex-start; margin-top: 10px;">';
							comments += '<div class="box" style="background: #BDBDBD;">'
							comments += ' <img class="profile" src="resources/a.jpg">'
							comments += ' </div>'
							comments += '<div style="display: flex; flex-direction: column; margin-left: 10px;">'
							comments += '<div><h2>삭제된 글입니다</h2></div><br>';
							comments += '</div>';
							comments += '<span style="margin-left: auto; margin-right: 10%">🟰</span>';
							comments += '</div>';

							comments += '<br/>';
							
							
							} else {
							comments += '<div id="CommentID'+this.commentID+'" class="postComment" style="display: flex; align-items: flex-start; margin-top: 10px;">';
							comments += '<div class="box" style="background: #BDBDBD;">'
							comments += ' <img class="profile" src="resources/a.jpg">'
							comments += ' </div>'
							comments += '<div style="display: flex; flex-direction: column; margin-left: 10px;">'
							comments += '<span style="font-size:15px; font-weight: bold;">'
									+ '작성자 : '
									+ this.authorID
									+ '</span>';		
							comments += '<span style="font-size: 8px; color:#bbb">'
							comments += '작성 날짜 : '
									+ this.creationTime
									+ '</span>&nbsp;&nbsp;&nbsp;&nbsp;';
									+ '<br/>';
									
							comments += '<p style="font-size:12px">';
							comments += '댓글 내용 : &nbsp;&nbsp;&nbsp;'
									+ this.content;
							comments += '</p>';
							comments += '<br/>';
							
							comments += '<input type="hidden" id="CommentType" name="CommentType" value="'+ this.commentType +'">';
							comments += '<input type="hidden" id="ParentCommentID" name="ParentCommentID" value="'+ this.parentCommentID +'">';
							comments += '<button type="button" class="btn btn-outline-success" onclick="updateviewBtn('
									+ this.commentID
									+ ',\''
									+ this.creationTime
									+ '\', \''
									+ this.content
									+ '\', \''
									+ this.authorID
									+ '\')">';
							comments += '댓글수정</button>';
							comments += '<button type="button" class="btn btn-outline-success" onclick="deleteBtn('
									+ this.commentID
									+ ',\''
									+ this.authorID
									+ '\')">';
							//comments +='<button type="button" onclick="replydelete('+this.commentID+')">'>';
							comments += '댓글 삭제</button>';
							comments += '<button type="button" class="btn btn-outline-success" onclick="commentsviewBtn('
								+ this.commentID
								+ ')">';
							comments += '대댓글 작성</button>';
							comments += '</div>';
							comments += '<span style="margin-left: auto; margin-right: 10%">🟰</span>';
							comments += '</div>';

							comments += '<br/>';

							}//end else

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
					location.href = "/test/login"; 
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
					 alert('삭제할 수 없습니다');
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

		commentsview += '<div>';
		commentsview += '<form name="replyForm" method="post">';
		commentsview += '<input type="hidden" id="PostID" name="PostID" value="${retrieve.postID}">';
		commentsview += '<br/><p>';
		commentsview += '<input type="hidden" id="postType" name="postType" value="${retrieve.postType}">';

		commentsview += '</p>';
		commentsview += '<br/>';
		commentsview += '내용<input type="text" id="cCONTENT" name="cCONTENT"> <br />';
		commentsview += '<br/>';
		commentsview += '<button type="button" class="btn btn-outline-success"';
		commentsview += 'onclick="commentBtn(' + CommentID + ')">대댓글작성</button>';
		commentsview += '<button type="button" class="btn btn-outline-success" onclick="getreplylist()" >';
		commentsview += '취소';
		commentsview += '</button>';
		commentsview += '</form>';
		commentsview += '</div>';
		commentsview += '<br/>';
		
		
		/* $('#CommentID' + CommentID).append(commentsview); */
		$(commentsview).insertAfter('#CommentID' + CommentID);
		
		/* $('#CommentID' + CommentID + '#reply_content').focus(); */
		event.preventDefault();

	};
	
	
	//////////////////////////////////////////
	
	
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
    .submit-button {
        padding: 5px 10px;
        background-color: #35424a;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
   	
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
	<span>${read.content}</span><br>
	<hr>
	file Link: <a href="${upload.downloadurl}" target="_blank">${upload.filename}</a>
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
   

	<div class="container">
		<!-- 댓글이 들어갈 div -->
		<div id="replylist"></div>
	</div>
    
    <!-- 사용자 이미지, 닉네임 -->
   <!--  <div class="postComment" style="display: flex; align-items: flex-start; margin-top: 10px;">
        <div class="box" style="background: #BDBDBD;">
            <img class="profile" src="resources/a.jpg">
        </div>
        <div style="display: flex; flex-direction: column; margin-left: 10px;">
            <span style="font-size:15px; font-weight: bold;">사용자별명</span>
            <span style="font-size: 8px; color:#bbb">2023-08-14 08:00</span>
            <span style="font-size:12px">댓글내용.. 어쩌구 저쩌구....</span>
            <button style="margin-top: 5px; padding: 2px 5px; font-size: 5px; width: 35px;">답글</button>
        </div>
        <span style="margin-left: auto; margin-right: 10%">🟰</span>
    </div>  -->
    
</div>

    <div class="fixed-input"><!-- 댓글 작성을 위한 폼 -->
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
    </div>
    

<button type="button" id="listbtn" class="listbtn">이전 페이지가 적용된 목록으로</button>
 <form method="post">   
 	<input type="hidden" id="AuthorID" name="AuthorID" value="${read.authorID}">
	<button type="button" id="delete_column" class="delete_column">게시글의 컬럼이 변경되는 삭제</button>
</form>
<%-- <a href="delete?PostID=${read.postID}">삭제</a> --%>
	
<br>
<jsp:include page = "../common/footer.jsp" flush="true"/><br><br><br>
</body>
</html>