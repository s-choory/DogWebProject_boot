<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type=text/javascript charset=utf-8 src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<script>
$(function () {
	CKEDITOR.replace('content', {
		filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do'
	});
	
	
  $('#postTags').on('keydown', function(e) {
	  if ($(this).val() === '' && e.key !== 'Backspace' && e.key === ' ') {
	    e.preventDefault();
	  } else if ($(this).val() === '' && e.key !== 'Backspace') {
	    $(this).val('#');
	  } else if (e.key === '#') {
	    e.preventDefault();
	    alert('#을 사용할 수 없습니다.');
	  } else if (e.key === ' ') {
	    e.preventDefault();
	    var currentValue = $(this).val();
	    if (currentValue.endsWith(' #')) {
	      return false;
	    }
	    $(this).val($(this).val() + ' #');
	  } else if (e.key === 'Backspace' && $(this).val().endsWith('#')) {
	    e.preventDefault();
	    var currentValue = $(this).val();
	    $(this).val(currentValue.substring(0, currentValue.length - 2));
	  }
	}); 
  
  
  
});//end function

$(function () {
	  $('.submitButton').on('click', function(e) {
	    if ($('#postTitle').val() === '') {
	      alert("제목을 입력하시오");
	      e.preventDefault();
	    } 
	    /* else if ($('#editor').val().trim() === '') {
	    	 alert("내용을 입력하시오");
	    	  e.preventDefault();
	   	} */
	  }); 
});//end function


</script>

<style type="text/css">

#postTitle{
 	background-color: transparent; 
	border-style: none;
	border-bottom: 1px solid hsl(120,1%,90%); /* 밑줄 스타일 */
	font-size: 35px;
}

#postTags{
	background-color: transparent;
	border-style: none;
	border-bottom: 1px solid hsl(120,1%,90%); /* 밑줄 스타일 */
	font-size: 13px;
}


.submitButton{
	background-color: transparent;
	border-style:solid;
	border-radius:1px;
	font-size: 25px;
	position: absolute;
    right: 0;
    bottom: 0;
}

.container{
	position: relative;

}

</style>


</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<div class="container" style="width: 65%; margin: auto;">
    <form action="updatePost" method="post" enctype="multipart/form-data">
		<input type="hidden" name="PostID" value="${read.postID}">
        <label for="postTitle"></label><br>
        <input type="text" id="postTitle" name="title" value="${read.title}" placeholder="제목을 입력하세요." style="width:99%"><br><br>

		<!-- <label for="postTags"></label><br> -->
        <input type="text" id="postTags" name="tag" value="${read.tag}" placeholder="태그를 입력하세요. spacebar로 구분됩니다." style="width:23%"><br><br>
		
        <label for="content" ></label><br>
       <textArea id="editor" name="content" style="display: none" >${read.content}</textArea><br>
        
        <label>첨부 파일:</label><br>
    	<input type="file" name="files" multiple/><br><br>
        
       
        <button type="submit" class="submitButton">등록</button>
      
    </form>
</div>

<br>
</body>
<jsp:include page = "../common/footer.jsp" flush="true"/><br>


</html>