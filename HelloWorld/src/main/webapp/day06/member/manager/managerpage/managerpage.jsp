<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jsplec2.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
		}
		
		.container {
			max-width: 600px;
			margin: 0 auto;
			padding: 20px;
			justify-content: center;
			background-color: #ffffff;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		}
		
		h1 {
			text-align: center;
			margin-bottom: 20px;
			color: #4CAF50;
		}
		
		.menu {
			display: flex;
			justify-content: center;
			margin-bottom: 30px;
		}
		
		.menu a {
			display: inline-block;
			margin-right: 20px;
			padding: 10px;
			margin-top:30px;
			background-color: #4CAF50;
			color: #ffffff;
			text-decoration: none;
			border-radius: 4px;
		}
		
		.menu a:hover {
			
			background-color: #45a049;
			cursor: pointer;
		}
		
		.footer {
			text-align: center;
			margin-top: 40px;
			padding: 10px;
			color: #999999;
			font-size: 12px;
		}
		
		table {
			width: 100%;
			border-collapse: collapse;
		}
		
		table td {
			padding: 8px;
			border: 1px solid #dddddd;
		}
		
		table tr:nth-child(even) {
			background-color: #f9f9f9;
		}
		
		table tr:first-child {
			background-color: #4CAF50;
			color: #ffffff;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>관리자 페이지</h1>
		<h2>관리자 정보</h2>
		<% 
		MemberDTO dto = (MemberDTO) session.getAttribute("loginId");%>
		<table>
			<tr>
				<td>이름</td>
				<td><%=dto.getName()%></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><%=dto.getId()%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=dto.getPw()%></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%=dto.getEmail()%></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=dto.getPhone()%></td>
			</tr>
			<tr>
				<td>회원 상태</td>
				<td><%=dto.getStatus()%></td>
			</tr>
			<tr>
				<td>회원 권한</td>
				<td><%=dto.getUser_permission()%></td>
			</tr>
		</table>
		<div class="menu">
			<a href="/HelloWorld/day06/member/manager/select/selectAll.jsp">회원 조회</a>
			<a href="/HelloWorld/day06/member/manager/login/logout.jsp">로그아웃</a>
			<a href="/HelloWorld/day06/member/manager/approve/approve.jsp">회원 승인 수정</a>
		</div>
	</div>
	<footer class="footer">
		<p>&copy; 2023 HelloWorld. All rights reserved.</p>
	</footer>
</body>
</html>
