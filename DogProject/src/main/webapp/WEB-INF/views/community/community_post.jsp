<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Base64"%>
<%@page import="com.example.dto.UsersDTO"%>
<%@page import="com.example.dto.LikeDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- displays site properly based on user's device -->
<title>커뮤니티-게시물</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />


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
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 

<!-- <link rel="stylesheet" href="resources/postcss/test.css">  -->

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

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
				 if(data == '삭제되었습니다'){
// 				  	Swal.fire('성공', data, 'success');
					  Swal.fire({
						   title: '성공',
						   text: data,
						   icon: 'success',
						   
						   confirmButtonColor: '#006400', // confrim 버튼 색깔 지정
						   confirmButtonText: '커뮤니티 이동', // confirm 버튼 텍스트 지정
						   
						   
						}).then(function (result) {
						   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
							   location.href = "community";
							}
						});
				 }else{
				  Swal.fire('경고', data, 'warning'); 
				 }
			 },
			 error:function(xhr,status,error){ 
		      /* location.href = "/app/community";  */
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
				 /* $("#heartImg").attr("src","resources/postcss/heart.png"); */
				 var src = ($("#heartImg").attr('src') === 'resources/postcss/heart.png')
		            ? 'resources/postcss/emptyheart.png'
		            : 'resources/postcss/heart.png';
		         $("#heartImg").attr('src', src);
				 
				 
// 				 $("#likelike").val('좋아요${n2222}');
// 				 location.href = "/test/post?PostID="+ PostID;	
// 				 event.preventDefault();
			 },
			 error:function(xhr,status,error){
				 Swal.fire('로그인이 필요합니다', error, 'error');
			 }
		  });//end ajax
	});//end on  
});//end ready



//////////////////////////////////////////

$(document).ready(function() {
	getreplylist();
	$("input[name='order']").on("click",function(){	
		var order = $("input[name='order']:checked").val();
			console.log(order);
			getreplylist();
	});
});


