<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f8f8f8;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 20px;
            color: #e91e63;
        }

        .post-info {
            margin-bottom: 20px;
        }

        .post-info label {
            display: inline-block;
            width: 80px;
            font-weight: bold;
            color: #333;
        }

        .post-content {
            border: 1px solid #dddddd;
            padding: 10px;
            border-radius: 4px;
            font-size: 16px;
            margin-top : 10px;
            height : 100px;
            color: #333;
            background-color: #ffffff;
        }

        .button-container {
            text-align: center;
            margin-top: 30px;
        }

        .button-container button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #e91e63;
            color: #ffffff;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-right: 10px;
        }

        .button-container button:hover {
            background-color: #d81b5f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>게시글 상세보기</h1>
 			<div class="post-info">
            <label>번호:</label>
            <span>${post.id}</span>
        </div>
        <div class="post-info">
            <label>제목:</label>
            <span>${post.title}</span>
        </div>
        <div class="post-info">
            <label>작성자:</label>
            <span>${post.writer}</span>
        </div>
        <div class="post-info">
            <label>작성일:</label>
            <span>${post.writeDate}</span>
        </div>
        <div class="post-info">
            <label>조회수:</label>
            <span>${post.views}</span>
        </div>
        <div class="post-info">
            <label>내용:</label>
            <div class="post-content">${post.content}</div>
        </div>

        <div class="button-container">
            <button onclick="location.href='getAllList.jsp'">목록으로 돌아가기</button>
        </div>
    </div>
</body>
</html>
