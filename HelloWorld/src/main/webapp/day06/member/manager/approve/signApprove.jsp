<%@ page import="java.util.ArrayList" %>
<%@ page import="com.jsplec2.MemberDAO" %>
<%@ page import="com.jsplec2.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인 전 회원 목록</title>
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

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #4CAF50;
        text-decoration: none;
    }
</style>
</head>
<body>

<div class="container">
    <h1>승인 전 회원 목록</h1>

    <table>
        <thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>비밀번호</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>상태</th>
                <th>사용 권한</th>
                <th>승인</th>
            </tr>
        </thead>
        <tbody>
            <% 
                MemberDAO dao = new MemberDAO();
                ArrayList<MemberDTO> memberList = dao.selectBeforeApprove();

                for (MemberDTO member : memberList) {
                    String phone = member.getPhone();
                    String formattedPhone = "010" + /* phone.substring(4, 8) */ "-xxxx" + "-xxxx"; // 전화번호 암호화
                    %>
            %>
            <tr>
                <td><%= member.getId() %></td>
                <td><%= member.getName() %></td>
                <td><%= member.getPw() %></td>
                <td><%= member.getEmail() %></td>
                <td><%= formattedPhone %></td>
                <td><%= member.getStatus() %></td>
                <td><%= member.getUser_permission() %></td>
                <td><a href="/HelloWorld/day06/member/manager/approve/signApproveOk.jsp?memberId=<%= member.getId() %>">승인</a></td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <a href="/HelloWorld/day06/member/manager/select/selectAll.jsp" class="back-link">전체 회원 목록으로 돌아가기</a>
</div>

</body>
</html>