function getreplylist() { ////댓글 리스트 출력 이벤트
	var replyurl = "${root}";
	var PostID = $("#PostID").val();
	var order = $("input[name='order']:checked").val(); // 선택된 라디오 버튼의 값을 가져옵니다.
    // 선택된 라디오 버튼의 값에 따라 URL을 변경합니다.
   	if(order === "오래된 순") {
        replyurl += "replyui/" + PostID;
    } else if (order === "최신순") {
        replyurl += "replyut/" + PostID;
    }
	
	$.ajax({
		url : replyurl,
		type : 'post',
		dataType : 'json',
		async : false,
		success : function(result, status, xhr) {
			console.log(result);
			var comments = "";
			if (result.length < 1) {
				comments = "등록된 댓글이 없습니다.";
			} else {
				$.each(
						result,
						function(idx, ele) {
					
							if (this.commentType === 'deleted') {	
							comments += '<div id="CommentID'+this.commentID+'" class="grid-container"><div>삭제된 글입니다</div></div>';
							
							}
							else if(!this.parentCommentID){
								comments += '<div id="CommentID'+this.commentID+'" class="grid-container grid-container--posted">';
								comments += '<picture class="user">';
								comments += '<img src="resources/postcss/pet-care-cat.png" alt="julius avatar">';
								comments += '</picture>';
								comments += '<h3 class="name">'
										+ this.authorID
										+ '</h3>&nbsp;&nbsp;&nbsp;&nbsp;';
								comments += '<p class="time">'
								comments += '작성 날짜 : '
										+ this.creationTime
										+ '</p>';
										+ '<br/>';
								comments += '<p class="comment">';
								comments += '내용 : &nbsp;&nbsp;&nbsp&nbsp;'
										+ this.content;
								comments += '</p>';
						
								
								comments += '<input type="hidden" id="CommentType" name="CommentType" value="'+ this.commentType +'">';
								comments += '<input type="hidden" id="ParentCommentID" name="ParentCommentID" value="'+ this.parentCommentID +'">';
								comments += '<button type="button" id="edit" class="purple" style="border: none" onclick="updateviewBtn('
										+ this.commentID
										+ ',\''
										+ this.creationTime 
										+ '\', \''
										+ this.content
										+ '\', \''
										+ this.authorID
										+ '\')"><img src="resources/postcss/icon-edit.svg" alt="edit button" width="23" height="23">';
								comments += 'EDIT</button>';
								comments += '<button type="button" class="red delete" onclick="deleteBtn('
										+ this.commentID
										+ ',\''
										+ this.authorID
										+ '\')"><img src="resources/postcss/icon-delete.svg" alt="delete button" width="23" height="23">';
								//comments +='<button type="button" onclick="replydelete('+this.commentID+')">'>';
								comments += 'DELETE</button>';
								comments += '<button type="button" id="reply" class="purple" style="border: none" onclick="commentsviewBtn('
									+ this.commentID
									+ ',\''
									+ this.authorID
									+ '\')"><img src="resources/postcss/icon-reply.svg" alt="reply button" width="23" height="23">';
								comments += 'REPLY</button>';
								comments += '</div>';

							}else{
								
								comments += '<div id="CommentID'+this.commentID+'" class="grid-container grid-container--postedd reply">';
								comments += '<picture class="user">';
								comments += '<img src="resources/postcss/pet-care-dog.png" alt="julius avatar">';
								comments += '</picture>';
								comments += '<h3 class="name1" style="color: green;">'
										+ '@'+this.parentAuthorID
										+ '</h3><h3 class="name2">'+this.authorID
										+ '</h3>';
								comments += '<p class="time">'
								comments += '작성 날짜 : '
										+ this.creationTime
										+ '</p>';
										+ '<br/>';
								comments += '<div class="comment">';
								comments += '내용 : &nbsp;&nbsp;&nbsp&nbsp;'
										+ this.content;
								comments += '</div>';
						
								
								comments += '<input type="hidden" id="CommentType" name="CommentType" value="'+ this.commentType +'">';
								comments += '<input type="hidden" id="ParentCommentID" name="ParentCommentID" value="'+ this.parentCommentID +'">';
								comments += '<button type="button" id="edit" class="purple" style="border: none" onclick="updateviewBtn('
										+ this.commentID
										+ ',\''
										+ this.creationTime 
										+ '\', \''
										+ this.content
										+ '\', \''
										+ this.authorID
										+ '\')"><img src="resources/postcss/icon-edit.svg" alt="edit button" width="23" height="23">';
								comments += 'EDIT</button>';
								comments += '<button type="button" class="red delete" onclick="deleteBtn('
										+ this.commentID
										+ ',\''
										+ this.authorID
										+ '\')"><img src="resources/postcss/icon-delete.svg" alt="delete button" width="23" height="23">';
								//comments +='<button type="button" onclick="replydelete('+this.commentID+')">'>';
								comments += 'DELETE</button>';
								comments += '<button type="button" id="reply" class="purple" style="border: none" onclick="commentsviewBtn('
									+ this.commentID
									+ ',\''
									+ this.authorID
									+ '\')"><img src="resources/postcss/icon-reply.svg" alt="reply button" width="23" height="23">';
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
					if(result.result == 'error'){
						Swal.fire({
							   title: '로그인이 필요합니다',
							   text: '',
							   icon: 'error',
							   
							   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
							   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
							   
							}).then(function (result) {
							   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
								   getreplylist();
								}
							});
					}else{		
					getreplylist();
					$('#rCONTENT').val('');
					count++;
					$('#replyCount').text(count+"개의 댓글");
					}
				},
				error : function(error) {
					console.log("에러 : " + error);
					location.href = "/app/login"; 
				}
			})
		});

	});

	/////////////////////////////////////////////////////
	
	 function updateBtn(CommentID, AuthorID) {// 댓글 수정해주는 이벤트
			var updateurl = "${root}replyupdate/";
			var reply_content = $("#reply_edit_content").val();

			$.ajax({
				url : updateurl + CommentID + '/'+AuthorID+ '/'+ reply_content,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result.result);
					if(result.result == 'success'){
						Swal.fire({
							   title: '정말 댓글 수정하시겠습니까?',
							   text: '',
							   icon: 'question',
							   
							   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
							   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
							   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
							   cancelButtonText: '아니오', // cancel 버튼 텍스트 지정
							   confirmButtonText: '예', // confirm 버튼 텍스트 지정
							   
							}).then(function (result) {
							   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
								   getreplylist();
								}
							});
					}else if(result.result == 'null'){
						Swal.fire({
							   title: '댓글 수정할 수 없습니다',
							   text: '',
							   icon: 'warning',
							   
							   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
							   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
							   
							}).then(function (result) {
							   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
								   getreplylist();
								}
							});
					}else if(result.result == 'error'){
						Swal.fire({
							   title: '로그인이 필요합니다',
							   text: '',
							   icon: 'error',
							   
							   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
							   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
							   
							}).then(function (result) {
							   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
								   getreplylist();
								}
							});
					}				
				},
				error : function(error) {
					Swal.fire('에러', error, 'error');
				}
			});

	};//end
	
	function updateviewBtn(CommentID, CreationTime, Content, AuthorID) {// 댓글 수정해주는 이벤트
		console.log("들어와라");

		var commentsview = "";

		commentsview += '<div class="grid-container grid-container--newUpdate">';
		commentsview += '<div class="input-group">';
		commentsview += ' <textarea class="form-control" type="text" id="reply_edit_content">'
		commentsview += Content;
		commentsview += '</textarea>';
		commentsview += ' </div>';
		
		commentsview += '<picture class="user">';
		commentsview += '<img src="resources/postcss/dogreplyedit.png" alt="julius avatar">';
		commentsview += '</picture>';
		
		commentsview += '<button type="button" class="btn btn1"';
		commentsview += 'onclick="updateBtn(' + CommentID + ',\'' + AuthorID
		+ '\')">수정</button>';
		
		commentsview += '<button type="button" class="btn btn2" id="cancel" onclick="getreplylist()" >';
		commentsview += '취소';
		commentsview += '</button>';
		commentsview += '</div>';
		commentsview += '<br/>';
		
		$('#CommentID' + CommentID).replaceWith(commentsview);
		$('#CommentID' + CommentID + '#reply_content').focus();

	};//end
	
	//////////////////////////////////////////
	
	

	function deleteBtn(CommentID, AuthorID) { // 댓글 삭제해주는 이벤트
			var deleteurl = "${root}replydelete/";
	
			$.ajax({
				url : deleteurl + CommentID + '/' + AuthorID,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					if(result.result == 'success'){
						Swal.fire({
							   title: '정말 댓글 삭제하시겠습니까?',
							   text: '',
							   icon: 'question',
							   
							   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
							   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
							   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
							   cancelButtonText: '아니오', // cancel 버튼 텍스트 지정
							   confirmButtonText: '예', // confirm 버튼 텍스트 지정
							   
							}).then(function (result) {
							   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
								   getreplylist();
								}
							});
					}else if(result.result == 'null'){
						Swal.fire({
							   title: '댓글 삭제할 수 없습니다',
							   text: '',
							   icon: 'error',
							   
							   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
							   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
							   
							}).then(function (result) {
							   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
								   getreplylist();
								}
							});
					}else if(result.result == 'error'){
						Swal.fire({
							   title: '로그인이 필요합니다',
							   text: '',
							   icon: 'error',
							   
							   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
							   confirmButtonText: '확인', // confirm 버튼 텍스트 지정
							   
							}).then(function (result) {
							   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
								   getreplylist();
								}
							});
					}					
				},
				error : function(error) {
					
				}
			});
		
	};

	//////////////////////////////////////////
	
	function commentBtn(CommentID, AuthorID) {     //대댓글 작성 이벤트
			console.log("들어오기는 함?????");
			var Content = $('#cCONTENT').val();
			PostID = ${read.postID};
			ParentCommentID = CommentID;
			ParentAuthorID = AuthorID;
			var count= ${replyCount};

			var writeurl = "${root}replywritewrite/";
			$.ajax({
				url : writeurl + PostID + '/' + Content + '/' + ParentCommentID + '/' + ParentAuthorID,
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
	

	function commentsviewBtn(CommentID, AuthorID) {  //대댓글 작성 이벤트
		console.log("들어와라");

		var commentsview = "";
		
		commentsview += '<div class="grid-container grid-container--newnew">';
		commentsview += '<div class="input-group">';
		
		commentsview += '<input type="hidden" id="PostID" name="PostID" value="${retrieve.postID}">';
		commentsview += '<br/>';
		commentsview += '<input type="hidden" id="postType" name="postType" value="${retrieve.postType}">';
		commentsview += '<input type="hidden" id="AuthorID" name="AuthorID" value="${read.authorID}">';
		commentsview += '<input type="file" id="imageInput" style="display: none;">';
		commentsview += ' <label for="imageInput" class="attach-button">사진 첨부</label>';
		commentsview += ' <textarea class="form-control" type="text" id="cCONTENT" name="cCONTENT" value="" placeholder="Add a comment..."></textarea>';
		
		commentsview += ' </div>';
		commentsview += '<picture class="user">';
		commentsview += '<img src="resources/postcss/dogcomment.png" alt="julius avatar">';
		commentsview += '</picture>';
		
		commentsview += '<button type="button" class="btn btn1"';
		commentsview += 'onclick="commentBtn(' + CommentID + ',\'' + AuthorID
		+ '\')">작성</button>';
		commentsview += '<button type="button" class="btn btn2" id="cancel" onclick="getreplylist()" >';
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
	
$(function() {     //게시글 수정하는 이벤트
	$("#modify").click(function(){
		var userID = $("#userID").val()	
		var PostID = $("#PostID").val()	
		var AuthorID = $("#AuthorID").val()	
		if(userID == ""){
			Swal.fire({
				   title: '로그인이 필요합니다',
				   text: '',
				   icon: 'error',
				   
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   confirmButtonText: '확인', // confirm 버튼 텍스트 지정 
			})			
		}else if(userID != AuthorID){
			Swal.fire({
				   title: '수정할 수 없습니다',
				   text: '',
				   icon: 'error',
				   
				   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				   confirmButtonText: '확인', // confirm 버튼 텍스트 지정 
			})	
		}else{
			location.href = "/app/updatePost?PostID="+PostID;	
		}             		
	
	});
}); 
	
</script>
<style type="text/css">
 /* 	 body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	}   */
	
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



body{
	margin: 0;
	font-family: 'Exo', sans-serif;

}

	h1 {
    line-height: 38px;
    font-size: 38px;
    letter-spacing: -1px;
    text-shadow: 0 0 2px rgba(0,0,0,.1);
    font-weight: 700;
    color: var(--color-text1);
    text-align: center;
}
	h2 {
    line-height: 38px;
    font-size: 38px;
    letter-spacing: -1px;
    text-shadow: 0 0 2px rgba(0,0,0,.1);
    font-weight: 700;
    color: var(--color-text1);
    text-align: center;
  
}
 .NoticeDetail_detail_top__3e1t0 {
    position: relative;
    padding: 85px 35px 29px 35px;
 	text-align: center;
   	border-bottom-width: 10px;
   	border: inherit;
  	/* height:300px;
  	width: 500px; */
  	/* margin: 40px 250px 40px 250px;  */
  /* 	border-bottom: 3px solid rgba(34,34,34,.1);  */
} 

#tag1{
    	width: auto%; /* 너비 조정 */
	  /*   margin: auto;  */ /* 가운데 정렬 */
	    font-size: 12px; /* 폰트 크기 조정 */
	    padding: 10px; /* 내부 여백 설정 */
	   	border-radius: 24px;
	   	border: 1px solid #8a8984;
	   	box-shadow: 0 3px 5px 0 hsla(0, 0%, 0%, 0.2);
	   	  position: absolute;
	   	  background-color:hsl(96,85%,92%);
	  	top:1px;
	  	left:47px;
}

#NoticeTitle{
  position: absolute;
  font-size:35px;
  top:50px;
  left:45px;
  /*  right: 0px; */ 
  /* bottom: 0px;  */
}
#NoticeTime{
  position: absolute;
  top:30px;
  left:70px;
  
}
#NoticeHit{
  position: absolute;
   top:56%; 
 
  right:3px;
 
}
#NoticeWriter{
  position: absolute;
  top:8px;
  left:70px;
}
#NoticePicture{
  position: absolute;
  top:8px;
  left:12.5px;
}
#div6{
  position: relative;
