<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.jsplec2.MemberDAO"%>
<%@page import="com.jsplec2.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
	body {
		background-color: #f2f2f2;
		font-family: Arial, sans-serif;
	}

	.container {
		max-width: 400px;
		margin: 0 auto;
		padding: 20px;
		background-color: #ffffff;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}

	h1 {
		text-align: center;
		margin-bottom: 20px;
	}

	form {
		margin-top: 20px;
	}

	label {
		display: block;
		margin-bottom: 5px;
	}

	form input[type="text"],
	form input[type="password"] {
		width: 90%;
		padding: 10px;
		margin-bottom: 10px;
		border: 1px solid #ccc;
		border-radius: 4px;
	}

	form input[type="submit"] {
		width: 100%;
		padding: 10px;
		background-color: #4CAF50;
		color: #ffffff;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}

	form input[type="submit"]:hover {
		background-color: #45a049;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>회원정보 수정</h1>
	
	
		<form action="modifyOk.jsp" method="post">
			<!-- <input type="hidden" name="name" id="name"> -->		
			<label for="name">이름:</label>
			<input type="text" name="name" id="name">
			<br>
			<label for="pw">비밀번호:</label>
			<input type="password" name="pw" id="pw">
			<br>
			<label for="phone">연락처:</label>
			<input type="text" name="phone" id="phone">
			<br>
			<label for="email">이메일:</label>
			<input type="text" name="email" id="email">
			<br><br>
			<input type="submit" value="전송">
		</form>
	</div>
</body>
</html>
