<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
<style type="text/css">
	body{
		text-align: center;
	}
	nav{
		font-size:20px;
	}
	a:-webkit-any-link {
	    cursor: pointer;
	    text-decoration: none;
	}
	
</style>
</head>
<body>
    <header>
        <h1>관리자 페이지</h1>
    </header>
	<nav><br>
            <a href="/app/" style="font-weight: bolder; color:red;">관리자페이지 나가기</a> <br><br><br>
            <a href="adminRequest">문의/신고 조회</a> <br><br>
            <a href="adminNoticeList">공지사항/FAQ 목록 조회</a> <br><br>
            <a href="adminPostsList">전체 게시물 목록 조회</a> <br><br>
            <a href="adminGoodsList">상품 목록 조회</a> <br><br>
            <a href="adminOrderList">주문 목록 조회</a><br><br>
            <a href="adminGroup">모임 목록 조회</a><br><br>
	</nav>

</body>
</html>