/*   padding: 30px 0 29px 35px; */
  text-align: center;
  border-bottom-width: 10px;
  border:inherit;
  border-bottom: inherit;
  	/* height:300px;
  	width: 500px; */
}


 .ContactCenter_Notice_Bottom_Center {
	top: 100px;
	bottom: 100px;

} 


/* .ContactCenter_Notice{
	margin: 5px 10% 5px 10%;
	padding: 0px 10px 0px 10px;
  	border-left: 3px solid #b2c3d3;
  	border-right: 3px solid #b2c3d3; 


}*/

/* .ContactCenter_Notice > * {
  border-left: none;
  border-right: none;
  border-bottom: none;
 
} */


@charset "UTF-8";

  :root {
    /* colors */
    --clr-darkb: 212, 24%, 26%;
    --clr-vlightg: 228 33% 97%;
    --clr-lightg: 223 19% 97%;
    --clr-lightgb: 239 57% 85%;
    --clr-greyb:211, 10%, 45%;
    --clr-white: 0 0% 100%;
    --clr-modblue: 238, 40%, 52%;
    --clr-yellow: 57,97%,74%;
    --clr-softred: 358, 79%, 66%;
    --clr-palered: 357, 100%, 86%;

    /* font-sizes */
    /* --fs-900: clamp(5rem, 8vw + 1rem, 9.375rem); */
    --fs-700: 1.5rem;
    /* --fs-600: 1rem; */
    --fs-500: 1.1rem;
    --fs-400: 1rem;
    /* --fs-300: 1rem;
    --fs-200: 0.875rem; */

    /* font-families */
    /* --ff-serif: "Bellefair", serif; */
    --ff-sans: 'Rubik', sans-serif;
    /* --ff-sans-normal: "Barlow", sans-serif; */
}

