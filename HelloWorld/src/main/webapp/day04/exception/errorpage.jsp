<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true"%>
<!-- �ܺ� �������� ���� �ڵ����� ���ִ� �� ����, ��� �� -->
<%
response.setStatus(200);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   ���� �߻�
   <p>
      ���� ���� :
      <%=exception.getClass().getName()%>
   <p>
      ���� �޽��� :
      <%=exception.getMessage()%>
   <p>
      ���� ���� �� �޽��� :
      <%=exception.toString()%>
      
      
</body>
</html>