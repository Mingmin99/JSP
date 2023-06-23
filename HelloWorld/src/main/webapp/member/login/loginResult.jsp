<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 성공</h2>
 <%= session.getAttribute("name") %>님 환영합니다.
 <br/>
 
<a href="/HelloWorld/member/modify/modify.jsp">회원 정보수정</a><br/>
<a href="/HelloWorld/member/login/logout.jsp">로그아웃</a><br/>
</body>
</html>