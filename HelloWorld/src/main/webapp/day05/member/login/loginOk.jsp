<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jsplec.MemberDAO"%>
<%@page import="com.jsplec.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 성공</h2>
	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	MemberDAO memberDao = new MemberDAO();
	MemberDTO memberDto = memberDao.memberLogin(id, pw);

	if (memberDto != null) {
	    session.setAttribute("loginId", memberDto.getId());
	    session.setAttribute("loginPw", memberDto.getPw());

	    response.sendRedirect("/HelloWorld/day05/member/main.jsp");
	    out.println("로그인 성공");
	} else {
	    response.sendRedirect("/HelloWorld/day05/member/login/login.jsp");
	    out.println("로그인 실패");
	}

	%>


	<!-- 
	<br />

	<a href="/HelloWorld/member/modify/modify.jsp">회원 정보수정</a>
	<br />
	<a href="/HelloWorld/member/login/logout.jsp">로그아웃</a>
	<br /> -->
</body>
</html>