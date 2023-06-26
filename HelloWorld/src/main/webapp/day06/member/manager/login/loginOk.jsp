<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.jsplec2.MemberDAO"%>
<%@page import="com.jsplec2.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 성공</h2>
	<%
	 String id = request.getParameter("id");
    String password = request.getParameter("pw");
    
    MemberDAO dao = new MemberDAO();
    
    MemberDTO dto = dao.selectById(id);
    
    if (dto != null) {
    	out.println("5");
    	if (password.equals(dto.getPw())) {
    		
            // 회원 상태가 "정상"이고 사용자 역할이 "일반사용자"인 경우에만 로그인 허용
            if (dto.getStatus().equals("정상") && dto.getUser_permission().equals("관리자")) {
            	
                // 로그인 성공
                session.setAttribute("loginId", dto);
                out.println("<script>alert('로그인 성공'); window.location.href='/HelloWorld/day06/member/manager/managerpage/managerpage.jsp';</script>");
            } else {
            	
                // 회원 상태가 "정상"이 아니거나 사용자 역할이 "일반사용자"가 아닌 경우
                out.println("<script>alert('회원 가입 승인 전 또는 일시 정지 상태입니다.'); history.back();</script>");
            }
        } else {
            // 비밀번호가 일치하지 않음
            out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
        }
    } else {
        // 사용자가 존재하지 않음
        out.println("<script>alert('존재하지 않는 사용자입니다.'); history.back();</script>");
    }
%>
</body>
</html>