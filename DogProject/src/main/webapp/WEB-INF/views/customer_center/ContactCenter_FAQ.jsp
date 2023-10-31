<%@page import="java.util.*"%>
<%@page import="com.example.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<html>
<head>
<title>고객센터/문의하기</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
<!-- <link rel="stylesheet" href="resources/css2/CC.css"> -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,500|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>  
<style>


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
    height: auto; /* 뷰포트 높이에 맞게, 화면 전체 높이 */
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
  

 body {
	background: #fff;
}
.accordion .card {
	background: none;
	border: none;
}
.accordion .card .card-header {
	background: none;
	border: none;
	padding: .4rem 1rem;
	font-family: "Roboto", sans-serif;
}
.accordion .card-header h2 span {
	float: left;
	margin-top: 10px;
}
.accordion .card-header .btn {
	color: #2f2f31;
	font-size: 1.04rem;
	text-align: left;
	position: relative;
	font-weight: 500;
	padding-left: 2rem;
}
.accordion .card-header i {
	font-size: 1.2rem;
	font-weight: bold;
	position: absolute;
	left: 0;
	top: 9px;
}
.accordion .card-header .btn:hover {
	color: #ff8300;
}
.accordion .card-body {
	color: #324353;
	padding: 0.5rem 3rem;
}
.page-title {
	margin: 3rem 0 3rem 1rem;
	font-family: "Roboto", sans-serif;
	position: relative;
}
.page-title::after {
	content: "";
	width: 80px;
	position: absolute;
	height: 3px;
	border-radius: 1px;
	background: #73bb2b;
	left: 0;
	bottom: -15px;
}
.accordion .highlight .btn {
	color: #74bd30;
}
.accordion .highlight i {
	transform: rotate(180deg);
}

.menu{
 		margin: 20px 20px 25px 20px; /* 가운데 정렬 */
 		text-align: center;
 
 	}
    .menu #Notice{
    	width: 10%; /* 너비 조정 */
	  /*   margin: auto;  */ /* 가운데 정렬 */
	    font-size: 16px; /* 폰트 크기 조정 */
	    padding: 10px; /* 내부 여백 설정 */
	  
	   	border-radius: 24px;
	   	border: 2px solid #8a8984;
	   	box-shadow: 0 3px 5px 0 hsla(0, 0%, 0%, 0.2);
    }
    .menu #FAQ{
    	width: 10%; /* 너비 조정 */
	    /* margin: auto;  */   /* 가운데 정렬 */ 
	    font-size: 16px; /* 폰트 크기 조정 */
	    padding: 10px; /* 내부 여백 설정 */
	   
	   	border-radius: 24px;
	   	border: 2px solid #8a8984;
	   	box-shadow: 0 3px 5px 0 hsla(0, 0%, 0%, 0.2);
    }
    
.col-lg-12{
	padding-left: 100px;
}

.page-title::after {

    width: 960px;
   
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	// Add minus icon for collapse element which is open by default
	   $(".collapse.show").each(function(){
		$(this).prev(".card-header").addClass("highlight");
	});   
	
	// Highlight open collapsed element 
  $(".card-header .btn").click(function(){
		$(this).attr("class", "btn btn-link collapsed");
		$(".card-header").not($(this).parents()).removeClass("highlight");
		$(this).parents(".card-header").toggleClass("highlight");

	});   
});  



<%-- <div onclick="dropdown(<%=noticenum%>)">제목
<div class="dropdownList" id="dropdown<%=noticenum%>">

$(".dropdownList").slice().hide();


function dropdown(num) {
$(".dropdownList").slice().hide();
$("#dropdown"+num).show();
} --%>
</script>
</head>
<body>

<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>


<div class="Logo"><img src="${pageContext.request.contextPath}/resources/main-icon/FAQ.png"></div>

<!-- <form action="/app/community/">-->
 <div class="menu">
    <span class="ContactCenter_Choice_Yes" id="Notice"><a href="/app/ContactCenter_Notice">공지사항</a></span>
		<span class="ContactCenter_Choice_No" id="FAQ"><a href="/app/ContactCenter_FAQ">FAQ</a></span>
		</div>
 
 	<!-- <input type="text" id="search" placeholder="찾는 게시물을 검색해주세요." name="search" value="" >
    </form> -->
	

<div class="container-lg">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-title">자주 묻는 질문</h1>
			<div class="accordion" id="accordionExample">
				<%
				List<FAQDTO> list= (List)request.getAttribute("list");
					
				%>
		
				<%for(int i = 1; i <= list.size(); i++) {
					FAQDTO dto = list.get(i-1);
			 		int FaqID = dto.getFaqID();
			 	    String Title = dto.getTitle();
			 	    String Content = dto.getContent();%>
				
			 <%  if(i==1){%>  
			 	<div class="card">
					<div class="card-header" id="heading<%=FaqID %>">
						<h2 class="clearfix mb-0">
							<a class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"><i class="fa fa-chevron-circle-down"></i><%=Title%></a>									
						</h2>
					</div>
					<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
						<div class="card-body"><%=Content%></div>
					</div>
				</div> 
			 	    	
			<%}else if (i==2){%>
			
				 <div class="card">
					<div class="card-header" id="headingTwo">
						<h2 class="mb-0">
							<a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><i class="fa fa-chevron-circle-down"></i><%=Title%></a>
						</h2>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
						<div class="card-body"><%=Content%></div>
					</div>
				</div>  
		
				 <%}else if (i==3){%>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h2 class="mb-0">
							<a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><i class="fa fa-chevron-circle-down"></i><%=Title%></a>                     
						</h2>
					</div>
					<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
						<div class="card-body"><%=Content%></div>
					</div>
				</div> 
				 <%}else if (i==4){%>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h2 class="mb-0">
							<a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><i class="fa fa-chevron-circle-down"></i><%=Title%></a>                     
						</h2>
					</div>
					<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
						<div class="card-body"><%=Content%></div>
					</div>
				</div> 
				 <%}else if (i==5){%>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h2 class="mb-0">
							<a class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><i class="fa fa-chevron-circle-down"></i><%=Title%></a>                     
						</h2>
					</div>
					<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
						<div class="card-body"><%=Content%></div>
					</div>
				</div> 
			
				
			<%} %> 
			 <% } %> 
				
			</div>
		</div>
	</div>
</div>
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</body>
</html>

