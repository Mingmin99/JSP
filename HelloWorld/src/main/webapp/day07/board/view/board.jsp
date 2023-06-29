<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f5f5f5;
}

h1 {
	text-align: center;
	color: #333;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ddd;
	text-align: center;
}

.container a {
	display: block;
	margin-top: 20px;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	border-radius: 4px;
	background-color: lightpink;
	color: #fff;
	cursor: pointer;
	text-decoration: none;
}

.container a:hover {
	background-color: #ff80ab;
}
</style>
</head>
<body>
	<div class="container">
		<h1>게시판 메인 페이지</h1>
		<a href="GetAllList.do">게시판 조회</a>
	</div>
</body>
</html>
