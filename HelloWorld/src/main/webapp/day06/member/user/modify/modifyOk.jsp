<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="com.jsplec2.MemberDAO"%>
<%@page import="com.jsplec2.MemberDTO"%>
<%@ page import="java.util.regex.Pattern" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정 성공</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String pw = request.getParameter("pw");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");

    MemberDTO dto = (MemberDTO) session.getAttribute("loginId");
    if (dto != null) {
        // Password validation using regular expression pattern
        boolean isValidPassword =Pattern.matches("^(?=.*[a-zA-Z])(?=.*[0-9]).{4,}$", pw);

        if (!isValidPassword) {
%>
            <script>
                alert('비밀번호는 최소 4자리 이상이어야 하며, 영문과 숫자로 구성되어야 합니다.');
                window.location.href = '/HelloWorld/day06/member/user/modify/modify.jsp';
            </script>
<%
            return;
        }

        dto.setName(name);
        dto.setPw(pw);
        dto.setPhone(phone);
        dto.setEmail(email);

        MemberDAO dao = new MemberDAO();
        int iResult = dao.userUpdate(dto);

        if (iResult >= 1) {
            out.println(dto.getName() + "님의 회원정보가 수정되었습니다.");
            out.println("<script>alert('회원 정보 업데이트가 완료되었습니다'); window.location.href='/HelloWorld/day06/member/user/mypage/mypage.jsp';</script>");
        } else {
            out.println(dto.getName() + "님의 회원정보가 수정에 실패하였습니다.");
            out.println("<script>alert('회원 정보 업데이트에 실패했습니다.'); history.back();</script>");
        }
    } else {
        // 세션에 "loginId" 속성이 존재하지 않는 경우 처리
        out.println("로그인 정보를 찾을 수 없습니다.");
    }
%>    
    
</body>
</html>