@media (min-width: 35em) {
    :root {
        /* --fs-800: 5rem;
        --fs-700: 2.5rem;
        --fs-600: 1.5rem;
        --fs-500: 1.25rem;
        --fs-400: 1rem; */
    }
}

@media (min-width: 45em) {
    :root {
        /* font-sizes */
        /* --fs-800: 6.25rem;
        --fs-700: 3.5rem;
        --fs-600: 2rem;
        --fs-500: 1.75rem;
        --fs-400: 1.125rem;*/
    }
}

/* ------------------- */
/* Reset               */
/* ------------------- */

/* https://piccalil.li/blog/a-modern-css-reset/ */

/* Box sizing */
*,
*::before,
*::after {
    box-sizing: border-box;
}

/* Reset margins */
body, h1, h2, h3, h4, h5, p, figure, picture {
    margin: 0;
}

/* h1, h2, h3, h4, h5, h6, p {
    font-weight: 400;
} */

/* set up the body */
body {
    font-family: var(--ff-sans);
    font-size: var(--fs-400);
    /* color: hsl( var(--clr-greyb) ); */
    /* background-color: hsl( var(--clr-vlightg) ); */
    line-height: 1.5;
    min-height: 100vh;
    /* display: grid;
    grid-template-rows: min-content 1fr; */
    overflow-x: hidden;
}

