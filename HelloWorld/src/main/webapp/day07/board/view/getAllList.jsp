<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 조회 리스트</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 20px;
}

h1 {
	color: #333;
}

table {
	width: 100%;
	background-color: #fff;
	border-collapse: collapse;
	border: 1px solid #ddd;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: lightpink;
	font-weight: bold;
}

tr:hover {
	background-color: #f9f9f9;
}

.btn-container {
	text-align: right;
	margin-top: 20px;
}

.btn-container a {
	display: inline-block;
	margin-right: 10px;
	padding: 10px 20px;
	font-size: 16px;
	border: 1px solid lightpink;
	background-color: transparent;
	color: lightpink;
	text-decoration: none;
	cursor: pointer;
}

.btn-container a:hover {
	background-color: lightpink;
	color: #fff;
}

.delete-btn {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	background-color: lightpink;
	color: #fff;
	text-decoration: none;
	cursor: pointer;
}

.delete-btn:hover {
	background-color: #ff6b8b;
}

.checkbox-container {
	text-align: center;
	margin-top: 20px;
}

.checkbox-container input[type="checkbox"] {
	margin-right: 5px;
}
</style>
<script>
        function selectAll() {
            var checkboxes = document.getElementsByName('postIds');
            var selectAllCheckbox = document.getElementById('selectAllCheckbox');

            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = selectAllCheckbox.checked;
            }
        }
    </script>
</head>
<body>
	<h1>게시판 조회 리스트</h1>
	<form action="delete.do" method="post">
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="selectAllCheckbox"
						onclick="selectAll()"></th>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>카테고리</th>
					<th>레벨</th>
					<th>공백</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${getalllist}" var="post">
					<tr>
						<td><input type="checkbox" name="postIds" value="${post.id}"></td>
						<td>${post.id}</td>
						<td>${post.writer}</td>
						<td><a href="detail.do?id=${post.id}">${post.title}</a></td>
						<td>${post.content}</td>
						<td>${post.writeDate}</td>
						<td>${post.views}</td>
						<td>${post.category}</td>
						<td>${post.levelNum}</td>
						<td>${post.blank}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="btn-container">
			<a href="InsertPost.jsp">글 작성</a>
			<button type="submit" class="delete-btn">선택 삭제</button>
		</div>
	</form>
</body>
</html>