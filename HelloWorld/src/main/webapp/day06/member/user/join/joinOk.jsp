<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="com.jsplec2.MemberDAO"%>
<%@page import="com.jsplec2.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 결과</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
			margin: 0;
			padding: 0;
		}

		.container {
			width: 400px;
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

		.result-message {
			text-align: center;
			margin-top: 30px;
			font-weight: bold;
			font-size: 16px;
			color: #555555;
		}

		.result-success {
			color: #4CAF50;
		}

		.result-failure {
			color: #e60000;
		}

		.navigation-links {
			margin-top: 30px;
			text-align: center;
		}

		.link-button {
			display: inline-block;
			margin: 5px;
			padding: 10px 20px;
			font-size: 14px;
			background-color: #4CAF50;
			color: #ffffff;
			text-decoration: none;
			border-radius: 4px;
			transition: background-color 0.3s ease;
		}

		.link-button:hover {
			background-color: #45a049;
		}
	</style>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String status = "승인전";
		String user_permission = "사용자";
		
		MemberDTO memberDTO = new MemberDTO(name, id, pw, email, phone, status, user_permission);
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.memberInsert(memberDTO);
	%>
	<div class="container">
		<h1>회원가입 결과</h1>
		<div class="result-message <%= result > 0 ? "result-success" : "result-failure" %>">
			<%= result > 0 ? "회원가입 요청이 성공적으로 완료되었습니다." : "회원가입 요청에 실패하였습니다." %>
		</div>

		<div class="navigation-links">
			<a href="/HelloWorld/day06/memberMain.jsp" class="link-button">처음으로</a>
			<a href="/HelloWorld/day06/member/user/login/login.jsp" class="link-button">로그인하러 가기</a>
		</div>
	</div>
</body>
</html>
	