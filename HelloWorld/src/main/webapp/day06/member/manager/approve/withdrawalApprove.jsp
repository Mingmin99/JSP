<%@ page import="java.util.ArrayList" %>
<%@ page import="com.jsplec2.MemberDAO" %>
<%@ page import="com.jsplec2.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #4CAF50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        input[type="text"] {
            width: 150px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            display: block;
            width: 150px;
            padding: 12px;
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            margin-top: 10px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .link-container {
            text-align: center;
            margin-top: 20px;
        }

        .link-container a {
            color: #4CAF50;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원 탈퇴</h1>
        <table>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>비밀번호</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>상태</th>
                <th>권한</th>
            </tr>
            <% 
            MemberDAO memberDAO = new MemberDAO();
            ArrayList<MemberDTO> memberList = memberDAO.selectStop();
            for (MemberDTO member : memberList) {
            %>
            <tr>
                <td><%= member.getId() %></td>
                <td><%= member.getName() %></td>
                <td><%= member.getPw() %></td>
                <td><%= member.getEmail() %></td>
                <td><%= member.getPhone() %></td>
                <td><%= member.getStatus() %></td>
                <td><%= member.getUser_permission() %></td>
            </tr>
            <% } %>
        </table>
        <form action="/HelloWorld/day06/member/manager/approve/withdrawalApproveOk.jsp" method="post">
            <div class="input-container">
                <label for="memberId">회원 아이디:</label>
                <input type="text" id="memberId" name="memberId" placeholder="아이디를 입력하세요">
            </div>
            <div class="button-container">
                <input type="submit" value="회원 탈퇴">
            </div>
        </form>
        <div class="link-container">
            <a href="/HelloWorld/day06/member/manager/managerpage/managerpage.jsp">관리자페이지로 돌아가기</a>
        </div>
    </div>
</body>
</html>
