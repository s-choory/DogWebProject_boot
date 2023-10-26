<%@page import="java.util.*"%>
<%@page import="com.example.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>고객센터/문의하기</title>
<link rel="stylesheet" href="resources/css2/CC.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>

<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>

<!-- 검색기능 dto꺼내오기-->
<%	PageNoticeDTO pnDTO= (PageNoticeDTO)request.getAttribute("pnDTO");
	String order= (String)request.getAttribute("order"); // 정렬에 필요한 변수	%>
<div class="ContactCenter_Top">
	<div class="ContactCenter_Top_Name" align="center">고객센터</div>
	<table class="ContactCenter_Choice_Table">
		<tr>
			<td/>
			<td rowspan="2" class="ContactCenter_Choice_Yes" id="Notice">공지사항</td>
			<td rowspan="2" class="ContactCenter_Choice_No" id="FAQ"><a href="ContactCenter_FAQ">FAQ</a></td>
			<td/>
		</tr>
		<tr>
			<td class="ContactCenter_Choice_Side"/>
			<td class="ContactCenter_Choice_Side"/>
		</tr>
	</table>
</div>
	<!-- 카테고리별 select 기능구현  -->
	<form action="/app/ContactCenter_Notice">
		<div class = "categories">
			<input type="submit"  id= "order" name = "order" value="최신순"> &nbsp;&nbsp;
			<input type="submit" name = "order" value="오래된 순"> &nbsp;&nbsp;
		</div>
	</form>
<!-- 검색기능 구현 -->
    <form action="/app/ContactCenter_Notice">
 	<input type="text" id="search" placeholder="찾는 게시물을 검색해주세요." name="search" value="" />
    </form>

<div class="ContactCenter_Notice">
	<table class="ContactCenter_Notice_Table">
		<tr>
			<td class="ContactCenter_Notice_Top_Count">번호</td>
			<td class="ContactCenter_Notice_Top_Name">제목</td>
			<td class="ContactCenter_Notice_Top_Writer">작성자</td>
			<td class="ContactCenter_Notice_Top_Uploaddate">작성일</td>
			<td class="ContactCenter_Notice_Top_Count">조회</td>
		</tr>
	<% 
	List<NoticeDTO> nlist = pnDTO.getNlist();

 	for(int i = 0; i<nlist.size(); i++){
 		
	NoticeDTO dto= nlist.get(i);
	int NoticeID= dto.getNoticeID();
	String Title= dto.getTitle();
	String Content= dto.getContent();
	String CreationTime= dto.getCreationTime();
	int Hit= dto.getHit();
	%> 
    <tr>
        <td class="ContactCenter_Notice_Bottom_Center"><%= NoticeID %></td>
        <td class="ContactCenter_Notice_Bottom_Left"><a href="ContactCenter_Notice_page?NoticeID=<%= NoticeID %>&curPage=${pnDTO.curPage}"><%= Title %></a></td>
        <td class="ContactCenter_Notice_Bottom_Center">운영자</td>
        <td class="ContactCenter_Notice_Bottom_Center"><%= CreationTime %></td>
        <td class="ContactCenter_Notice_Bottom_Center"><%= Hit %></td>
    </tr>
	<% } %>
	</table>
</div>

<div class="page">
<jsp:include page = "../common/pageNotice.jsp" flush="true"/><br>
</div>
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</body>
</html>
