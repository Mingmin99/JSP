<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	HttpSession session1 = request.getSession(false);
	if (session1 != null) {
		session1.removeAttribute("id");
	}
	out.println("session1의 id 속성 삭제");
	%>

	<%
	HttpSession session2 = request.getSession(false);
	if (session2 != null) {
		session2.removeAttribute("id");
	}
	out.println("session2의 id 속성 삭제");
	%>

	<%
	HttpSession sessionall = request.getSession(false);
	if (sessionall != null) {
	sessionall.invalidate();
	out.println("session 모두 삭제");
	}
	%>

</body>
</html>