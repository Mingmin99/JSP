<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jsplec2.MemberDAO" %>
<%@ page import="com.jsplec2.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 승인</title>
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

        .message {
            text-align: center;
            margin-top: 20px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>회원 탈퇴 승인</h1>

    <%
        String memberId = request.getParameter("memberId");

        MemberDAO dao = new MemberDAO();
        MemberDTO member = dao.selectById(memberId);

        if (member != null && member.getStatus().equals("일시정지")) {
            int deleteResult = dao.deleteMember(memberId);

            if (deleteResult > 0) {
                %>
                <div class="message">
                    <script>alert('회원 탈퇴가 승인되었습니다.');</script>
                    <a href="/HelloWorld/day06/memberMain.jsp" class="button">돌아가기</a>
                </div>
                <%
            } else {
                %>
                <div class="message">
                    <script>alert('회원 탈퇴 승인에 실패하였습니다.');</script>
                    <a href="/HelloWorld/day06/memberMain.jsp" class="button">돌아가기</a>
                </div>
                <%
            }
        } else {
            %>
            <div class="message">
                <script>alert('일시정지 상태의 회원이 아닙니다.');</script>
                <a href="/HelloWorld/day06/memberMain.jsp" class="button">돌아가기</a>
            </div>
            <%
        }
    %>
</div>
</body>
</html>
