<%@page import="java.sql.Date"%>
<%@page import="com.dto.PostsDTO"%>
<%@page import="com.dto.PageDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <c:forEach items="${list}" var= "list"> --%>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티-메인화면</title>
<style type="text/css">
	body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	}
	#로고2 {
    display: block;
    margin: 0 auto;
    padding-bottom: 20px;
    padding-top: 10px;
	}
/* 	게시물 이미지 옆에 텍스트를 들어가기 위함 */
	.post {
        display: flex;
        align-items: flex-start;
       	border: 1px solid #ccc;
	    padding: 15px;
	    border-radius: 5px;
	    margin-top: 20px;
	    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        
    }
    .post img {
        max-width: 150px;
        margin-right: 20px;
    }
     .post-content h3 { 
     font-size: 24px; 
     color: #35424a; 
     margin-top: 0px; 
     margin-bottom: 5px; 
 	} 
	
	.post-content p {
    font-size: 16px;
    color: #666;
	}
	.post-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;
	}
	.post-meta {
	    display: flex;
	    align-items: center;
	}
	.post-meta .like,
	.post-meta .comment {
	    margin-right: 20px;
	    font-size: 14px;
	    color: #666;
	}
	.post-time {
	    font-size: 14px;
	    color: #666;
	}
    
	#search {
    width: 40%; /* 너비 조정 */
    margin: 0 auto; /* 가운데 정렬 */
    font-size: 16px; /* 폰트 크기 조정 */
    padding: 3px; /* 내부 여백 설정 */
    display: block; /* 너비를 설정하려면 display를 block으로 변경 */
   	border-radius: 10px;
    }
	
	.addObject{
		font-weight : bold; 
		justify-content: flex-end;
	    align-items: center;
	    display: flex;
	    font-size:20px;
	    margin-right: 8%;
	}
	#findMetting{
		background-color: #bbb; 
		padding: 5px 10px; /* 패딩을 추가하여 배경 범위 늘리기 */
		border-radius: 10px;
	}
	
	#addPost{
		background-color: #f8bd24; 
		padding: 5px 10px; /* 패딩을 추가하여 배경 범위 늘리기 */
		border-radius: 10px; 
	}
	.categories {
		font-weight : bolder; 
		display: flex;
        justify-content: center;
	}
	.category {
        margin: 0 10px; /* 각 카테고리 사이의 간격 설정 */
    }
    .pagination{
    	display: flex;
        justify-content: center;
    }
    
</style>
</head>
<body>

<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>

<div class="fixed-sidebar" style="top:450px;">
   <button class="scroll-button" onclick="location.href='addPost'" style="writing-mode:vertical-lr; color: black; font-weight: bold">글쓰기+</button>
</div>

<span class="addObject">
    <span id="addPost"><a href="addPost">글쓰기+</a></span>
</span>

    <img src="resources/a.jpg" id="로고2" width=50 height="50">
 	<input type="text" id="search" placeholder="찾는 게시물을 검색해주세요." value="" />
	<!-- <form action="" id="search" value="">
					
		 <input type="text" name="searchValue" placeholder="찾는 게시물을 검색해주세요.">
		<input type="submit" value="검색">
	</form> -->

<span class="addObject">
    <span id="findMetting"><a href="MoIm2">모임찾기</a></span>
</span><br>

<div class = "categories ">
	<span class = category id = "all">전체</span>
	<span class = category id = "popular">인기게시물</span>
	<span class = category id = "QnA">Q&A</span>
	<span class = category id = "relevant">추천게시물</span>
</div>
<hr align="center" style="border: outset 5px orange; width: 90%;">


<!-- 게시물 jsp로 반복문 돌리기 -->
<% List<PostsDTO>list = (List<PostsDTO>)request.getAttribute("list");%>
<% for(int i = 0; i<list.size(); i++){
	PostsDTO dto= list.get(i);
	String Title= dto.getTitle();
	String Content= dto.getContent();
	int Likes= dto.getLikes();
	//Date CreationTime= dto.getCreationTime();
	%>
    <div class="container" style="margin-left: 5%; margin-right: 5%;">
        <section class="posts">
            <div class="post">
                <img src="resources/a.jpg" id="게시물 1">
                <div class="post-content">
                    <h3><%=Title %></h3><!-- 타이틀 -->
                    <p><%=Content %></p><!-- 내용 -->
                    <div class="post-info">
                        <div class="post-meta">
                            <span class="like">좋아요❤️<%=Likes %><span id="Like"></span></span>
                            <span class="comment">댓글<span id="Comment"></span></span>
                        </div>
                        <%-- <span class="post-time"><%=CreationTime %></span> <!-- 시간 표시 태그 --> --%>
                    </div>
                </div>
            </div>
        </section>
    </div>
<%} %>
    <br>
<%-- <div class="pagination">
    <button id="prevPage"><</button>
    <br>
<!--     jsp로 반복 -->
<% for(int i=0; i<5; i++){ %>
    <span id="currentPage">&nbsp1&nbsp</span>
   <%} %>
    <button id="nextPage">></button>
</div> --%>
<%-- <%@include file="../common/page.jsp" %><br> --%>
<%-- <jsp:include page = "../common/page.jsp" flush="true"/><br> --%>
 <%				PageDTO pDTO = (PageDTO) request.getAttribute("pDTO");
				/* List<PostsDTO> list2 = pDTO.getList(); */
				System.out.print(pDTO);
				
				
				String searchName = (String)request.getAttribute("searchName");
				String searchValue = (String)request.getAttribute("searchValue");
		        int curPage = pDTO.getCurPage();
		        int perPage = pDTO.getPerPage();
				int totalCount = pDTO.getTotalCount();
				int totalPage = totalCount/perPage;
				if(totalCount%perPage!=0) totalPage++;
				
		        for(int i=1; i<= totalPage; i++){
		          	if(i== curPage){
		          		out.print(i+"&nbsp;");
		          	}else{
		          		out.print("<a href='page?curPage="+i+"&searchName="+searchName+"&searchValue="+searchValue+"'>"+i+"</a>&nbsp;");
		          	}
		        }//end for
		   %>
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</body>
</html>