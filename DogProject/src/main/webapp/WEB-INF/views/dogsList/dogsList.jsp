<%@page import="java.util.List"%>
<%@ page import="com.example.dto.DogTypeDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견종백과</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript">
$(document).ready(function() {

	/* 버튼동작부  */
	$(".btn").on('click', (e) => {
		let dogSize = e.target.value;
		location.href='dogsList?dogSize='+dogSize;
	});
	
	/* 검색란동작부 */
	$("#search").on('keyup', (e) => {
		let dogSearch = '';
		if(e.keyCode == 13){
			dogSearch = e.target.value;
			location.href='dogSearch?dogSearch='+dogSearch;
		}
	});

	
	
});
</script>
<style type="text/css">

	#resultDiv{
		display: flex;
	    flex-wrap: wrap;
	    align-content: center;
	    justify-content: center;
	    align-items: flex-start;
	    font-family: 'Hi-melody', sans-serif;
	}
 	.dogtype-wrap{
		padding: 10px;
		width: auto;
		height: auto;
	}
	.dog-items{
		/* border: 100px;
		display: flex;
    	flex-direction: column;
    	justify-content: space-between;
    	align-items: center; */
    	font-size: 25px;
    	font-weight: bold;
    	text-align: center;
    	/* position: relative; */
	}
	.dog-items img{
	  width: 300px;
      height: 300px;
      border-radius: 50px;
      color: white;
       box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
      
      margin-bottom: 25px;
	}
	.dog-content{
		float: left;
		height: auto;
		width: 630px;
		padding: 25px;
	}
	.personality{
		font-size: 13px;
		height: 100%;
		/* height: 115px;  */
	}
	.characteristic{
		margin-bottom: 20px;
		font-size: 13px;
	}
	.dog-intro{
		display: block;
		padding-top: 10px;
		height: 125px;
		font-size:15px; 
	}
	/* .accordion{
	--bs-accordion-border-color: #15639b; 
	} */
	.accordion-button{
		color: black;
		display: flex;
	}
	.accordion-body {
	    display: flex;
	    flex-wrap: wrap;
	    /* flex-direction: column; */  /* ??? 보류 */
	    align-items: center;
	}
	.accordion-body span {
	    flex: 1; /* 내용을 가로로 펼치기 */
	    margin-bottom: 35px;
	}
	.table-button{
		text-align: center;
		padding-bottom: 20px;
	}
	.btn {
    --bs-btn-padding-x: 0.75rem;
    --bs-btn-padding-y: 0.375rem;
    --bs-btn-font-family: ;
    --bs-btn-font-size: 1rem;
    --bs-btn-font-weight: 400;
    --bs-btn-line-height: 1.5;
    --bs-btn-color: var(--bs-body-color);
    --bs-btn-bg: rgb(233 241 248 / 13%);
    --bs-btn-border-width: 2px;
    --bs-btn-border-color: #b8b8b8;
    --bs-btn-border-radius: var(--bs-border-radius);
    --bs-btn-hover-border-color: black;
    --bs-btn-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15),0 1px 1px rgba(0, 0, 0, 0.075);
    --bs-btn-disabled-opacity: 0.65;
    --bs-btn-focus-box-shadow: 0 0 0 0.25rem rgba(var(--bs-btn-focus-shadow-rgb), .5);
    display: inline-block;
    padding: var(--bs-btn-padding-y) var(--bs-btn-padding-x);
    font-family: var(--bs-btn-font-family);
    font-size: var(--bs-btn-font-size);
    font-weight: bolder;
    line-height: var(--bs-btn-line-height);
    color: var(--bs-btn-color);
    text-align: center;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
    border: var(--bs-btn-border-width) solid var(--bs-btn-border-color);
    border-radius: var(--bs-btn-border-radius);
    background-color: var(--bs-btn-bg);
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	}
	.btn:hover {
    color: var(--bs-btn-hover-color);
    background-color: var(--bs-btn-hover-bg);
    border-color: #625050;
	}
	#search {
    width: 24%;
    margin: auto;
    margin-top: 12px;
    font-size: 14px;
    padding: 3px;
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
	
</style>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<!-- 최종 -->
<!-- 상단 클릭 버튼 구현 -->
<table border= "1"> <!-- 테이블 1 -->
	<div class="table-button">
		<button class="btn" >전체</button>
		<button value="small" class="btn" >소형견</button>
		<button value="medium" class="btn" >중형견</button>
		<button value="large" class="btn" >대형견</button>
		<!-- 기능보류 -->
		<!-- <input type="button" value="인기순" id= "popularity"> -->
		<input type="search" name="search" placeholder="검색창" id="search" >
	</div>
</table><!-- 테이블 1 end -->

<!-- 리스트 관련 데이터 뿌리기 -->
<div id="resultDiv">
<%
 	List<DogTypeDTO> list= (List<DogTypeDTO>)request.getAttribute("list");
	

	for(int i= 1; i<= list.size(); i++){
		DogTypeDTO dto= list.get(i -1);
		String DogName= dto.getDogName();
		String Picture= dto.getPicture();
	    String Personality= dto.getPersonality();
	    String Characteristic= dto.getCharacteristic();
	    String Introduction= dto.getIntroduction();
	    String Size= dto.getdogSize();
	    int Popularity= dto.getPopularity();
		%>
		

		<div class="dogtype-wrap">
			<!-- 이미지 삽입부 -->
			<div class="dog-items">

			<div class="dog-content">
			<img src="resources/DogType/<%= Picture%>.png" border="1"><br>
			<span class="Dogname"><%= DogName%></span><br>
			<span class="dog-intro"><%= Introduction%></span><br>
			
<div class="accordion" id="accordionPanelsStayOpenExample">

  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
        	성격
      </button>
    </h2>
    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse<%=i%>" aria-labelledby="panelsStayOpen-headingOne">
      <div class="accordion-body">
        <span class="personality"><%= Personality%></span><br>
      </div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="true" aria-controls="panelsStayOpen-collapseTwo">
        	특징
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
      <div class="accordion-body">
		<span class="characteristic"><%= Characteristic%></span><br>
      </div>
    </div>
  </div>

</div>
			
			
			</div>	<!-- dog-items -->
		</div><!-- dogtype-wrap -->
	</div>					
		<%
			}// end for
		%>

</div> <!-- resultDiv -->
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</body>
</html>