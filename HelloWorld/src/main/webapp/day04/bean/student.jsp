<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="student" class="com.jsp.Student" scope="page" />
	<jsp:setProperty name="student" property="name" value="미녕" /><br/>
	<jsp:setProperty name="student" property="age" value="25짤" /><br/>
	<jsp:setProperty name="student" property="grade" value="몰랑" /><br/>
	<jsp:setProperty name="student" property="studentNum" value="20번" /><br/>

	<jsp:getProperty name="student" property="name" />
	<jsp:getProperty name="student" property="age" />
	<jsp:getProperty name="student" property="grade" />
	<jsp:getProperty name="student" property="studentNum" />
</body>
</html>