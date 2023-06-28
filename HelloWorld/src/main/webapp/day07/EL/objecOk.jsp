<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <%
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   %>

   아이디:
   <%=id%><br /> 비밀번호:
   <%=pw%><br />

   <hr />

   아이디: ${param.id }
   <br /> 비밀번호: ${param.pw }
   <br />

   <hr />

   applicationScope: ${applicationScope.application_name }
   <br /> sessionScope: ${sessionScope.session_name}
   <br /> pageScope: ${pageScope.page_name }
   <br /> requestScope: ${requestScope.request_name }
   <br />

   <hr />

   context 초기화 파라미터
   <br /> dbId: ${initParam.dbId }
   <br /> dbPwd: ${initParam.dbPwd }
   <br /> dbSid: ${initParam.dbSid }
   <br />
</body>
</html>