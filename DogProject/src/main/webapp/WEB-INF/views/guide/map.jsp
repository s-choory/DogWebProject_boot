<%@page import="com.example.dto.AccompanyingFacilitiesDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/로고아이콘.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&display=swap" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style type="text/css">

	body {
	    margin: 0;
	    padding: 0;
	    font-family: Arial, sans-serif;
  	}
	.container {
		display: block;
		justify-content: center;
		box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
	}
	.map-search-container{
		padding: 10px 20px;
		background: linear-gradient(135deg, #7AFF7A, #429F6B);
    	height:150px;
	 	display: flex; /* Flexbox 레이아웃을 사용합니다. */
		flex-direction: column; /* 요소를 수직으로 나열하도록 설정합니다. */
	}
	.map-search-title{
		font-size: 18px;
		color: white;
		margin-bottom: 10px;
	}
	.address{
		border: 0 none;
		border-radius: 3px;
		font-size:16px;
    	width:350px;
    	height:45px;
    	padding: 5px;
    	margin-bottom: 20px;
/* 		font-family: 'Gamja Flower', cursive; */
	}
	#categoryFilter{
		padding: 0 40px;
		display: flex;
	    justify-content: space-between; /* 이미지 사이의 간격을 동일하게 설정 */
	}
	
	#addressSearch{
