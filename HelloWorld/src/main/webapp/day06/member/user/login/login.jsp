<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #f2f2f2;
	}

	.container {
		display: flex;
		flex-direction: column;
		align-items: center;
		/* justify-content: center; */
		height: 100vh;
	}

	.card {
		width: 300px;
		padding: 20px;
		background-color: #ffffff;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}

	.title {
		text-align: center;
		margin-bottom: 20px;
		color: #4CAF50;
	}

	.form-group {
		margin-bottom: 10px;
	}

	.form-label {
		display: block;
		font-weight: bold;
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

	.register-link {
		text-align: center;
		margin-top: 10px;
	}

	.register-link a {
		color: #4CAF50;
		text-decoration: none;
	}

	.register-link a:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="card">
			<h1 class="title">사용자 로그인</h1>
			<form action="loginOk.jsp" method="post">
				<div class="form-group">
					<label class="form-label" for="id">아이디:</label>
					<input class="form-input" type="text" name="id" id="id" required>
				</div>
				<div class="form-group">
					<label class="form-label" for="pw">비밀번호:</label>
					<input class="form-input" type="password" name="pw" id="pw" required>
				</div>
				<input class="form-submit" type="submit" value="로그인">
			</form>
			<br/>
			<div class="register-link">
				<a href="/HelloWorld/day06/member/user/join/join.jsp">회원가입하기</a>
				<br/>
				<br/>
				<a href="/HelloWorld/day06/memberMain.jsp">메인화면으로 돌아가기</a>
			</div>
		</div>
	</div>
</body>
</html>
