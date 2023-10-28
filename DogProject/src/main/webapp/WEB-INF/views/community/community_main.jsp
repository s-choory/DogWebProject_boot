<%@page import="java.sql.Date"%>
<%@page import="com.example.dto.PostsDTO"%>
<%@page import="com.example.dto.PageDTO"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티-메인화면</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Exo:wght@300&family=Gamja+Flower&family=Gowun+Dodum&family=Hi+Melody&display=swap" rel="stylesheet">
<!-- 부트스트랩 코드 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style type="text/css">

	body {
	    margin: 0;
	    font-family: 'Exo', sans-serif;
	}

/* 	게시물 이미지 옆에 텍스트를 들어가기 위함 */
	.post {
        display: flex;
        align-items: flex-start;
       	border: 1px solid #F0FFF0;
	    padding-left: 15px;
	    border-radius: 10px;
	    margin-top: 20px;
	    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	    width: 1100px;
	    height: 220px;
        
    }
    .posts{
    	width: 100%;
    	display: flex;
    	justify-content: center;
    }
    .post img {
        width: 175px;
        height: 180px;
	    margin-right: 20px;
	    margin-top: 15px;
	    margin-bottom: 10px;
	    border-radius: 10px
    }
    .post-content{
    	max-width: 850px;
    }
	
	.post-content p {
    font-size: 20px;
    color: #666;
    padding-left:2px;
    margin-top: 10px; 
    height: 100px;
    max-width: 1100px;
    overflow: hidden;
    text-overflow: ellipsis;
/*     text-wrap: nowrap; */
    display: -webkit-box;
    -webkit-line-clamp: 3;
  	-webkit-box-orient: vertical;
    
	}
	/* .post-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;
	} */
	.post-meta {
	    display: flex;
	    align-items: center;
	    grid-gap: 40px;
    	gap: 40px;
	}
	.post-meta .like,
	.post-meta .comment {
	    margin-right: 20px;
	    font-size: 14px;
	    color: #666;
	}
	.post-time {
		margin-right: 20px;
	    font-size: 14px;
	    color: #666;
	}
	.Hit {
	    font-size: 14px;
	    color: #666;
	}
	
	#search {
	    width: 40%; /* 너비 조정 */
	    margin: 0 auto; /* 가운데 정렬 */
	    font-size: 16px; /* 폰트 크기 조정 */
	    padding: 12px; /* 내부 여백 설정 */
	    display: block; /* 너비를 설정하려면 display를 block으로 변경 */
	   	border-radius: 24px;
	   	border: 2px solid #8a8984;
	   	box-shadow: 0 3px 5px 0 hsla(0, 0%, 0%, 0.2);
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
		background-color: #9d9eff;/* #bbb */; 
		padding: 5px 10px; /* 패딩을 추가하여 배경 범위 늘리기 */
		border-radius: 10px;
		display: flex;
	    gap: 3px;
	    align-items: center;
	    box-shadow: 0 4px 6px 0 hsla(0, 0%, 0%, 0.2);
	    transition: background-color 0.3s, color 0.3s;
	}
	
	#addPost{
		background-color: #9d9eff; 
		padding: 5px 10px; /* 패딩을 추가하여 배경 범위 늘리기 */
		border-radius: 10px;
		display: flex;
    	gap: 5px;
    	box-shadow: 0 4px 6px 0 hsla(0, 0%, 0%, 0.2);
    	transition: background-color 0.3s, color 0.3s;

	}
	#addPost:hover {
        background-color: #5050FF;
    }
    #addPost a:hover {
   		color: black;
	}
	
	#addPost img, #findMetting img{
		width: 30px;
	}
	
	#findMetting:hover {
        background-color: #5050FF;
    }
	#findMetting a:hover {
        color: black;
    }
	
	.categories {
		font-weight : bold; 
		display: flex;
        justify-content: center;
        border-radius: 12px;
	}
	.category {
        margin: 0 10px; /* 각 카테고리 사이의 간격 설정 */
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
	.pageon{
		margin: 0 5px;
        padding: 10px;
        text-decoration: none;
        color: #71777d;
        transition: background-color 0.3s, color 0.3s;
        font-weight: 800;
        font-size: 18px;
	}
    a{
    	text-decoration: none;
    	color: black;
    }
    
    input[type="submit"]{
    	border-radius: 10px; 
    	background-color: #ffeb99;
    	color: black;
    	padding: 10px 20px;
    	border: none;
    	box-shadow: 2px 2px gray;
    	cursor: pointer;
    	font-size: 16px;
    	font-weight: bolder;
    }
    
    input[type="submit"]:hover {
	    box-shadow: 2px 2px black; /* hover 상태에서 그림자 효과 향상 */
	}

    .container{
    	display: flex;
    	justify-content: center;
    	align-content: center;
    }
    .t-container{
    	width: 100%;
    	display: flex;
    	justify-content: center;
    }
    .Logo {
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    width: 100%; /* 부모 요소 너비에 맞게 */
    height: 100%; /* 뷰포트 높이에 맞게, 화면 전체 높이 */
    padding: 0;
	}

	.Logo img {
    max-width: 15%; /* 최대 너비 100% (부모 요소 너비에 맞게 조절) */
    max-height: 15%; /* 최대 높이 100% (부모 요소 높이에 맞게 조절) */
	}
	
	.post_title {
		font-weight: bolder;
		font-size: 26px;
		color: #35424a; 
		margin-top: 10px; 
		margin-bottom: 10px;
		max-width: 1300px;
		overflow: hidden;
		text-overflow: ellipsis;
		text-wrap: nowrap;
	}
	input::-webkit-input-placeholder{
	  background-image: url('resources/img/icon/searchicon.png') ;
	  background-size: contain;
	  background-position:  1px center;
	  background-repeat: no-repeat;
	  text-align: center;
	  text-indent: 0;
	}
    .no-data{
    	display: flex;
    	justify-content: center;
    	padding: 100px 0;
    	flex-direction: column;
    	color: #707070;
    	text-align: center;
    	font-size: 30px;
    	font-family: 'Hi-melody', sans-serif;
    	font-weight: bolder;
    }
    .no-data img{
    	height: 450px;
    	width: 300px;
    	padding-bottom: 25px;
    	
    }
    
    .addpost-button{
    	color: white;
    	font-weight: bold;
    }
</style>
</head>
<body>

<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>

<!-- 검색기능 dto꺼내오기-->
<%
	PageDTO pDTO= (PageDTO)request.getAttribute("pDTO");
	String order= (String)request.getAttribute("order"); // 정렬에 필요한 변수
%>

<div class="Logo"><img src="${pageContext.request.contextPath}/resources/img/dog/Logo_Sample.png"></div>

<div class="fixed-sidebar" style="top:450px;">
   <button id="addpost-button" class="scroll-button" onclick="location.href='/app/addPost'">글쓰기+</button>
</div>

<span class="addObject">
    <span id="addPost"><img src="${pageContext.request.contextPath}/resources/img/icon/write.png"><a href="addPost">글쓰기+</a></span>
</span>

    <!-- <img src="resources/a.jpg" id="로고2" width=50 height="50"> -->
	<!-- 검색기능 구현 -->
	<!-- placeholder="🔍찾는 게시물을 검색해주세요." -->
    <form action="/app/community/">
 	<input type="text" id="search" placeholder="찾는 게시물을 검색해주세요." name="search" value="" >
    </form>


<span class="addObject">
    <span id="findMetting"><img src="${pageContext.request.contextPath}/resources/img/icon/search.png"><a href="MoIm2">Group</a></span>
</span><br>

	<!-- 카테고리별 select 기능구현  -->
	<form action="/app/community/">
<div class = "categories" >
	<div id= "cButtin">
	<input type="submit" name = "order" value="All"> &nbsp;&nbsp;
	</div>
	<div id= "cButtin">
	<input type="submit" name = "order" value="Popular"> &nbsp;&nbsp;
	</div>
	<div id= "cButtin">
	<input type="submit" name = "order" value="QnA"> &nbsp;&nbsp;
	</div>
	<!-- 보류 -->
	<!-- <span class = category id = "relevant">추천게시물</span> -->
</div>
	</form>
<!-- <hr align="center" style="border: outset 5px orange; width: 90%;"> -->

 <% 
	List<PostsDTO> list = pDTO.getList();
 	
 	for(int i = 0; i<list.size(); i++){
 		
	PostsDTO dto= list.get(i);
	int postid=dto.getPostID();
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
	String PostType = dto.getPostType();
	
	%> 
	
	<%if (PostType.equals("undeleted")) {%>  <!-- 컬럼명이 'undeleted'인 경우 출력 -->
	<div class="t-container">
    <div class="container" style="margin-left: 5%; margin-right: 5%;">
        <section class="posts">
            <div class="post">
            	<a href="/app/post?PostID=<%=postid%>">
                <img src="<%=postimage%>" id="게시물 1">
                </a>
                <div class="post-content">
                <%if (PostType.equals("deleted")) {%>
                <div class="post_title">
				<a href="/app/post?PostID=<%= postid %>&curPage=${pDTO.curPage}">삭제된 게시물입니다.</a>
				<!-- 타이틀 -->
				</div>	
				 <%} else if (PostType.equals("undeleted")){%>
				 <div class="post_title">
				<a href="/app/post?PostID=<%= postid %>&curPage=${pDTO.curPage}"><%= Title %></a><!-- 타이틀 -->
				</div>	
				<% } %>	
                		<div class="post_content">
                		<a href="/app/post?PostID=<%=postid%>">
                    		<p><%=previewText %></p><!-- 내용 -->
                    	</a>	
                		</div>
                    <div class="post-info">
                        <div class="post-meta">
                            <span class="like">좋아요❤️<%=Likes %><span id="Like"></span></span>
                            <span class="comment">댓글<span id="Comment"></span></span>
                        <span class="post-time"><%=CreationTime %></span> <!-- 시간 표시 태그 -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
 </div>
<%}%>
<%}%>

<br>
<% if(list.isEmpty()){

	%>	
 	<div class="no-data">
    	<div><img src="${pageContext.request.contextPath}/resources/img/dog/nodata.png" alt="No Results Found"></div><br>
    	<div><p>검색 결과가 없습니다</p></div>
	</div>
	
	
	<%} %>
<div class="page">
<jsp:include page = "../common/page.jsp" flush="true"/><br>
</div>
<jsp:include page = "../common/footer.jsp" flush="true"/>
</body>
</html>