package com.command;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberAllServlet
 */
//@WebServlet("*.do")
public class MemberAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    System.out.println("actionDo");
	    String uri = request.getRequestURI();
	    System.out.println("uri : " + uri);

	    String conPath = request.getContextPath();
	    System.out.println("conPath : " + conPath);

	    String command = uri.substring(conPath.length());
	    System.out.println("command : " + command);

	    if (command.equals("/day07/command/memberAllService.do")) {
	        // MemberAllService 인스턴스 생성
	        Service memberAllService = new MemberAllService();

	        // MemberAllService의 execute 메서드 호출하여 회원 목록 가져오기
	        ArrayList<MemberDTO> memberList = memberAllService.execute(request, response);

	        for (MemberDTO member : memberList) {
	            System.out.println(
	                    member.getId() + " " + member.getName() + " " + member.getPw() + " " + member.getPhone() + " "
	                            + member.getEmail() + " " + member.getStatus() + " " + member.getUser_permission());
	        }

	        // 가져온 회원 목록을 request에 저장
	        request.setAttribute("memberList", memberList);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("/day07/command/memberList.jsp");
	        dispatcher.forward(request, response);
	    } else {
	        // 오류 처리
	        response.getWriter().println("연결 실패");
	    }
	}


}