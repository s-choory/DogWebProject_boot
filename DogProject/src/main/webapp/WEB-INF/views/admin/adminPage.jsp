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
	<nav>
            <a href="/app/">홈페이지 메인 이동</a> <br><br><br>
            <a href="adminRequest">문의/신고 조회</a> <br><br>
            <a href="#">공지사항/FAQ 목록 조회</a> <br><br>
            <a href="#">전체 게시물 목록 조회</a> <br><br>
            <a href="#">상품 목록 조회</a> <br><br>
            <a href="adminGroup">모임 목록 조회</a>
	</nav>

</body>
</html>