/* make images easier to work with */
img, picture {
    max-width: 100%;
   /*  display: block;  */
}

/* make form elements easier to work with */
input, button, textarea, select {
    font: inherit;
}

/* remove animations for people who've turned them off */
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}

/* ------------------- */
/* Utility classes     */
/* ------------------- */

.padding-block {padding-block:1.5rem;}

h3 {
  font-size: var(--fs-500);
  font-weight: 500;
}

.purple {
  color:hsl(var(--clr-modblue));
  font-weight: 500;
      justify-self:right;
      background-color: inherit; 
}
.red {
  color:hsl(var(--clr-softred));
  font-weight: 500;
}
.purple:hover, .red:hover{
  opacity: 0.5;
}
.flex {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap:0.5rem;
}
.flex2 {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  gap:0.5rem;
}

 .grid-container {
  border: 1px solid #F0FFF0;
  display: grid;
  margin:1rem;
  padding:1rem;
  border-radius: 10px; 
 place-items:center;	
  background-color: hsl( var(--clr-white) ); 
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
  /* grid-gap: 1rem; */
 
} 


/*  .grid-container--posted {
  align-items: center; */
  /* justify-content: left; */
/*   grid-template-areas:
    "user name time edit ."
    "comment comment comment comment"
    "vote vote . . reply"
    
}  */

/* .grid-container--you {
  align-items: center;
  grid-template-areas:
    "user name you time time"
    "comment comment comment comment comment"
    "vote vote vote delete reply";
}
 */
/* .grid-container--new {
  grid-template-areas:
    "textbox textbox"
    "user btn "
} */

/*  .grid-container--posted > a, .grid-container--you > a{
  grid-area: reply;
  justify-self:right;
  text-decoration: none;
  grid-column-end:-1;
}  */
 .delete {
  grid-area: delete;
  justify-self:right;
  text-decoration: none;
  align-items: center;
  border:none;
  background-color: inherit; 
  padding: 0;
}
 #edit {
  grid-area: edit;
  justify-self:right;
  text-decoration: none;
  align-items: center;
  border:none;
  background-color: inherit; 
  padding: 0;
}
 #reply {
  grid-area: reply;
  justify-self:right;
  text-decoration: none;
  align-items: center;
  border:none;
  background-color: inherit; 
 /*  padding: 0; */
}
.cancel{
	grid-area: cancel;
  justify-self:right;
  text-decoration: none;
  align-items: center;
  border:none;
  background-color: inherit; 
  padding: 0;
}

