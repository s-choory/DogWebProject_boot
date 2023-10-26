<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="com.example.dto.ReviewsDTO"%>
<%@page import="com.example.dto.LikeDTO"%>
<%@page import="com.example.dto.GoodsDTO"%>
<%@page import="com.example.dto.NoticeDTO"%>
<%@page import="com.example.dto.PostsDTO"%>
<%@page import="com.example.dto.AccompanyingFacilitiesDTO"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티-메인화면</title>
<style type="text/css">
	body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	}
	a {
  		text-decoration: none;
	}
	
	.searchList_container{
		margin-left: 15%;
		margin-right: 15%;
	}

	#search {
        display: inline-block; /* 인라인 블록 요소로 변경 */
        padding: 0px;
        padding-left: 10px;
        border: 1px solid #ccc;
        width: 40%;
        height: 27.78px;
        border-radius: 10px;
		box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);

    }
    #search-form {
        text-align: center;
        margin-bottom: 20px;
    }
    
    #search-button {
        display: inline-block; /* 인라인 블록 요소로 변경 */
        padding: 0px;
        border: 1px solid #ccc;
        width: 80px;
        height: 30px;
        border-radius: 10px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);


	}
	.category {
        text-align: left; 
        font-size: 24px; 
        margin-top: 20px; 
        margin-left: 5%;
        font-size: 25px;
        font-weight: bolder;
    }
    .others{
        float: right;
        font-size: 24px; 
        margin-top: 4px; 
        margin-right: 5%;
        font-size: 16px;
        font-weight: bolder;
        color : gray;
        text-decoration: none;
    }
    .container {
        margin-left: 5%;
        margin-right: 5%;
        border: 1px solid #ccc; /* 테두리 추가 */
        border-radius: 5px;
        padding: 0px 10px 10px 10px; /* 컨테이너 내부에 공간 추가 */
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .post {
        display: flex;
        align-items: center;
        border: 1px solid #ccc;
        padding: 15px;
        border-radius: 5px;
        margin-top: 10px; /* 위쪽 여백을 조절하여 간격 추가 */
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }
    .post img {
    	width: 30%;
        max-width: 150px;
        margin-right: 20px;
    }
    .post-content table {
    	margin-top: 10px;

    }
     .post-content h3 { 
     font-size: 24px; 
     color: #35424a; 
     margin-top: 0px; 
     margin-bottom: 5px; 
 	} 
	.post-content {
	width: 100%;
	color: #666;
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
	     justify-content: space-between; /* 추가 */
	     width: 100%;
	}
	.post-meta .like,
	.post-meta .comment {
	    margin-right: 20px;
	    font-size: 14px;
	    color: #666;
	    order: 1; /* 추가 */
	}
	.post-time {
	    text-align: right;
	    font-size: 14px;
	    color: #666;
	    order: 2; /* 추가 */
	    margin-left:auto; /* 추가 */
	}
	
	 .product {
        display: inline-block;
        width: calc(25% - 25.6px); /* 한 줄에 4개씩 */
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        margin-top: 10px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .product img {
        max-width: 100%;
        margin-bottom: 10px;
    }

    .product-content h3 {
        font-size: 20px;
        color: #35424a;
        margin-top: 0;
        margin-bottom: 5px;
    }

    .product-content p {
        font-size: 16px;
        color: #666;
    }

    .review {
        font-size: 14px;
        color: gray;
    }
    
    /* 나중에 사이드 마진 조절 */
    .searchList_container{
/*     	margin-left:50px; */
/*     	margin-right:50px; */
    }
    .notFound{
    	text-align: center;
    	font-size: 15px;
    	color: gray;
    	padding-top: 20px;
    	padding-bottom: 20px;	
    }
    .post_main_name { 
     font-size: 20px; 
     font-weight: bold;
     color: #35424a; 
     margin-top: 0px; 
     margin-bottom: 5px; 
 	} 
 	.post_sub_category { 

     color: #666;
     margin-top: 0px; 
     margin-bottom: 5px; 
 	} 
 	.posts_s {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .post_s {
        width: calc(50% - 35px);
        display: flex;
        align-items: flex-start;
        border: 1px solid #ccc;
        padding: 15px;
        border-radius: 5px;
        margin-top: 10px; /* 위쪽 여백을 조절하여 간격 추가 */
    	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }

	.post-content-name {
	width: 100%;
	}
</style>
<%
List<AccompanyingFacilitiesDTO> AccompanyingFacilities_list = (List<AccompanyingFacilitiesDTO>) request.getAttribute("AccompanyingFacilities_list");
List<NoticeDTO> Notices_list = (List<NoticeDTO>) request.getAttribute("Notices_list");
List<PostsDTO> Posts_list = (List<PostsDTO>) request.getAttribute("Posts_list");
List<GoodsDTO> Products_list = (List<GoodsDTO>) request.getAttribute("Products_list");
List<LikeDTO> Like_list = (List<LikeDTO>) request.getAttribute("Like_list");
List<ReviewsDTO> Review_list = (List<ReviewsDTO>) request.getAttribute("Review_list");
String search = (String)request.getAttribute("search");


 %>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function store(num) {
	$("#sendID").attr("value", num)
	$("#myForm").submit();
}
 </script>
</head>
<body>
<jsp:include page = "common/top.jsp" flush="true"/><br>
<jsp:include page = "common/side.jsp" flush="true"/><br>
<div class="searchList_container">
<h1 style="text-align: center;">검색결과</h1>
<form id="search-form" action="main_searchList">
<input type="text" name="search" id="search" value="<%=search%>" />
<button type="button" id="search-button">통합검색</button>
</form>
<!-- 게시물 jsp로 반복문 돌리기 -->
<a class="category">게시글(<%= Posts_list.size() %>)</a>
<a class="others" id="postOthers"  href="/app/community/?search=<%=search%>">더보기 +</a>
<!--  검색어에 대한 게시물 정보유무 if문 처리 -->
    <div class="container" style="margin-left: 5%; margin-right: 5%;">
        <div class="posts">
        <%
        if(Posts_list.size() == 0){ %>
        <div class="notFound"> 게시글에서 입력하신 "<%=search%>"검색어를 찾지 못했습니다. </div>
        <% 
        }else {
        for(int i = 0; i<Posts_list.size(); i++){%>
        	<a class="post" href="post?PostID=<%= Posts_list.get(i).getPostID()%>">
        		<%    		
        			String postimage=Posts_list.get(i).getImage();
           			String defaultimage="resources/default.png";
           	   		Pattern pattern = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");
           	        Matcher matcher = pattern.matcher(Posts_list.get(i).getContent());
           	        if (matcher.find()) {
           	            postimage = matcher.group(1);
           	     }
           	   		if (postimage==null) postimage=defaultimage; 
           	   	%>
       			<img src="<%=postimage%>" alt="">
                <div class="post-content">
                <h3><%=Posts_list.get(i).getTitle() %></h3> 
                <p>
                <% if(Posts_list.get(i).getContent().length() <= 65) {
                	%><%= Posts_list.get(i).getContent()%>
                <% } else {%>
                
                <%=Posts_list.get(i).getContent().substring(0, 65) %>...<%} %></p>
                <p style="color: #4682B4; font-weight: bold;"><%=Posts_list.get(i).getTag() %></p>
                <div class="post-info">
                    <div class="post-meta">
                        <span class="like">좋아요❤️ (<%
                        		int count = 0;
                        		for(int i2 = 0; i2< Like_list.size(); i2++){
                        			if(Posts_list.get(i2).getPostID() == Like_list.get(i2).getCategoryID()) {
                        				count++;
                        			}
                        		}
                        		%><%= count %>)
                        		<!-- 댓글 완료 후 작업 -->
                        		&nbsp;&nbsp; 댓글💬 (컬럼명 확인중)</span>
                        <span class="post-time"><%=Posts_list.get(i).getCreationTime() %></span>
                    </div>
                    </div>
                </div>
            </a>
            <%if(i == 1){
            	break;
            }
        	}
            } %>
        </div>
    </div>
<br>
<!-- 스토어 검색 기능이 없음 -->
<a class="category">스토어(<%= Products_list.size() %>)</a>
<a class="others" id="storeOthers" href="/app/search?SearchName=<%= search %>">더보기 +</a>
<div class="container" style="margin-left: 5%; margin-right: 5%;">
    <div class="posts"> 
   		<%
        if(Products_list.size() == 0){ %>
        <div class="notFound"> 스토어에서 입력하신 "<%=search%>"검색어를 찾지 못했습니다. </div>
        <% 
        }else {
        for(int i = 0; i<Products_list.size(); i++){%>
         <a class="product" href="#" onclick="store(<%= Products_list.get(i).getPRODUCTID() %>)">
            <img src="resources/storeimages/<%= Products_list.get(i).getImage() %>.jpg" alt="상품 이미지">
            <div class="product-content">
                <h3><%=Products_list.get(i).getPRODUCTNAME() %></h3>
                <p><%=Products_list.get(i).getPrice() %></p>
                <div class="review">리뷰: (<%
                        		int count = 0;
                        		for(int i2 = 0; i2< Review_list.size(); i2++){
                        			if(Products_list.get(i2).getPRODUCTID() == Review_list.get(i2).getProductID()) {
                        				count++;
                        			}
                        		}
                        		%><%= count %>)개</div>
            </div>
        </a>
       <%if(i == 3){
    	break;
    }
    }}%>
    </div>
</div>
<form id="myForm" action="goodsRetrieve" method="post">
<input type="hidden" name="gProductID" id="sendID">
</form>
       
<br>
<a class="category">장소(<%= AccompanyingFacilities_list.size() %>)</a>
<a class="others" id="mapOthers" href="/app/map?RodeAddress=<%=search%>">더보기 +</a>
<!--  검색어에 대한 게시물 정보유무 if문 처리 -->
   <div class="container" style="margin-left: 5%; margin-right: 5%;">
    <%
    if(AccompanyingFacilities_list.size() == 0){ %>
    <section class="posts">
        <div class="notFound"> 장소에서 입력하신 "<%=search%>"검색어를 찾지 못했습니다. </div>
    </section>
    <% 
    } else { %>
        <section class="posts_s">
            <% for(int i = 0; i<AccompanyingFacilities_list.size(); i++) { %>
                <a class="post_s" href="/app/map?RodeAddress=<%=AccompanyingFacilities_list.get(i).getFacilitiesName()%>">
                    <div class="post-content">
                        <span class="post_main_name"><%=AccompanyingFacilities_list.get(i).getFacilitiesName() %></span> 
                        <span class="post_sub_category"><%=AccompanyingFacilities_list.get(i).getCategory2() %></span>
                       		<table>
                       			<tr>
                       			<td>🚩</td>
                       			<td><%=AccompanyingFacilities_list.get(i).getRodeAddress() %><br>
                       				(<%=String.format("%05d",AccompanyingFacilities_list.get(i).getPostNumber()) %>) 
                       				<%=AccompanyingFacilities_list.get(i).getHouseAddress() %>
                       			</td>
                       			</tr>
                       		</table>
                       		<table>
                       			<tr>
                       			<td>🏠</td>
                       			<td><%=AccompanyingFacilities_list.get(i).getOperationHours() %></td>
                       			</tr>
                       		</table>
                       		<table>
                       			<tr>
                       			<td>📞</td>
                       			<td><%=AccompanyingFacilities_list.get(i).getPhoneNumber() %></td>
                       			</tr>
                       		</table>
                    </div>
                </a>
            <% if(i == 3) {
                break;
            }
        }
    }%>
</section>

</div>
<br>

<a class="category">공지/문의(<%= Notices_list.size() %>)</a>
<a class="others" id="serviceCenterOthers" href="/app/ContactCenter_Notice">더보기 +</a>
<!--  검색어에 대한 게시물 정보유무 if문 처리 -->
    <div class="container" style="margin-left: 5%; margin-right: 5%;">
        <section class="posts">
         <%
        if(Notices_list.size() == 0){ %>
        <div class="notFound"> 공지/문의에서 입력하신 "<%=(String)request.getAttribute("search")%>"검색어를 찾지 못했습니다. </div>
        <% 
        }else {
        	for(int i = 0; i<Notices_list.size(); i++){%>
            <a class="post" href="community_main?search=<%= Notices_list.get(i).getNoticeID()%>">
                <div class="post-content" >
                    <h3><%=Notices_list.get(i).getTitle() %></h3>
                    <p><%=Notices_list.get(i).getContent() %></p>
                    <div class="post-info">
                    </div>
                </div>
            </a>
            <%if(i == 1){
            	break;
            }
        	}
            }%>
        </section>
    </div>
<br>
</div>
<br>
<jsp:include page = "common/footer.jsp" flush="true"/><br>
</body>
</html>