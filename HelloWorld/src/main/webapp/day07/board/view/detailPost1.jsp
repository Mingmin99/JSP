<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f5f5f5;
}

h1 {
	text-align: center;
	color: #333;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ddd;
}

.container h2 {
	margin-bottom: 20px;
	color: #333;
}

.container table {
	width: 100%;
}

.container th,
.container td {
	padding: 5px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.container th {
	background-color: lightpink;
	font-weight: bold;
	width: 15%;
	text-align: center;
}

.container td {
	width: 70%;
	height: 50px; /* 변경된 값 */
}

.container tr:hover {
	background-color: #f9f9f9;
}

.form-container {
	margin-top: 20px;
	text-align: center;
}

.form-container input[type="text"],
.form-container textarea {
	width: 100%;
	padding: 10px;
	font-size: 16px; /* 변경된 값 */
	box-sizing: border-box;
}

.btn-container {
	margin-top: 20px;
	text-align: center;
}

.btn-container .btn-group {
	display: flex;
	justify-content: center;
}

.btn-container input[type="submit"],
.btn-container a,
.btn-container button {
	margin: 5px;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	border-radius: 4px;
	background-color: lightpink;
	color: #fff;
	cursor: pointer;
	text-decoration: none;
}

.btn-container a {
	border: 1px solid lightpink;
	background-color: transparent;
	color: lightpink;
}

.btn-container a:hover,
.btn-container input[type="submit"]:hover,
.btn-container button:hover {
	background-color: #ff80ab;
}

a {
	display: block;
	margin-top: 20px;
	text-align: center;
	text-decoration: none;
	color: #333;
}
</style>
</head>

<body>
	<h1>게시물 상세 내용</h1>
	<c:if test="${not empty post}">
		<div class="container">
			<h2>게시물 정보</h2>
			<form action="update.do" method="post">
				<input type="hidden" name="id" value="${post.id}">
				<input type="hidden" name="category" value="${post.category}">
				<input type="hidden" name="levelNum" value="${post.levelNum}">
				<input type="hidden" name="blank" value="${post.blank}">
				<table>
					<tr>
						<th style="text-align: center;">번호</th>
						<td>${post.id}</td>
					</tr>
					<tr>
						<th style="text-align: center;">조회수</th>
						<td>${post.views}</td>
					</tr>
					<tr>
						<th style="text-align: center;">이름</th>
						<td>
							<input type="text" name="writer" value="${post.writer}" required style="font-size: 16px;">
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">제목</th>
						<td>
							<input type="text" name="title" value="${post.title}" required style="font-size: 16px;">
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">내용</th>
						<td>
							<textarea name="content" required rows="5">${post.content}</textarea>
						</td>
					</tr>
				</table>
				<div class="btn-container">
					<div class="btn-group">
						<input type="submit" value="수정">
						<a href="GetAllList.do">목록보기</a>
						<a href="delete.do?id=${post.id}">삭제</a>
						<button type="submit" formaction="replyPost.jsp" formmethod="post" class="btn-reply">답글</button>
					</div>
				</div>
			</form>
		</div>
	</c:if>
</body>
</html>
