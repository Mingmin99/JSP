<%@ page import="java.util.ArrayList" %>
<%@ page import="com.jsplec2.MemberDAO" %>
<%@ page import="com.jsplec2.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
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
        margin-top: 30px;
    }

    th, td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #dddddd;
    }

    th {
        background-color: #4CAF50;
        color: #ffffff;
    }

    .link-container {
        text-align: center;
        margin-top: 20px;
    }

    .link {
        display: inline-block;
        padding: 10px 20px;
        background-color: #4CAF50;
        color: #ffffff;
        text-decoration: none;
        border-radius: 4px;
        font-weight: bold;
    }

    .link:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<%
    MemberDAO dao = new MemberDAO();
    ArrayList<MemberDTO> memberList = dao.memberAllSelect();
%>

<div class="container">
    <h1>회원 조회</h1>

    <table>
        <tr>
            <th>이름</th>
            <th>아이디</th>
            <th>이메일</th>
            <th>전화번호</th>
            <th>상태</th>
            <th>사용자 권한</th>
        </tr>
        <% for (MemberDTO member : memberList) { %>
            <tr>
                <td><%= member.getName() %></td>
                <td><%= member.getId() %></td>
                <td><%= member.getEmail() %></td>
                <%
                    String phone = member.getPhone(); // 전화번호 가져오기
                    String encryptedPhone = "010" + /* phone.substring(4, 8) */ "-xxxx" + "-xxxx"; // 전화번호 암호화
                %>
                <td><%= encryptedPhone %></td>
                <td><%= member.getStatus() %></td>
                <td><%= member.getUser_permission() %></td>
            </tr>
        <% } %>
    </table>
    <div class="link-container">
        <a href="/HelloWorld/day06/member/manager/modify/modify.jsp" class="link">회원 수정</a>
        <br/>
		<br/>
		<a href="/HelloWorld/day06/member/manager/managerpage/managerpage.jsp"> 관리자페이지로 돌아가기</a>
    </div>
</div>

</body>
</html>
