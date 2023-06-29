<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>답글 작성</title>
    <style>
        /* 스타일링을 원하는 대로 추가해주세요 */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .form-container {
            width: 500px;
            margin: 20px auto;
        }

        .form-container table {
            margin: 0 auto;
        }

        .form-container th, .form-container td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        .form-container th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .form-container input[type="text"] {
            width: 100%;
            padding: 5px;
            box-sizing: border-box;
        }

        .form-container textarea {
            width: 100%;
            height: 100px;
            padding: 5px;
            box-sizing: border-box;
        }

        .btn-container {
            margin-top: 20px;
            text-align: center;
        }

        .btn-container input[type="submit"] {
            margin: 5px;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            background-color: lightpink;
            color: #fff;
            cursor: pointer;
        }

        .btn-container a {
            display: inline-block;
            margin: 5px;
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
    </style>
</head>

<body>
<h1>답글 작성</h1>
<div class="form-container">
    <form action="reply.do" method="post">
        <input type="hidden" name="parentPostId" value="<%=request.getParameter("id") %>">
        <table>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" name="writer" required>
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" name="title" required>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" required></textarea>
                </td>
            </tr>
        </table>
        <div class="btn-container">
            <input type="submit" value="작성">
            <a href="GetAllList.do">목록보기</a>
        </div>
    </form>
</div>
</body>
</html>