.grid-container--posted a > img, .grid-container--you a > img , .grid-container--you button > img {
  display: inline-block; 
  padding-right: 0.2rem;
}
.grid-container--posted > h3, .grid-container--you > h3 {
  grid-area: name;
}
.time {
  grid-area:time;
}
/* .vote {
  grid-area:vote;
  background-color: hsl( var(--clr-vlightg) );
  padding:0.5rem 1rem;
  border-radius: 10%;
  width:min(60%, 7rem);
} */
/* .vote > img {
  opacity: 0.5;
} */
/* .vote > img:hover {
  cursor: pointer;
  opacity: 1;
} */
.user {
  grid-area:user;
  justify-self:left;
  }
.name {
  grid-area:name;
  justify-self:left;
}
.name1 {
  grid-area:name1;
  justify-self:left;
}
.name2 {
  grid-area:name2;
  justify-self:left;
}
.you {
  grid-area: you;
  background-color: hsl(var(--clr-modblue));
  color: white;
  padding-inline:0.5rem;
  width:3rem;
  text-align: center;
}
.comment {
  grid-area:comment;
  justify-self:left;
  width: 500px;
  border: none;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.input-group{
  grid-area: textbox;
}

.btn {
  align-self: center;
  text-transform: uppercase;
}
.modal-footer > .btn {
  width: 12rem;
}
 .btn-danger {
  background-color: hsl(var(--clr-softred))
} 
.btn1 {
  width:100px;
  height: 3rem;
  color: hsl( var(--clr-white) );
  background-color: hsl( var(--clr-modblue) );
  grid-area: btn;
  justify-self:right;
}
.btn2 {
  width:100px;
  height: 3rem;
  color: hsl( var(--clr-white) );
  background-color: hsl(2,97%,54%);
  grid-area: cancel;
  justify-self:right;
}

.btn1:hover,.btn1:focus {
  opacity: 0.5;
  color: hsl( var(--clr-white) );
  transition: opacity 300ms linear;
}
.btn2:hover,.btn2:focus {
  opacity: 0.5;
  color: hsl( var(--clr-white) );
  transition: opacity 300ms linear;
}
.reply {
  margin-left: 1rem;
  border-left: 2px solid hsl(var(--clr-lightgb)/0.3);
}
/* .votes {
  width: 10px;
} */

@media (min-width: 35em) {

    .grid-container {
      margin-inline: auto;
      width: 80%;
    }
  
    .grid-container--posted {
      grid-template-areas:
        "user name time edit reply"
        ". comment comment comment delete";
      grid-template-columns: 80px auto auto 80px 110px; 
      grid-template-rows: auto;
    }
    
    .grid-container--postedd{
      grid-template-areas:
        "user name1 name2 time edit reply"
        ". comment comment comment comment delete";
     /*  grid-template-columns: 80px auto auto 80px 110px;  */
    }
    
    .grid-container--you {
      grid-template-areas:
        "user name you time . delete reply"
        "comment comment comment comment comment comment comment";

    } 
   	.grid-container--new {
      grid-template-areas:
          "user textbox btn";
      grid-template-columns: 80px auto 110px;
    } 
    
   	.grid-container--newnew {
      grid-template-areas:
          "user textbox btn cancel";
      grid-template-columns: 80px auto 110px 110px;
    } 
    
    .grid-container--newUpdate {
      grid-template-areas:
          "user textbox btn cancel";
      grid-template-columns: 80px auto 110px 110px;
    } 
    .flex {
      flex-direction: column;
      justify-content: space-evenly;
    }
    .vote {
      width: auto;
      justify-self:left;
      height: 80%;
      padding-block:0.5em;
    }
    
    .user {
      align-self: flex-start;
      width:55px;
    }
    
   	.reply{
      width: 70%;
     /*  margin-left: 23%;
      margin-right: 20%; */
      margin-left: 20%;
      margin-right: 23%;
    } 
    .reply > .grid-container {
      width:auto;
      margin-left: 2rem;
   
    }
}
   	
   
 .NoticeDetail_detail_top__3e1t1 {
    position: relative;
    padding: 35px 35px 29px 35px;
   	border-bottom-width: 10px;
   	border: none;
  	/* height:300px;
  	width: 500px; */
  /* 	margin: 40px 250px 40px 250px;    */
}  

.listbtn{
	background-color: #eaeaea;
	border-style:solid;
	border-radius:7px;
	border-color:transparent;
	font-size: 18px;
	position: absolute;
    right: 0;
    bottom: 0;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.4);
}	


.card {
    height: 55px;
    width: 38px;
    border-color: transparent;
    background-color: inherit;
	
}

.my-5 {
    margin-top: 0rem!important ; 
    margin-bottom: 0rem!important; 
}

