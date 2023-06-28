<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>JSTL 예시</title>
</head>
<body>
	<h1>JSTL 예시</h1>

	<%-- 조건문과 반복문을 사용하는 예시 --%>
	<c:if test="${1 < 2}">
		<p>1은 2보다 작습니다.</p>
	</c:if>

	<c:forEach var="i" begin="1" end="5" step="1">
		<p>현재 숫자: ${i}</p>
	</c:forEach>

	<%-- 변수 선언과 사용하는 예시 --%>
	<c:set var="name" value="John" />
	</p>
	<c:out value="Hello, ${name}!" />

	<%-- 변수 설정 태그: <c:set> --%>
	<c:set var="count" value="5" />
	</p>
	<c:out value="Count: ${count}" />

	<%--변수를 제거하는 태그: <c:remove> --%>
	<c:set var="message" value="Hello" />
	<c:remove var="message" />
	</p>
	<c:out value="${message}" />

	<%--예외 처리 태그: <c:catch> --%>
	<c:set var="number" value="abc" />
	<c:catch var="ex">
		<c:set var="convertedNumber" value="${number}" />
	</c:catch>
	<c:out value="Converted Number: ${convertedNumber}" />

	<%--제어문(if) 태그: <c:if> --%>
	<c:set var="score" value="80" />
	<c:if test="${score >= 70}">
		</p>
		<p>Pass</p>
	</c:if>


	<%--제어문(switch) 태그: <c:choose> --%>
	<c:set var="day" value="Monday" />
	<c:choose>
		<c:when test="${day eq 'Monday'}">
			<p>It's Monday!</p>
		</c:when>
		<c:when test="${day eq 'Tuesday'}">
			<p>It's Tuesday!</p>
		</c:when>
		<c:otherwise>
			<p>It's another day!</p>
		</c:otherwise>
	</c:choose>
	</p>
	<%-- redirect 예시 --%>
	<%-- <c:redirect url="/targetPage.jsp">
		<c:param name="name" value="임떠영" />
	</c:redirect>
	<hr> --%>

	<hr>

</body>
</html>