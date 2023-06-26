<%@ page import="com.jsplec2.MemberDAO" %>
<%@ page import="com.jsplec2.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 수정 처리</title>
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

        .message {
            text-align: center;
            margin-top: 30px;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
        }

        .back-link:hover {
            color: #45a049;
        }
    </style>
</head>
<body>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    MemberDAO dao = new MemberDAO();
    MemberDTO member = dao.selectById(id); // 입력한 아이디에 해당하는 회원 가져오기

    int iResult = 0; // 결과 변수 선언 및 초기화

    if (member != null) {
        member.setName(name); // 이름 업데이트
        member.setEmail(email); // 이메일 업데이트
        iResult = dao.userUpdate(member); // 회원 정보 업데이트

        if (iResult > 0) {
            member = dao.selectById(id); // 업데이트된 회원 정보 다시 가져오기
        }
    }
%>

<div class="container">
    <h1>회원 수정 처리</h1>

    <% if (member != null) { %>
        <div class="message">
            <% if (iResult > 0) { %>
                <p>회원 정보가 성공적으로 업데이트되었습니다.</p>
                <p>아이디: <%= member.getId() %></p>
                <p>이름: <%= member.getName() %></p>
                <p>이메일: <%= member.getEmail() %></p>
            <% } else { %>
                <p>회원 정보 업데이트에 실패했습니다.</p>
            <% } %>
        </div>
    <% } else { %>
        <div class="message">
            <p>입력한 아이디에 해당하는 회원이 존재하지 않습니다.</p>
        </div>
    <% } %>

    <a href="/HelloWorld/day06/member/manager/managerpage/managerpage.jsp" class="back-link"> 관리자 페이지로 돌아가기</a>
</div>

</body>
</html>