#card{
	/* position: absolute; */
	left: 95%;
}

.postpost{
	padding: 0 2% 0 2%; 
	margin:  0 13% 0 15%;
	box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.4);
	border-radius: 3px;
	border: 1px solid #F0FFF0;
}

/* hr .hr{
	border-bottom: 10px solid hsl(158,91,74%); 
	border: none;
} */


.card-body {
    flex: 1 1 auto;
    padding: 0.5rem 0rem 0.5rem 1rem;
}

</style>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
   
 <%-- 	<hr align="center" style="border: ridge 3px orange; width: 85%;">
<div class = "postContent" style="margin-left: 10%;">
	<img src="resources/a.jpg" id="로고" width=500 height=300 value="">
	<br>
	<hr>
	<span>${read.content}</span><br>
	<hr>
	file Link: <a href="${upload.fileurl}" target="_blank">${upload.filename}</a>
</div>


<form action="like" method="post">
   <input type="hidden" name="PostID" id="LikePostID" value="${read.postID}">
	<span style="text-align: center; display: block;"><input type="button" id="likelike" value="좋아요${n2222}"></span>
  </form> 
<a style="text-align: right; display: block; margin-right: 20%;">공유</a>
<hr align="center" style="border: ridge 3px orange; width: 85%;"> --%> 

<div class="postpost">
	<br><br>
<div class="ContactCenter_Notice">

		<div class="NoticeDetail_detail_top__3e1t0">
				<form action="readForm" method="post">
					<input type="hidden" id="PostID" name="PostID" value="${read.postID}">
					<input type="hidden" id="page" name="page" value="${ppDTO.curPage}">
					<input type="hidden" id="AuthorID" name="AuthorID" value="${read.authorID}">
				</form>
			<span id ="tag1">${read.tag}</span><br>
			<div id="NoticeTitle" class="ContactCenter_Notice_Top_Name">${read.title}</div>
			<div id="div6">
			<div id="NoticeWriter">${read.authorID}</div>
			<div id="NoticeHit">조회수 ${read.hit}</div>
			<div id="NoticePicture"><img src="resources/postcss/dogread.png" alt="운영자 사진" width="45" height="45"></div>
			<div id="NoticeTime" class="ContactCenter_Notice_Top_Uploaddate">${read.creationTime}</div>
	
			                   <div id="card" class="card" style="cursor: pointer; ">
			                   <input type="hidden" id="userID" value="${uDTO.userID}"> 
			                    <div class="card-body">
			                        <div class="dropdown ms-auto">
			                            <i class="fas fa-ellipsis-vertical" data-bs-toggle="dropdown" aria-expanded="false"></i>
			                            <ul class="dropdown-menu">
			                              <li>
			                                <span class="dropdown-item">
			                                  <button type="button" id="modify" class="fas fa-pen mx-2" style="border: 0; background-color: transparent;">수정</button>		                                
			                                </span>
			                              </li>
			                              <li>
			                                <span class="dropdown-item">
			                                    <button type="button" id="delete_column" class="fas fa-trash mx-2" style="border: 0; background-color: transparent;">삭제</button>
			                                </span>
			                              </li>
			                            </ul>
			                        </div>
			                     </div>
			                   </div>
			          			
		    						<%-- <div id="NoticeHit" class="ContactCenter_Notice_Top_Count">조회수: ${read.hit}</div> --%>		
			</div>
			
			<hr class="hr"> 
		</div>
	<div class="NoticeDetail_detail_top__3e1t1">
     <div class="ContactCenter_Notice_Bottom_Center">${read.content}</div>
     <hr>
	첨부파일: <a href="${upload.fileurl}" target="_blank">${upload.filename}</a><br><br>
     </div>


