<%@ page import="com.jsplec2.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String memberId = request.getParameter("memberId");

    MemberDAO dao = new MemberDAO();
    int result = dao.updateStatusToNormal(memberId);

    if (result > 0) {
        out.println("<script>alert('회원 승인이 완료되었습니다.'); location.href='/HelloWorld/day06/member/manager/approve/signApprove.jsp';</script>");
    } else {
        out.println("<script>alert('회원 승인에 실패하였습니다.');  location.href='/HelloWorld/day06/member/manager/approve/signApprove.jsp';</script>");
        
    }
%>
