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
	%>

	%> --%>

	<%id = request.getParameter("id");
	passwd = request.getParameter("passwd");
	
	if(id.equals("min") && passwd.equals("1234")){
		response.sendRedirect("session.jsp?=" + id + "&passwd" + passwd);
		
	}
	else{
	    response.sendRedirect("login.jsp");
	}
	
	%>
</body>
</html>