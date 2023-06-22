<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");

    // 첫 번째 세션 객체 얻기
    HttpSession session1 = request.getSession();
    session1.setAttribute("id", "min");
    session1.setMaxInactiveInterval(60 * 60);

    // 두 번째 세션 객체 얻기
    HttpSession session2 = request.getSession();
    session2.setAttribute("passwd", "01234");
    session2.setMaxInactiveInterval(60 * 60);
    
%>
	<%-- 세션 속성 출력 --%>
    <% Enumeration<String> attributeNames = session1.getAttributeNames(); %>
    <h3>Session Attributes:</h3>
    <ul>
        <% while (attributeNames.hasMoreElements()) { %>
            <% String attributeName = attributeNames.nextElement(); %>
            <li><%= attributeName %>: <%= session1.getAttribute(attributeName) %></li>
        <% } 
        
        out.println(session1.getAttribute("id") + "님 로그인을 환영합니다.");
        %>

	</ul>
	<a href="=sessiondel.jsp">session del</a>
</body>
</html>