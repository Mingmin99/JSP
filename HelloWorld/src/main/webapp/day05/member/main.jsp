<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Main</h1>
	<%
	String id = (String) session.getAttribute("loginId");
	String pw = (String) session.getAttribute("loginPw");

	out.println(id + " 님 로그인을 환영합니다");
	%>

	<br />
	<br />
	<br />
	<a href="/HelloWorld/day05/member/login/logout.jsp">로그아웃</a>
	<br />
	<a href="/HelloWorld/day05/member/modify/modify.jsp"">회원정보수정</a>
</body>
</html>