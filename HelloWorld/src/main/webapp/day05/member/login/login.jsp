<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
body {
	font-family: Arial, sans-serif;
}

h1 {
	text-align: center;
}

form {
	width: 300px;
	margin: 0 auto;
	text-align: center;
}

.form-group {
	margin-bottom: 10px;
}

.form-label {
	display: block;
	font-weight: bold;
}

.form-input {
	width: 100%;
	padding: 5px;
	font-size: 14px;
}

.form-submit {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	cursor: pointer;
}

.form-submit:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<h1>로그인</h1>
	<form action="loginOk.jsp" method="post">
		<div class="form-group">
			<label class="form-label" for="id">아이디:</label> <input
				class="form-input" type="text" name="id" id="id" required>
		</div>
		<div class="form-group">
			<label class="form-label" for="pw">비밀번호:</label> <input
				class="form-input" type="password" name="pw" id="pw" required>
		</div>
		<input class="form-submit" type="submit" value="로그인">
	</form>
</body>
</html>
