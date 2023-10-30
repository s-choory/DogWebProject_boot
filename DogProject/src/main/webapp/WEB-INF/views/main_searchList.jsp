<%@page import="com.example.dto.CommentsDTO"%>
<%@page import="com.example.dto.ReviewsDTO"%>
<%@page import="com.example.dto.LikeDTO"%>
<%@page import="com.example.dto.PostsDTO"%>
<%@page import="com.example.dto.NoticeDTO"%>
<%@page import="com.example.dto.AccompanyingFacilitiesDTO"%>
<%@page import="com.example.dto.GoodsDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalDateTime"%>
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
    .post_Notice {
        display: flex;
        align-items: center;
        justify-content: flex-start;
       	border: 1px solid #F0FFF0;
	    padding-left: 15px;
	    border-radius: 10px;
	    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	    width: 1080px;
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
	}
	.AF_container{
		border: 1px solid #F0FFF0;;
    	border-radius: 10px;
    	padding: 10px 10px 0px 10px;
    	width: 1100px;
    	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	}
	.productList {
        display: inline-block;	/*한줄로 나열*/
        width: 16.9%;
        height:20%;
        margin-left: 0.7%;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }
    .AFList {
        display: inline-block;	/*한줄로 나열*/
        width: 46.8%;
        height:20%;
        margin-left: 0.7%;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }
    .noticeList {
        display: inline-block;	/*한줄로 나열*/
        width: 96.5%;
        height:20%;
        margin-left: 0.7%;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }
    .noticeList {
        display: inline-block;	/*한줄로 나열*/
        width: 96.5%;
        height:20%;
        margin-left: 0.7%;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .product img {
    	width: 185px;
        height: 185px;
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
	.place-title{
/* 		font-family: 'Gamja Flower', cursive; */
		font-weight: bolder; 
		font-size: 18px;
		margin: 7px 0; /* 상하 간격 설정 */
		cursor: pointer;
	}
	.place-content{
/* 		font-family: 'Gamja Flower', cursive; */
	    font-size: 14px; /* 글자 크기 설정 */
	    margin: 10px 0; /* 상하 간격 설정 */
	    color: hsl(0, 0%, 29%);
	    /* 다른 스타일 속성들도 필요한 대로 추가하세요. */
	}
	
	.place-colum {
		font-size:10px;
		font-family: "Exo", sans-serif;
	    color: #E4E4E4; /* 글자 색상 설정 */
	    background-color: gray;
	    margin : 3px;
	    padding : 2px;
	    box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
	}
	 .notFound{
    	text-align: center;
    	font-size: 15px;
    	color: gray;
    	padding-top: 20px;
    	padding-bottom: 20px;	
    }
    .single-line {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#search').keypress(function(event) {
        if (event.which === 13) { 
          event.preventDefault(); 
          var searchValue = $(this).val();
          window.location.href = '/app/main_searchList?search='+ encodeURIComponent(searchValue);
        }
      });
      
    });
    function prod(n){
    	console.log(1);
    	$("#prod"+n).submit();
    }
    </script>
    <%
List<AccompanyingFacilitiesDTO> accompanyingFacilitie = (List<AccompanyingFacilitiesDTO>) request.getAttribute("AccompanyingFacilities_list");
List<NoticeDTO> Notices_list = (List<NoticeDTO>) request.getAttribute("Notices_list");
List<PostsDTO> post = (List<PostsDTO>) request.getAttribute("Posts_list");
List<GoodsDTO> product = (List<GoodsDTO>) request.getAttribute("Products_list");
List<LikeDTO> Like_list = (List<LikeDTO>) request.getAttribute("Like_list");
List<ReviewsDTO> Review_list = (List<ReviewsDTO>) request.getAttribute("Review_list");
List<CommentsDTO> Comments_list = (List<CommentsDTO>) request.getAttribute("Comments_list");
String search = (String)request.getAttribute("search");
 %>
