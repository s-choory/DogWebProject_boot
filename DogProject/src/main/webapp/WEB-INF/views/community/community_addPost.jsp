<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
<style type="text/css">
	body{
		margin:0;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type=text/javascript charset=utf-8 src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
	    Swal.fire('경고', '# 문자를 사용할 수 없습니다.', 'warning');
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
	      Swal.fire('경고', '제목을 입력하세요', 'warning');
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
	background-color: #eaeaea;
	border-style:solid;
	border-radius:7px;
	font-size: 18px;
	position: absolute;
	border-color:transparent;
    right: 0;
    bottom: 0;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.4);
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
    <form action="addPost" method="post" enctype="multipart/form-data">

        <label for="postTitle"></label><br>
        <input type="text" id="postTitle" name="title" placeholder="제목을 입력하세요." style="width:99%"><br><br>

		<!-- <label for="postTags"></label><br> -->
        <input type="text" id="postTags" name="tag"  placeholder="태그를 입력하세요. spacebar로 구분됩니다." style="width:23%"><br><br>
		
        <label for="content" ></label><br>
       <textArea id="editor" name="content" style="display: none" ></textArea><br>
        
        <label>첨부 파일:</label><br>
    	<input type="file" name="files" multiple/><br><br>
        
       
        <button type="submit" class="submitButton">등록</button>
      
    </form>
</div>

<br>
</body>
<jsp:include page = "../common/footer.jsp" flush="true"/>


</html>