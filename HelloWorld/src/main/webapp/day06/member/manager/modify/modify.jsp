<%@ page import="java.util.ArrayList" %>
<%@ page import="com.jsplec2.MemberDAO" %>
<%@ page import="com.jsplec2.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-top: 50px;
            margin-bottom: 20px;
            color: #4CAF50;
        }

        form {
            margin-top: 30px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 10px;
        }

        label {
            display: inline-block;
            width: 100px;
            text-align: right;
            margin-right: 10px;
        }

        input[type="text"] {
            padding: 5px;
            width: 200px;
        }

        .submit-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }

        .submit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%
    String inputId = request.getParameter("id");
    MemberDAO dao = new MemberDAO();
    MemberDTO member = dao.selectById(inputId); // 입력한 아이디에 해당하는 회원 정보 가져오기
%>

<div class="container">
    <h1>회원 수정</h1>

    <form action="/HelloWorld/day06/member/manager/modify/modifyOk.jsp" method="POST">
        <div class="form-group">
            <label for="id">아이디:</label>
            <input type="text" name="id" id="id">
        </div>
        <div class="form-group">
            <label for="name">이름:</label>
            <input type="text" name="name" id="name" value="<%= member != null ? member.getName() : "" %>">
        </div>
        <div class="form-group">
            <label for="email">이메일:</label>
            <input type="text" name="email" id="email" value="<%= member != null ? member.getEmail() : "" %>">
        </div>

        <div class="form-group">
            <input type="submit" value="수정하기" class="submit-btn">
        </div>
    </form>
</div>

</body>
</html>
