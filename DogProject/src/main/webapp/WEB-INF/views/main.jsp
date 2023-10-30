<%@page import="com.example.dto.PostsDTO"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.example.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoggyDoggy</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
<style type="text/css">
	body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	}
	#로고 {
    display: block;
    margin: 0 auto;
    padding-bottom: 20px;
    padding-top: 10px;
	}
	#search {
    width: 600px; /* 너비 조정 */
    margin: 0 auto; /* 가운데 정렬 */
    font-size: 16px; /* 폰트 크기 조정 */
    padding: 3px; /* 내부 여백 설정 */
    display: block; /* 너비를 설정하려면 display를 block으로 변경 */
   	border-radius: 10px;
   	box-shadow: 0 3px 5px 0 hsla(0, 0%, 0%, 0.2);
    }
    .icon{
    display: flex;
  	justify-content: center;
 	align-items: center;
    }
    .icon a{
    display: grid;
    padding-right: 13px;
    padding-left: 13px;
    justify-items: center;
    font-weight: bold;
    }
    .icon text{
    justify-content: center;
    }
	.category {
       font-size: 24px; 
       font-weight: bolder;
    }
    .post_container {
    	display: flex;
    	justify-content: center;
    }

    .post {
        display: flex;
        align-items: center;
        justify-content: flex-start;
       	border: 1px solid #F0FFF0;
	    padding-left: 15px;
	    border-radius: 10px;
	    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	    width: 1100px;
	    height: 220px;
	    margin-bottom: 20px;
    }
    .post img {
    	width: 175px;
        height: 180px;
	    margin-right: 20px;
	    margin-top: 15px;
	    margin-bottom: 10px;
	    border-radius: 10px
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
	.post-content p {
	    font-size: 20px;
	    color: #666;
	    padding-left: 2px;
	    margin-top: 10px;
	    height: 100px;
	    max-width: 1100px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-line-clamp: 3;
	    -webkit-box-orient: vertical;
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
	.pro-big{
		display: flex;
	    flex-wrap: wrap;
	    align-content: center;
	    justify-content: center;
	    align-items: center;
	    /* padding-top: 20px; */
	}
	.product_container{
		border: 1px solid #F0FFF0;;
    	border-radius: 10px;
    	padding: 10px;
    	width: 1100px;
    	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        overflow: auto; /* 스크롤 가능하도록 오버플로 속성 설정 */
	}
	.product_container::-webkit-scrollbar {
   	 width: 18px; /* 스크롤 바의 너비 */
	}
	
	.product_container::-webkit-scrollbar-thumb {
		background: linear-gradient(135deg, #7AFF7A, #429F6B);
	    border-radius: 5px; /* 스크롤 바의 둥근 모서리 */
	}

	.product_container::-webkit-scrollbar-track {
   	 	border-radius: 5px;
		background-color: #f7f8fa
	}   
 
	.link-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 50px;
    }
	
	.productList {
        display: inline-block;	/*한줄로 나열*/
        width: 15%;
        height:15%;
        margin-left: 0.7%;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .product img {
    	width: 165px;
        height: 180px;
	    border: 5px;
	    border-radius: 10px;
	    border-color: black;
	    /* vertical-align: middle; */
    }

    .product-content h3 {
        font-size: 20px;
        color: #35424a;
        margin-top: 0;
        margin-bottom: 5px;
        white-space: nowrap; /* 텍스트가 한 줄에 나타나도록 설정 */
    	overflow: hidden; /* 넘치는 부분은 숨김 처리 */
    	text-overflow: ellipsis; /* ...으로 생략 처리 */
    }

    .product-content p {
        font-size: 16px;
        color: #666;
    }
    #search{
    width: 40%;
    margin: auto;
    font-size: 16px;
    padding: 12px;
    display: block;
    border-radius: 24px;
    border: 2px solid #8a8984; 
    }
    input::-webkit-input-placeholder{
	  background-image: url('resources/img/icon/searchicon.png') ;
	  background-size: contain;
	  background-position:  1px center;
	  background-repeat: no-repeat;
	  text-align: center;
	  text-indent: 0;
	}
 	#postOthers {
 	color: gray;
	}
	.price-style{
	color: black;
	font-weight: bold;
	}
	
	.posttitle2{
		display: flex;
		justify-content: center;
		margin-bottom: 5px;
	}
	.posttitle{
		display: flex;
	    justify-content: space-between; /* 내부 요소 사이에 공간을 균일하게 배분 */
	    align-items: center; /* 수직 가운데 정렬 */
		width: 1125px; /* 원하는 너비로 설정 */
	}
	.postOthers{
		float:right;
	}

</style>

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#search').keypress(function(event) {
        if (event.which === 13) { 
          event.preventDefault(); 
          var searchValue = $(this).val();
          window.location.href = 'main_searchList?search='+ encodeURIComponent(searchValue);
        }
      });
      
    });
    function prod(n){
    	console.log(1);
    	$("#prod"+n).submit();
    }
    </script>
