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
	<h1>회원정보 수정 성공</h1>
	<%
    String id = (String) session.getAttribute("loginId");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String phone1 = request.getParameter("phone1");
    String phone2 = request.getParameter("phone2");
    String phone3 = request.getParameter("phone3");
    String gender = request.getParameter("gender");

    MemberDAO dao = new MemberDAO();
    MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
    out.println(dto);
    dao.memberUpdate(dto);
%>

이름: <%= dto.getName() %><br /> 
비밀번호: <%= dto.getPw() %><br /> 
전화번호 1: <%= dto.getPhone1() %><br /> 
전화번호 2: <%= dto.getPhone2() %><br /> 
전화번호 3: <%= dto.getPhone3() %><br /> 
성별: <%= dto.getGender() %><br />
</body>
</html>