/* 		font-family: 'Hi Melody', cursive; */
		border-color: white;
	}
	input::-webkit-input-placeholder{
	  background-image: url('resources/img/icon/searchicon.png') ;
	  background-size: contain;
	  background-position:  1px center;
	  background-repeat: no-repeat;
	  text-align: center;
	  text-indent: 0;
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
	.place-container{
		transition: background-color 0.2s ease;
	}
	.place-container:hover{
		background-color: #eff7ff;
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
		
    /* 부모 div 스타일링 */
    .map-container {
        display: flex;
        align-items: flex-start; /* 수직 정렬을 맨 위로 설정 */
        justify-content: space-between; /* 수평 간격을 최대로 설정 */
    }

    .map {
        flex: 1; /* 맵이 부모 div의 남은 영역을 모두 차지하게 함 */
        width: 70%; /* 맵의 크기 설정 */
    }

    .map-text {
        width: 30%; /* 텍스트의 크기 설정 */
        box-sizing: border-box; /* padding 포함한 크기 지정 */
    }

	.text-container {
        flex: 1; /* 텍스트 컨테이너가 부모 div의 남은 영역을 모두 차지하게 함 */
        width: 100%; /* 텍스트 컨테이너의 크기 설정 */
        padding: 10px; /* 텍스트 주위에 간격 추가 */
        box-sizing: border-box; /* padding 포함한 크기 지정 */
        background-color: #FFF; /* 배경색 설정 */
        overflow: auto; /* 스크롤 가능하도록 오버플로 속성 설정 */
        max-height: 750px; /* 텍스트 컨테이너의 최대 높이 설정 */
        border-radius: 10px; /* 스크롤 바의 둥근 모서리 */
    }
	.text-container::-webkit-scrollbar {
   	 width: 18px; /* 스크롤 바의 너비 */
	}
	
	.text-container::-webkit-scrollbar-thumb {
		background: linear-gradient(135deg, #7AFF7A, #429F6B);
	    border-radius: 5px; /* 스크롤 바의 둥근 모서리 */
	}

	.text-container::-webkit-scrollbar-track {
   	 	border-radius: 5px;
		background-color: #f7f8fa
	}   
 
	.link-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 50px;
    }
  
    .link-AccomPlace {
        margin-left: 20%;
        box-sizing: border-box; /* padding 포함한 크기 지정 */
        text-decoration: none;
        font-weight: bold;
        border-radius: 5px;
        color: #fff;
		text-decoration: none;
        padding: 10px 20px;
        border-radius: 15px;
        font-family: 'Poppins', Arial, sans-serif; /* 원하는 글꼴로 변경 */
        transition: background-color 0.3s, color 0.3s;
		background-color: gray;        
    }
    .link-hospital {
        flex: 1; /* 텍스트가 부모 div의 남은 영역을 모두 차지하게 함 */
        margin-left: 15%;
        box-sizing: border-box; /* padding 포함한 크기 지정 */
        margin-right: 33%;
		color: #fff;
		text-decoration: none;
        font-weight: bold;
		font-family: 'Poppins', Arial, sans-serif; /* 원하는 글꼴로 변경 */
        padding: 10px 20px;
        border-radius: 15px;
        transition: background-color 0.3s, color 0.3s;
        background-color: gray;
        
    }
    .categoryimg{
    	cursor: pointer;
    }
</style>
<style>
	/* 인포윈도우 스타일 */
	.overlaybox {
		border: none; /* 테두리 없애기 */
	    color: #333;
	    font-family: Arial, sans-serif;
	    border: none; /* 테두리 없애기 */
	    padding: 10px; /* 패딩 없애기 */
	    background-color: transparent; /* 배경색 투명으로 설정 */
	    box-shadow: none; /* 그림자 없애기 */
	}
	
	.boxtitle {
	    font-size: 20px;
	    font-weight: bold;
	    margin-bottom: 8px;
	    color: green; /* 주요 제목 색상 */
	    text-decoration: underline;
	}
	
	.categorytext {
	    font-weight: bold;
	}
	
	ul {
	    list-style: none;
	    padding: 0;
	}
	
	li {
	    margin-bottom: 8px;
	    display: flex;
	    align-items: center;
	}
	
	.title {
	    margin-left: 10px;
	}
	
	.arrow {
	    width: 10px;
	    height: 10px;
	    margin-left: 5px;
	    border: solid transparent;
	    border-width: 5px;
	}
	
 	.content2box { 
 		display:block; 
 		align-items: center; /* 내용을 수직 가운데 정렬 */ 
 		text-align:center; 
 		background:#fff; 
 		padding:10px 15px; 
 		font-size:14px; 
 		font-weight:bold; 
 		color:green; 
 		border: 1px solid green; /* 테두리 추가 */ 
 	    border-radius: 5px; /* 둥근 모서리 */ 
 	    margin: 10px 0; /* 위 아래 여백 추가 */ 
 	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */ 
	} 

}

</style>

</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<jsp:include page = "../common/map_ad.jsp" flush="true"/><br>
<div class = "container">
	<span style="color: hsl(0, 0%, 45%); font-size: 13px;">※ 지도에 나오는 장소들은 모두 반려견과 동반 출입이 가능합니다.<span style="font-size: 11px;">(업소별 특정 견종 동반 출입 제한)</span></span>
<div class = "map-container">
	<div class="map" id="map" style="width:900px;height:900px;"></div>
	<div class="map-text">
		<div class="map-search-container">
			<div class="map-search-title">DoggyDoggy <b style="	font-size: 20px;">Map</b></div>
			<input id = "address" class="address" type="text" placeholder="장소, 주소 검색">
		<a id="categoryFilter">
			<img class = "categoryimg" title="전체" src="${pageContext.request.contextPath}/resources/전체아이콘.png" width=40 height=38 id="all">
			<img class = "categoryimg" title="의료" src="${pageContext.request.contextPath}/resources/반려의료아이콘.png" width=40 height=38 id="의료">
			<img class = "categoryimg" title="식당" src="${pageContext.request.contextPath}/resources/식당아이콘.png" width=40 height=38 id="식당">
			<img class = "categoryimg" title="여행지" src="${pageContext.request.contextPath}/resources/여행지아이콘.png" width=40 height=38 id="여행">
			<img class = "categoryimg"  title="펫용품" src="${pageContext.request.contextPath}/resources/펫용품아이콘.png" width=40 height=38 id="서비스">
		</a>
	<br>
		</div>
		<div class="text-container" >
		<%
			List<AccompanyingFacilitiesDTO> list2 = (List<AccompanyingFacilitiesDTO>)request.getAttribute("list");
			for(int i=0; i<list2.size(); i++){
					String Sname = list2.get(i).getFacilitiesName();
					String Scategory2 = list2.get(i).getCategory2();
					int SpostNumber = list2.get(i).getPostNumber();
					double Slatitude = list2.get(i).getLatitude();
					double Slongitude = list2.get(i).getLongitude();
					String SrodeAddress = list2.get(i).getRodeAddress();
					String ShouseAddress = list2.get(i).getHouseAddress();
					if(SrodeAddress == null)
						SrodeAddress = ShouseAddress;
					String SphoneNumber = list2.get(i).getPhoneNumber();
					String SoperationHours = list2.get(i).getOperationHours();
					String DayOff = list2.get(i).getDayOff();
					String Sparking = list2.get(i).getParking();
					String SRestrictions = list2.get(i).getRestrictions();
					 %>
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
				<hr style = "border: 0px; border-top: 0.5px dotted; color:	#969696">
			</div>
			<%	}  %>
			<div class = "text-result2">
			</div>
		</div>
	</div>
</div>
<br>

</div>
<input type="hidden" id="category-param" name="category-param" data-xxx="<%= request.getParameter("Category2")%>">
<input type="hidden" id="address-param" name="address-param" data-xxx="<%= request.getParameter("RodeAddress")%>">
<!-- LakaoMap js 코드 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf3452f084f6fdf285cb1adc42a4d2b6"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf3452f084f6fdf285cb1adc42a4d2b6&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script>

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(37.64454276, 126.886336), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	<% if(request.getAttribute("list") != null){%>
	// 마커가 표시될 위치입니다 
	var positions = [
		<%
		List<AccompanyingFacilitiesDTO> list = (List<AccompanyingFacilitiesDTO>)request.getAttribute("list");
		for(int i=0; i<list.size(); i++){
			String name = list.get(i).getFacilitiesName();
			double latitude = list.get(i).getLatitude();
			double longitude = list.get(i).getLongitude();
			String category2 = list.get(i).getCategory2();
			int postNumber = list.get(i).getPostNumber();
			String rodeAddress = list.get(i).getRodeAddress();
			String phoneNumber = list.get(i).getPhoneNumber();
			String operationHours = list.get(i).getOperationHours();
			String parking = list.get(i).getParking();
  		%> 
		{
			content:'<div class="overlaybox">' +
		    '    <div class="boxtitle"><a href="https://map.kakao.com/link/map/<%=name%>,<%=latitude%>,<%=longitude%>" title="상세보기" target="_blank" style="color: green;"><%=name%> <img src="${pageContext.request.contextPath}/resources/오른쪽화살표.png" width=17 height=18></a></div>' +
		    '    <div class="first">' +
		    '        <div class="categorytext">카테고리:<%=category2%></div>' +
		    '    </div>' +
		    '    <ul>' +
		    '        <li>' +
		    '            <span class="title"><a style="color:green;">(<%=postNumber%>)</a><%=rodeAddress%></span>' +
		    '            <span class="arrow up"></span>' +
		    '        </li>' +
		    '        <li class="up">' +
		    '            <span class="title"><%=phoneNumber%></span>' +
		    '            <span class="arrow up"></span>' +
		    '        </li>' +
		    '        <li>' +
		    '            <span class="title"><%=operationHours%></span>' +
		    '            <span class="arrow up"></span>' +
		    '        </li>' +
		    '        <li>' +
		    '            <span class="title"><%=parking%></span>' +
		    '            <span class="arrow down"></span>' +
		    '        </li>' +
		    '    </ul>' +
		    '</div>',
		    content2:'<div class="content2box"><%=name%></div>',
			latlng: new kakao.maps.LatLng(<%=latitude%>, <%=longitude%>),
			img: '<%=category2%>'
		},
	<%
		}
  	%>  
	]

	// 카테고리별 이미지 지정
	for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		if(positions[i].img.includes('의료')){
			var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/의료아이콘.png'; // 마커이미지의 주소입니다    
		}else if(positions[i].img.includes('식당') || positions[i].img.includes('카페')){
			var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/식당아이콘.png'; // 마커이미지의 주소입니다    
		}else if(positions[i].img.includes('여행') ){
			var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/여행지아이콘.png'; // 마커이미지의 주소입니다    
		}else if(positions[i].img.includes('서비스') ){
			var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/펫용품아이콘.png'; // 마커이미지의 주소입니다    
		}
		
	    var imageSize = new kakao.maps.Size(31, 31), // 마커이미지의 크기입니다
	    	imageOption = {offset: new kakao.maps.Point(15.5, 31)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		    
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커의 위치
	        image: markerImage // 마커이미지 설정 
	    });
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content, // 인포윈도우에 표시할 내용
	        removable : true
	    });
	    var infowindow2 = new kakao.maps.InfoWindow({
	        content: positions[i].content2 // 인포윈도우에 표시할 내용
	    });
	    
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow2));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow2));
	}
		map.setCenter(positions[0].latlng);//마커 다 뿌린 후,리스트 인덱스0번으로 맵 위치조정
	<% } %>	
	
	var markers = [];
	// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {             

		//------------------------------------------------ 위는 처음 페이지 로딩 시 마커생성. 아래는 페이지 이동 시  이벤트
		// 지도 영역정보를 얻어옵니다 
	    var bounds = map.getBounds();
	    
	    // 영역정보의 남서쪽 정보를 얻어옵니다 
	    var swLatlng = bounds.getSouthWest();
	    
	    var RodeAddressValue = '<%= request.getParameter("RodeAddress") %>';
	    var Category2Value = '<%= request.getParameter("Category2") %>';

	    
	    // 영역정보의 북동쪽 정보를 얻어옵니다 
	    var neLatlng = bounds.getNorthEast();
		$.ajax({
			type: "get",
			url: "changeMap",
			dataType: "text",
			
			data:{//맵의 북동좌표, 남서좌표 데이터를 넘겨준다.
				swLatlng : swLatlng.toString(),
				neLatlng :  neLatlng.toString(),
				RodeAddress : RodeAddressValue,
				Category2 : Category2Value,
			},
			success: function(data, status, xhr){
				console.log('success');
				var ListData = JSON.parse(data);
	            //맵 이동시 이전의 마커들 삭제.
				for (var i = 0; i < markers.length; i++) {
	            	markers[i].setMap(null);
	            }
	            //전체 마커 배열 초기화, 우측 리스트 초기화
	            <% request.removeAttribute("list");%>
	            markers = [];
	            $(".text-result").html(null);
	            $(".text-result2").html(null);
				for (var i = 0; i < ListData.length; i++) {
					var name = ListData[i].facilitiesName;
					var latitude = ListData[i].latitude;
					var longitude = ListData[i].longitude;
					var category2 = ListData[i].category2;
					var postNumber = ListData[i].postNumber;
					var rodeAddress = ListData[i].rodeAddress;
					var phoneNumber = ListData[i].phoneNumber;
					var operationHours = ListData[i].operationHours;
					var rodeAddress =  ListData[i].rodeAddress;
					var houseAddress = ListData[i].houseAddress;
					var parking = ListData[i].parking;
					var dayOff = ListData[i].dayOff;
					var restrictions = ListData[i].restrictions;
					
					var positions = {
							content:'<div class="overlaybox">' +
						    '    <div class="boxtitle"><a href="https://map.kakao.com/link/map/'+name+','+ latitude +','+ longitude +'" title="상세보기" target="_blank" style="color: green;">'+ name + ' <img src="${pageContext.request.contextPath}/resources/오른쪽화살표.png" width=17 height=18>' + '</a></div>' +
						    '    <div class="first">' +
						    '        <div class="categorytext">카테고리:'+ category2 + '</div>' +
						    '    </div>' +
						    '    <ul>' +
						    '        <li>' +
						    '            <span class="title"><a style="color:green;">('+ postNumber +')</a>'+ rodeAddress +'</span>' +
						    '            <span class="arrow up"></span>' +
						    '        </li>' +
						    '        <li class="up">' +
						    '            <span class="title">' + phoneNumber + '</span>' +
						    '            <span class="arrow up"></span>' +
						    '        </li>' +
						    '        <li>' +
						    '            <span class="title">' + operationHours + '</span>' +
						    '            <span class="arrow up"></span>' +
						    '        </li>' +
						    '        <li>' +
						    '            <span class="title">'+ parking +'</span>' +
						    '            <span class="arrow down"></span>' +
						    '        </li>' +
						    '    </ul>' +
						    '</div>',
						    content2:'<div class="content2box">'+ name + '</div>',
							latlng: new kakao.maps.LatLng(latitude, longitude),
							img: category2,
							text : '<div class="place-container">' +
						    '    <div class="place-title" data-xxx="' + latitude + '" data-yyy="' + longitude + '">' + name + '</div>' +
						    '    <div class="place-content">' +
						    '        <div><span class="place-colum">카테고리</span>' + category2 + '</div>' +
						    '        <div><span class="place-colum">주소</span>(' + postNumber + ') ' + rodeAddress + '</div>' +
						    '        <div style="font-size: 12px; color:hsl(0, 0%, 45%);">&nbsp;&nbsp;&nbsp;[지번] ' + houseAddress + '</div>' +
						    '        <div><span class="place-colum">전화번호</span>' + phoneNumber + '</div>' +
						    '        <div><span class="place-colum">영업시간</span>' + operationHours + '&nbsp; <span class="place-colum">휴일 </span>' + dayOff + '</div>' +
						    '        <div><span class="place-colum">주차가능여부</span>' + parking + '&nbsp; <span class="place-colum">제한사항</span>' + restrictions + '</div>' +
						    '    </div>' +
						    '</div>' +
						    '<hr style="border: 0px; border-top: 0.5px dotted; color: #969696">'
						}
				    // 마커를 생성합니다
					if(positions.img.includes('의료')){
						var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/의료아이콘.png'; // 마커이미지의 주소입니다    
					}else if(positions.img.includes('식당') || positions.img.includes('카페')){
						var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/식당아이콘.png'; // 마커이미지의 주소입니다    
					}else if(positions.img.includes('여행') ){
						var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/여행지아이콘.png'; // 마커이미지의 주소입니다    
					}else if(positions.img.includes('서비스') ){
						var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/펫용품아이콘.png'; // 마커이미지의 주소입니다    
					}
					
				    var imageSize = new kakao.maps.Size(31, 31), // 마커이미지의 크기입니다
				    	imageOption = {offset: new kakao.maps.Point(15.5, 31)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
					    
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions.latlng, // 마커의 위치
				        image: markerImage // 마커이미지 설정 
				    });
				    // 마커에 표시할 인포윈도우를 생성합니다 
				    var infowindow = new kakao.maps.InfoWindow({
				        content: positions.content, // 인포윈도우에 표시할 내용
				        removable : true
				    });
				    var infowindow2 = new kakao.maps.InfoWindow({
				        content: positions.content2 // 인포윈도우에 표시할 내용
				    });
				    
				    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
				    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
				    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow2));
				    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow2));
					markers.push(marker);
					
					//새로 받은 리스트로 초기화 된 우측 리스트 다시 뿌리기
					$(".text-result2").append(positions.text);
				}
			},
			error: function(xhr, status, error){
				console.log("error",error);
				console.log("xhr",xhr.status);
			}
		});	//end ajax
	});
 
	
    
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 지도 확대 최대 값
	map.setMaxLevel(6);
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	        $(".content2box").parent('div');
	        $(".content2box").parent('div').parent('div').css('border','0px');
	        $(".content2box").parent('div').parent('div').css('background','unset');
	        $(".content2box").parent('div').siblings().css('display','none');
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
</script>
<script>
	$(function(){
		if( $("#address-param").attr("data-xxx") != 'null'){
			$("#address").val($("#address-param").attr("data-xxx"));
		}
		
		$("#addressSearch").click(function(){
			var RodeAddress = $("#address").val();
			
			var Category2 = $("#category-param").attr("data-xxx");
			if(Category2 != 'null'){
				location.href="/app/map?RodeAddress="+RodeAddress+"&Category2="+Category2;
			}else{
				location.href="/app/map?RodeAddress="+RodeAddress+"&Category2=";
			}
		});
		
		$("#address").keyup(function(key){
			if(key.keyCode === 13){
				var RodeAddress = $("#address").val();
				
				var Category2 = $("#category-param").attr("data-xxx");
				if(Category2 != 'null'){
					location.href="/app/map?RodeAddress="+RodeAddress+"&Category2="+Category2;
				}else{
					location.href="/app/map?RodeAddress="+RodeAddress+"&Category2=";
				}
			}
		})
		
		//우측 리스트 요소가 동적으로 생성되었기 때문에 다음과 같이  이벤트 위임을 사용
		$(document).on("click", ".place-title", function(data){
			var lat = data.target.dataset.xxx;
			var lon = data.target.dataset.yyy;
            map.setCenter(new kakao.maps.LatLng(lat, lon));
		});
		
		$("#categoryFilter").click(function(data){
 			var RodeAddress = $("#address").val();
 			var Category2 = data.target.id;	
 			location.href="/app/map?RodeAddress="+RodeAddress+"&Category2="+Category2;
 			if(data.target.id.includes('all')){
 				location.href="/app/map?RodeAddress="+RodeAddress+"&Category2=";
 			}
		});
		
		$(document).on("mouseover", ".place-title", function(data){
			data.target.style="color:green;";
		});
		$(document).on("mouseout", ".place-title", function(data){
			data.target.style="color:black;";
		});
		
		$(".place-title").mouseover(function(data){
			data.target.style="color:blue";
		});
		$(".place-title").mouseout(function(data){
			data.target.style="";
		});
		
	});
</script>
<br>
<jsp:include page = "../common/map_ad2.jsp" flush="true"/><br>
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</body>
</html>