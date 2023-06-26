<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="com.jsplec.MemberDAO"%>
<%@page import="com.jsplec.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 인증</h1>
	<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");

	MemberDAO memberDao = new MemberDAO();
	MemberDTO memberDto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);

	memberDao.memberInsert(memberDto);
	out.println(memberDto.getName() + "님 회원가입이 완료되었습니다");
	%>
	<a href="/HelloWorld/day05/member/login/login.jsp">로그인 하러가기</a>
</body>
</html>