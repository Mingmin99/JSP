<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jsplec2.MemberDAO"%>
<%@page import="com.jsplec2.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그아웃</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
			margin: 0;
			padding: 0;
		}
		
		.container {
			max-width: 600px;
			margin: 0 auto;
			padding: 20px;
			background-color: #ffffff;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		}
		
		h1 {
			text-align: center;
			margin-bottom: 20px;
			color: #4CAF50;
		}
		
		.message {
			text-align: center;
			margin-bottom: 20px;
		}
		
		.link {
			text-align: center;
			margin-top: 30px;
		}
		
		.link a {
			display: inline-block;
			padding: 10px 20px;
			background-color: #4CAF50;
			color: #ffffff;
			text-decoration: none;
			border-radius: 4px;
		}
		
		.link a:hover {
			background-color: #45a049;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>로그아웃</h1>
		<div class="message">
			<%
			MemberDTO dto = (MemberDTO) session.getAttribute("loginId");
			 session.invalidate();
			out.println(dto.getName() + "님이 로그아웃되셨습니다.");
			%>
		</div>
		<div class="link">
			<a href="/HelloWorld/day06/memberMain.jsp">처음으로</a>
		</div>
	</div>
</body>
</html>
