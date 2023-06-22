package com.day2;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex01
 */
//@WebServlet(urlPatterns = { "/Ex02" }, initParams = { @WebInitParam(name = "dbID", value = "abcde") })

@WebServlet( "/Ex01")

public class Ex01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Ex01() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");

		String dbId = getServletContext().getInitParameter("dbID");
		String dbPwd = getServletContext().getInitParameter("dbPwd");
		String dbSid = getServletContext().getInitParameter("dbSid");
		String testId = getServletContext().getInitParameter("testId");

//		response.getWriter().append("Served at: ").append(request.getContextPath());

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();

		pw.write("<html>");
		pw.write("<head>");
		pw.write("</head>");
		pw.write("<body>");
		pw.write("dbId :" + dbId + "<br/>");
		pw.write("dbPwd : " + dbPwd + "<br/>");
		pw.write("dbSid : " + dbSid + "<br/>");
		pw.write("testId : " + testId + "<br/>");
		pw.write("</body>");
		pw.write("</html>");
		pw.close();

	}
	  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
