<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>set/out 사용 예</h3>
	<c:set var="varName" value="홍길동" />
	varName :
	<c:out value="${varName }" />
	<br />

	<h3>remove 사용 예</h3>
	<c:remove var="varName" />
	varName 제거 후 :
	<c:out value="${varName }" />
	<br />
	<hr />

	<h3>catch 사용 예</h3>
	<c:catch var="error">
		<%= 2/0 %>
	</c:catch>
	<br />
	<c:out value="${error }" />
	<hr />

	<h3>if 사용 예</h3>
	<c:if test="${1+2 == 3 }">
        1 + 2 = 3
    </c:if>
	<br />
	<c:if test="${1+2 != 3 }">
        1 + 2 != 3
    </c:if>
	<hr />

	<h3>choose 사용 예</h3>
	<c:set var="varName" value="홍길순" />
	<c:choose>
		<c:when test="${varName =='홍길동' }">when : 홍길동 </c:when>
		<c:otherwise>when: 다른 사람</c:otherwise>
	</c:choose>
	<hr />

	<h3>forEach 사용 예</h3>
	<c:forEach var="fEach" begin="0" end="30" step="3">
        ${fEach }
    </c:forEach>
	<p>
		<%
        List<String> fruits = new ArrayList<String>();
        
        fruits.add("사과");
        fruits.add("배");
        fruits.add("바나나");
        fruits.add("감");
        fruits.add("귤");
        
        pageContext.setAttribute("aFruits", fruits);
    
    
    %>
	
	<ul>
		<c:forEach var="result" items="${aFruits }">
			<li>${result }</li>
		</c:forEach>
		<p>
	</ul>
	<%
        pageContext.setAttribute("aEach", "홍길동, 홍순이, 홍길이");
    %>
	<ul>
		<c:forEach var="result" items="${aEach }">
			<li>${result }</li>
		</c:forEach>
	</ul>
	<hr />

</body>
</html>