</head>
<body style="font-family: 'Exo', sans-serif;">
<jsp:include page = "common/top.jsp" flush="true"/><br>
<jsp:include page = "common/side.jsp" flush="true"/><br>
<div class="searchList_container">
<input type="text" id="search" placeholder="검색어를 입력하세요" value="" />
</div>
<br>
<br><br>
<%-- 게시물 --%>
<div class="posttitle2">
<div class="posttitle">
	<div class="category">게시글(<%= post.size() %>)</div>
	<div class="postOthers"><a id="postOthers" href="/app/?search=<%=search%>">더보기 +</a></div>
</div>
</div>
    <div class="post_container">
    <section class="posts">
        <%
        if(post.size() == 0){ %>
        <div class="product_container">
        <div class="notFound"> 게시글에서 입력하신 "<%=search%>"검색어를 찾지 못했습니다. </div>
        </div>
        <% 
    	}else {
        for(int i = 0; i<post.size(); i++){
    	PostsDTO dto = post.get(i);
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
   		Pattern pattern = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");
        Matcher matcher = pattern.matcher(post_content);
    	/* 	LocalDateTime creationtime = dto.getCreationtime();
   		Duration durationtime = Duration.between(creationtime,sysdate);
   		long differenceInHours=durationtime.toHours(); */
        if (matcher.find()) {
            postimage = matcher.group(1);
     }
   		if (postimage==null) postimage=defaultimage;
 %>
 			<a href="post?PostID=<%= postid%>">
            <div class="post">
       			<img src="<%=postimage%>" alt="">
                <div class="post-content">
                    <div class="post_title"><%=title %></div>
                    <div class="post_content"><p><%=previewText %></p></div>
                    <div class="post-info">
                        <div class="post-meta">
                            <span class="like">좋아요❤️ (<% 
                            		int Like_count = 0;
                            		for(int i2 = 0; i2 < Like_list.size(); i2++ ) {
                            			if(post.get(i).getPostID() == Like_list.get(i2).getCategoryID()) {
                            				Like_count++;
                            			}
                            	
                            }%><%= Like_count %>)<span id="Like"></span></span>
                            <span class="comment">댓글💬(<% 
                            		int Comments_count = 0;
                            		for(int i2 = 0; i2 < Comments_list.size(); i2++ ) {
                            			if(post.get(i).getPostID() == Comments_list.get(i2).getPostID()) {
                            				Comments_count++;
                            			}
                            	
                            }%><%= Comments_count %>)<span id="Comment"></span></span>
                            <span class="post-time"><%=post.get(i).getCreationTime() %></span>
                        </div>
                        
                        <%-- <span class="post-time"><%=differenceInHours%>시간 전</span> <!-- 시간 표시 태그 --> --%>
                    </div>
                </div>
            </div>
            </a>
            <% if(i == 2){
            	break;
            }}}%>
    </section>
    </div>
<br>
<%-- 스토어 --%>
<div class="posttitle2">
<div class="posttitle">
<div class="category">스토어(<%= product.size() %>)</div>
<div><a class="postOthers" href="/app/search?SearchName=<%= search %>">더보기 +</a></div>
</div>
</div>
<div class="pro-big">
<div class="product_container" style="margin-left: 5%; margin-right: 5%;">
    <section class="product">
    <%
        if(product.size() == 0){ %>
        <div class="notFound"> 스토어에서 입력하신 "<%=search%>"검색어를 찾지 못했습니다. </div>
        <% 
        }else {
        for(int i = 0; i<product.size(); i++){
    	GoodsDTO dto = product.get(i);
    	
    	int productid=dto.getPRODUCTID();
    	String productname=dto.getPRODUCTNAME();
    	String category=dto.getCategory();
    	String content=dto.getContent();
    	int price = dto.getPrice();
    	String image = dto.getImage();
    	int stockquantity = dto.getSTOCKQUANTITY();
 %>
 		<a class="product" onclick="store(<%= productid%>)">
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
        </a>
    <%
    if(i == 4){
    	break;
    }}}%>
    </section>