</head>
<body style="font-family: 'Exo', sans-serif;">
<jsp:include page = "common/top.jsp" flush="true"/><br>
<jsp:include page = "common/side.jsp" flush="true"/><br>
<div class="searchList_container">
<input type="text" id="search" placeholder="검색어를 입력하세요" value="" />
</div>
<br>
<div class="icon">
<!-- 종분류 --><a href="dogsList"><img width="70" height="70" src="${pageContext.request.contextPath}/resources/main-icon/종분류.png" alt="puppy"/><br>반려견 분류</a>&nbsp;&nbsp;&nbsp;
<!-- 커뮤니티 --><a href="community"><img width="70" height="70" src="${pageContext.request.contextPath}/resources/main-icon/커뮤니티.png" alt="chat--v1"/><br>커뮤니티</a>&nbsp;&nbsp;&nbsp;
<!-- 스토어 --><a href="dogshop_main"><img width="70" height="70" src="${pageContext.request.contextPath}/resources/main-icon/스토어.png" alt="shopping-bag--v1"/><br>스토어</a>&nbsp;&nbsp;&nbsp;
<!-- 모임찾기 --><a href="roomList"><img width="70" height="70" src="${pageContext.request.contextPath}/resources/main-icon/모임.png" alt="group-task"/><br>모임찾기</a>&nbsp;&nbsp;&nbsp;
<!-- 맵 --><a href="map"><img width="70" height="70" src="${pageContext.request.contextPath}/resources/main-icon/가이드.png" alt="where"/><br>동반업소 찾기</a>&nbsp;&nbsp;&nbsp;
<!-- 공지문의 --><a href="ContactCenter_FAQ"><img width="70" height="70" src="${pageContext.request.contextPath}/resources/main-icon/FAQ.png" alt="help--v1"/><br>공지사항</a>
</div>

<br><br>
<!-- 게시물 jsp로 반복문 돌리기 -->
<div class="posttitle2">
<div class="posttitle">
	<div class="category"> 인기글</div>
	<div class="postOthers"><a id="postOthers" href="../app/community">더보기 +</a></div>
</div>
</div>
<!--  검색어에 대한 게시물 정보유무 if문 처리 -->
    <div class="post_container">
        <section class="posts">
        <%
    LocalDateTime sysdate = LocalDateTime.now();
    List<PostsDTO> post = (List<PostsDTO>)request.getAttribute("popular");
    if (post != null && !post.isEmpty()) {
    for(int i=1;i<=post.size();i++){ 
    	/* 만약 메인에서 포스트가 안불러와진다면 PostMapper.popular에서 INTERVAL 옵션이 있는데, 몇일 전 올린 게시물만 띄울 지 조정가능*/
    	PostsDTO dto = post.get(i-1);
    	int postid=dto.getPostID();
    	String authorid=dto.getAuthorID();
    	String title=dto.getTitle();
    	String post_content=dto.getContent();
    	String textOnly =  post_content.replaceAll("<[^>]+>", "");
    	String previewText = textOnly.substring(0, Math.min(textOnly.length(), 50)) + (textOnly.length() > 50 ? "..." : "");
    	int likes = dto.getLikes();
   		String category= dto.getCategory();
   		String postimage=dto.getImage();
   		String defaultimage="resources/default.png";
   	/* 	LocalDateTime creationtime = dto.getCreationtime();
   		Duration durationtime = Duration.between(creationtime,sysdate);
   		long differenceInHours=durationtime.toHours(); */
   		Pattern pattern = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");
        Matcher matcher = pattern.matcher(post_content);
        if (matcher.find()) {
            postimage = matcher.group(1);
     }
   		if (postimage==null) postimage=defaultimage;
 %>
            <div class="post">
            <a href="post?PostID=<%=postid%>">
       			<img src="<%=postimage%>" alt="">
            </a>
                <div class="post-content">
                    <div class="post_title"><%=title %></div>
                    <div class="post_content"><p><%=previewText %></p></div>
                    <div class="post-info">
                        <div class="post-meta">
                            <span class="like">좋아요❤️<%=likes%><span id="Like"></span></span>
                            <span class="comment">댓글<span id="Comment"></span></span>
                        </div>
                        
                        <%-- <span class="post-time"><%=differenceInHours%>시간 전</span> <!-- 시간 표시 태그 --> --%>
                    </div>
                </div>
            </div>
            
            <%}
    }%>
        </section>
    </div>
<br>
<div class="posttitle2">
<div class="posttitle">
<div class="category">인기상품</div>
<div><a class="postOthers" href="dogshop_main">더보기 +</a></div>
</div>
</div>

<div class="pro-big">
<div class="product_container" style="margin-left: 5%; margin-right: 5%; white-space: nowrap; ">
    <section class="product">
    <%
    List<GoodsDTO> list = (List<GoodsDTO>)request.getAttribute("random");
    if(list !=null &&!list.isEmpty()){
    for(int i=1;i<=list.size();i++){
    	GoodsDTO dto = list.get(i-1);
    	
    	int productid=dto.getPRODUCTID();
    	String productname=dto.getPRODUCTNAME();
    	String category=dto.getCategory();
    	String content=dto.getContent();
    	int price = dto.getPrice();
    	String image = dto.getImage();
    	int stockquantity = dto.getSTOCKQUANTITY();
 %>
        <div class="productList">

	        <form id="prod<%= i %>" action="goodsRetrieve" method="post">
	 			<input type="hidden" name="gProductID" value="<%=productid%>">
	 			 <a class="storeimage" href="#" onclick="prod(<%=i%>)">
	 			 <img src="resources/storeimages/<%=image %>.jpg" alt="상품 이미지" >
	 			 </a>
	 		</form>
            <div class="product-content">
                <h3><%=productname %></h3>
                <p><span class="price-style"><%=price%></span>원</p>
            </div>

        </div>
    <%} }%>
    </section>
</div>
</div>
<br>



<br>
<jsp:include page = "common/footer.jsp" flush="true"/>
</body>
</html>