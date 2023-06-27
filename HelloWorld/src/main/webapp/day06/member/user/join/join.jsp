<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jsplec2.MemberDAO"%>
<%@page import="com.jsplec2.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

.container {
	width: 300px;
	margin: 0 auto;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 20px;
	color: #4CAF50;
}

.form-group {
	margin-bottom: 10px;
}

.form-label {
	display: block;
	font-weight: bold;
	margin-right: 10px;
	color: #555555;
}

.form-input {
	width: 100%;
	padding: 5px;
	font-size: 14px;
	border: 1px solid #dddddd;
	border-radius: 4px;
}

.form-submit {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	background-color: #4CAF50;
	color: #ffffff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.form-submit:hover {
	background-color: #45a049;
}

.return-link {
	display: block;
	margin-top: 20px;
	text-align: center;
	color: #555555;
}

</style>
</head>
<body>
	<div class="container">
		<h1>회원가입</h1>
		<form action="joinOk.jsp" method="post">
			<div class="form-group">
				<label class="form-label" for="id">아이디:</label> <input
					class="form-input" type="text" name="id" id="id" required>
			</div>
			<div class="form-group">
				<label class="form-label" for="pw">비밀번호:</label> <input
					class="form-input" type="password" name="pw" id="pw" required>
			</div>
			<div class="form-group">
				<label class="form-label" for="name">이름:</label> <input
					class="form-input" type="text" name="name" id="name" required>
			</div>
			<div class="form-group">
				<label class="form-label" for="email">이메일:</label> <input
					class="form-input" type="text" name="email" id="email" required>
			</div>
			<div class="form-group">
				<label class="form-label" for="phone">전화번호:</label> <input
					class="form-input" type="text" name="phone" id="phone" required>
			</div>
			<input class="form-submit" type="submit" value="회원가입">
		</form>
		<a class="return-link" href="/HelloWorld/day06/member/user/login/login.jsp">로그인 화면으로 돌아가기</a>
	</div>
</body>
</html>