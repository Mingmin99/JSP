<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	String id;
	String passwd;
	String name;
	String email;
	%>

	<%
	
	id = request.getParameter("id");
	passwd = request.getParameter("passwd");
	name = request.getParameter("name");
	email = request.getParameter("email");
	
	%>
	<jsp:useBean id="member" class="com.jsp.Member" scope="application" />
	<jsp:setProperty name="member" property="id" value="<%=id%>"/>
	<jsp:setProperty name="member" property="passwd" value="<%=passwd%>"/>
	<jsp:setProperty name="member" property="name" value="<%=name%>"/>
	<jsp:setProperty name="member" property="email" value="<%=email%>"/>
	
	<h1>회원 정보 저장 완료</h1>
	
	<a href="memberConfirm.jsp">저장된 정보 출력하기</a>

	<%-- <jsp:getProperty name="member" property="id" />
	<jsp:getProperty name="member" property="passwd" />
	<jsp:getProperty name="member" property="name" />
	<jsp:getProperty name="member" property="email" /> --%>

</body>
</html>