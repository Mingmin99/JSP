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
	<h1>회원정보 수정 성공</h1>
	<%
	/*     String id = (String) session.getAttribute("loginId"); */
// modifyOk.jsp

String name = request.getParameter("name");
String pw = request.getParameter("pw");
String phone = request.getParameter("phone");
String email = request.getParameter("email");

MemberDTO dto = (MemberDTO) session.getAttribute("loginId");
if (dto != null) {
    dto.setName(name);
    dto.setPw(pw);
    dto.setPhone(phone);
    dto.setEmail(email);

    MemberDAO dao = new MemberDAO();
    int iResult = dao.userUpdate(dto);

    if (iResult >= 1) {
        out.println(dto.getName() + "님의 회원정보가 수정되었습니다.");
        out.println("<script>alert('회원 정보 업데이트가 완료되었습니다'); window.location.href='/HelloWorld/day06/member/user/mypage/mypage.jsp';</script>");

        /* response.sendRedirect("/HelloWorld/day06/member/user/mypage/mypage.jsp"); */
    } else {
        out.println(dto.getName() + "님의 회원정보가 수정에 실패하였습니다.");
        out.println("<script>alert('회원 정보 업데이트에 실패했습니다.'); history.back();</script>");
       /*  response.sendRedirect("/HelloWorld/day06/member/user/modify/modify.jsp"); */
    }
} else {
    // 세션에 "loginId" 속성이 존재하지 않는 경우 처리
    out.println("로그인 정보를 찾을 수 없습니다.");
}

	%>	
	
</body>

</html>