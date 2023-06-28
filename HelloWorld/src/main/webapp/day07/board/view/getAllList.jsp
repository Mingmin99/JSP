<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </style>
</head>
<body>
    <h1>게시판 조회 리스트</h1>
    <table>
        <thead>
            <tr>
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
                    <td>${post.id}</td>
                    <td>${post.writer}</td>
                    <td>${post.title}</td>
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
</body>
</html>
