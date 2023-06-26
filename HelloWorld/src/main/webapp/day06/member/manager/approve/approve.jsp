<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 승인</title>
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

    .links {
        text-align: center;
        margin-top: 20px;
    }

    .links a {
        display: inline-block;
        margin-right: 10px;
        padding: 10px 20px;
        background-color: #4CAF50;
        color: #ffffff;
        text-decoration: none;
        border-radius: 5px;
    }

    .links a:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<div class="container">
    <h1>회원 승인</h1>

    <div class="links">
        <a href="/HelloWorld/day06/member/manager/approve/signApprove.jsp">회원가입 승인 페이지</a>
        <a href="/HelloWorld/day06/member/manager/approve/withdrawalApprove.jsp">회원탈퇴 승인 페이지</a>
    </div>
</div>

</body>
</html>