<%-- <%List<LikeDTO> ldto = (List<LikeDTO>) request.getAttribute("ldto");%> 
<%UsersDTO uudto = (UsersDTO) session.getAttribute("User"); 	
%>  --%>
				<form action="like" method="post">
					<input type="hidden" name="PostID" id="LikePostID" value="${read.postID}"> 
					<span style="text-align: center; display: block;">
					<%-- <div>
                        <button type="button" id="likelike" value="좋아요${n2222}" style="border: 0; background-color: transparent;">
          				<img id="heartImg" src="resources/postcss/emptyheart.png" alt="좋아요사진" width="45" height="45">
          				</button>
          			</div>	 --%>
                   
           <%--        <%for(int i = 0; i< ldto.size(); i++){
           			if(UserID == null) {%>
                   	<button type="button" id="likelike" value="좋아요${n2222}">
								<img id="heartImg" src="resources/postcss/dots.png"
									alt="좋아요사진" width="45" height="45">
							</button> --%>
                   <%-- <%}else if(userID == ldto.get(i).getUserID()){ %>
                   <button type="button" id="likelike" value="좋아요${n2222}">
								<img id="heartImg" src="resources/postcss/emptyheart.png"
									alt="좋아요사진" width="45" height="45">
							</button>
					<%}else if(userID != ldto.get(i).getUserID()){ %>
                   <button type="button" id="likelike" value="좋아요${n2222}">
								<img id="heartImg" src="resources/postcss/heart.png"
									alt="좋아요사진" width="45" height="45">
							</button> --%>
               <%--  	<%} %> 
                   <%} %>   --%>
                   
					<c:choose>
						<c:when test="${uDTO.userID == null}">
							<button type="button" id="likelike" value="좋아요${n2222}">
								<img id="heartImg" src="resources/postcss/dots.png"
									alt="좋아요사진" width="45" height="45">
							</button>
						</c:when>
						<c:when test="${uDTO.userID ne ldto.userID}">
							<button type="button" id="likelike" value="좋아요${n2222}">
								<img id="heartImg" src="resources/postcss/emptyheart.png"
									alt="좋아요사진" width="45" height="45">
							</button>
						</c:when>
						<c:when test="${uDTO.userID eq ldto.userID}"> 
							<button type="button" id="likelike" value="좋아요${n2222}">
								<img id="heartImg" src="resources/postcss/heart.png"
									alt="좋아요사진" width="45" height="45">
							</button>
						</c:when>
					</c:choose> 
					
				</span>
				</form>
				
				
							
				
	<div class="NoticeDetail_detail_top__3e1t1">
	<button type="button" id="listbtn" class="listbtn">목록</button>
	</div>		
     
   <hr align="center" style="border: 5px rgb(125,127,117); text-align:center;">  

</div> 

<br>


<div class="postComments" style="margin-left: 10%;">
    <div id="replyCount">${replyCount}개의 댓글</div>
    최신순<input type="radio" name="order" value="최신순">
    오래된순<input type="radio" name="order" value="오래된 순" checked="checked">
</div>   

   <div class="grid-container grid-container--new">

    <div class="input-group">
  
   		<input type="hidden" id="PostID" name="PostID" value="${read.postID}"> 
   		<input type="hidden" id="postType" name="postType" value="${read.postType}">
   		<input type="hidden" id="AuthorID" name="AuthorID" value="${read.authorID}">
   		<input type="hidden" id="AuthorID" name="AuthorID" value="${read.authorID}">
   		<input type="file" id="imageInput" style="display: none;">
	    <label for="imageInput" class="attach-button">사진 첨부</label>
   		  
      <textarea class="form-control" type="text" id="rCONTENT" name="rCONTENT" value="" placeholder="Add a comment..."></textarea>
    </div>
 <% 	boolean userFlag = true;
	if(session.getAttribute("User") == null) {
		userFlag = false;
	}else { 

    UsersDTO udto = (UsersDTO) session.getAttribute("User"); 	
    
	int Post = udto.getPost();
    String UserName = udto.getUserName();
    String UserAlias = udto.getUserAlias();
    String UserType = udto.getUserType();

    byte[] userImgBytes = udto.getUSERIMG();  // 바이트 배열 형태의 이미지 데이터
    String imageSrc = null;
    if(userImgBytes == null){  
    	 imageSrc = "강아지기본이미지" ;  //강아지기본이미지.JPG
    } else {
    	String base64Image = Base64.getEncoder().encodeToString(userImgBytes);
    	 imageSrc = "data:image/jpeg;base64," + base64Image;
    	}
%>   
   <!-- </form> -->
 	<picture class="user"> 
 	<% if(userImgBytes == null){%>
 		<img src="resources/<%= imageSrc %>.JPG" alt="defaultIMG">
 	<% } else{%>
      <img src="<%= imageSrc %>" alt="userIMG" style="size: auto;">
       <input type="hidden" id="userIMG" name="userIMG" value="<%= imageSrc %>">
     <% } }%>
     
    
	</picture>	
    <button class="btn btn1" type="button" name="button" id="submit-button">Send</button>
    
   
	 
 		</div> 
		<!-- 댓글이 들어갈 div -->
		<div id="replylist"></div>

	
</div>  
<br>
<jsp:include page = "../common/footer.jsp" flush="true"/><br><br><br>
</body>
</html>