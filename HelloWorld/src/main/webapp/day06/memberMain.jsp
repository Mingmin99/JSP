<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
	body {
		background-color: #f2f2f2;
		font-family: Arial, sans-serif;
		text-align: center;
	}

	.container {
		max-width: 400px;
		margin: 0 auto;
		padding: 20px;
		background-color: #ffffff;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}

	h1 {
		margin-bottom: 20px;
	}

	.menu-link {
		display: block;
		margin-bottom: 10px;
		text-decoration: none;
		background-color: #4CAF50;
		color: #ffffff;
		padding: 10px;
		border-radius: 4px;
		transition: background-color 0.3s;
	}

	.menu-link:hover {
		background-color: #45a049;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>메인 페이지</h1>
		<a href="/HelloWorld/day06/member/user/login/login.jsp" class="menu-link">사용자 메뉴</a>
		<a href="/HelloWorld/day06/member/manager/login/login.jsp" class="menu-link">관리자 메뉴</a>
	</div>
</body>
</html>