</div>
</div>
<br>
<%-- 장소 --%>
<div class="posttitle2">
<div class="posttitle">
<div class="category">장소(<%= accompanyingFacilitie.size() %>)</div>
<div><a class="postOthers" href="/app/map?RodeAddress=<%=search%>">더보기 +</a></div>
</div>
</div>
<div class="pro-big">
 		<%
        if(accompanyingFacilitie.size() == 0){ %>
         <div class="product_container">
         <%} else { %>
		<div class="AF_container" style="margin-left: 5%; margin-right: 5%;">
    	<% } %>
    	<section class="AF">
    <%
        if(accompanyingFacilitie.size() == 0){ %>
        <div class="notFound"> 장소에서 입력하신 "<%=search%>"검색어를 찾지 못했습니다. </div>
        </div>
        <% 
        }else {
        for(int i = 0; i<accompanyingFacilitie.size(); i++) {
        	String Sname = accompanyingFacilitie.get(i).getFacilitiesName();
			String Scategory2 = accompanyingFacilitie.get(i).getCategory2();
			int SpostNumber = accompanyingFacilitie.get(i).getPostNumber();
			double Slatitude = accompanyingFacilitie.get(i).getLatitude();
			double Slongitude = accompanyingFacilitie.get(i).getLongitude();
			String SrodeAddress = accompanyingFacilitie.get(i).getRodeAddress();
			String ShouseAddress = accompanyingFacilitie.get(i).getHouseAddress();
			if(SrodeAddress == null)
				SrodeAddress = ShouseAddress;
			String SphoneNumber = accompanyingFacilitie.get(i).getPhoneNumber();
			String SoperationHours = accompanyingFacilitie.get(i).getOperationHours();
			String DayOff = accompanyingFacilitie.get(i).getDayOff();
			String Sparking = accompanyingFacilitie.get(i).getParking();
			String SRestrictions = accompanyingFacilitie.get(i).getRestrictions();
 %>
		<a href="/app/map?RodeAddress=<%=Sname%>">
		<div class = "AFList">
        <div class = "text-result">
			<div class = "place-container">
				<div class="place-title" title="해당 위치로 이동" data-xxx=<%= Slatitude %> data-yyy=<%= Slongitude %>><%= Sname %></div>
				<div class = "place-content" >
					<div><span class="place-colum">카테고리</span><%= Scategory2 %></div>
					<div><span class="place-colum">주소</span>(<%= SpostNumber %>) <%= SrodeAddress %></div>
					<div style="font-size: 12px; color:hsl(0, 0%, 45%);">&nbsp;&nbsp;&nbsp;[지번] <%= ShouseAddress %></div>
					<div><span class="place-colum">전화번호</span><%= SphoneNumber %> </div>
					<div><span class="place-colum">영업시간</span><%= SoperationHours %> &nbsp; <span class="place-colum">휴일 </span><%= DayOff %></div>
					<div><span class="place-colum">주차가능여부</span><%= Sparking %> &nbsp; <span class="place-colum">제한사항</span><%= SRestrictions %></div>
				</div>
			</div>
		</div>
		</div>
		</a>
    <%
    if(i == 3){
    	break;
    }}}%>
    </section>
</div>
</div>
<br>
<%-- 공지사항 --%>
<div class="posttitle2">
<div class="posttitle">
<div class="category">공지사항(<%= Notices_list.size() %>)</div>
<div><a class="postOthers" href="/app/ContactCenter_Notice">더보기 +</a></div>
</div>
</div>
<div class="pro-big">
<div class="AF_container">
<section class="Notice">
         <%
        if(Notices_list.size() == 0){ %>
        <div class="notFound"> 공지사항에서 입력하신 "<%=(String)request.getAttribute("search")%>"검색어를 찾지 못했습니다. </div>
        <% 
        }else {
        	for(int i = 0; i<Notices_list.size(); i++){%>
        	<a href="community_main?search=<%= Notices_list.get(i).getNoticeID()%>">
        	<div class="noticeList">
                    <div class="place-title"><%=Notices_list.get(i).getTitle() %></div>
                    <div class="single-line"><%=Notices_list.get(i).getContent()%></div>
            </div>
            </a>
            <%if(i == 1){
            	break;
            }
        	}
            }%>
        </section>
</div>
</div>
<br>
<jsp:include page = "common/footer.jsp" flush="true"/>
</body>
</html>