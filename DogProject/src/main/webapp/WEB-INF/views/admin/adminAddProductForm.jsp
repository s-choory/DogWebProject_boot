<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<style type="text/css">
	
	input{
		width: 450px;
		
	}

</style>
</head>
<body style="text-align: center;">

<h1 style="margin-top:20px; text-align: center;"> 상품 추가 </h1>
<form action="adminAddProduct" method="get">
<input type="text" name="PRODUCTNAME" placeholder="상품명"><br><br>
<select name="category">
    <option selected="selected">간식</option>
    <option>사료</option>
    <option>식기</option>
    <option>의류</option>
    <option>장난감</option>
</select><br><br>
<input type="text" name="Content" placeholder="상세설명. ex)이 상품은 어쩌구.... 저쩌구...."><br><br>
<input type="text" name="Price" placeholder="가격. ex)13000"><br><br>
<input type="text" name="Image" placeholder="이미지(이미지 파일 이름으로 저장). ex)의류3.jpg => '의류3' 으로 입력 " ><br><br>
<input type="text" name="STOCKQUANTITY" placeholder="재고수량. ex)50"><br><br>
<button type="submit">상품 추가하기</button><br><br>
</form>
</body>
</html>