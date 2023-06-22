package com.member.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class LoginOk
 */
@WebServlet("/member/login/LoginOk")
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String name, loginid, loginpw, phone1, phone2, phone3, gender;
	private String query;
	private Connection conn;
	private Statement stmt;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginOk() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
		checkLogin(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");
		checkLogin(request, response);
	}

	private void checkLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		loginid = request.getParameter("id");
		loginpw = request.getParameter("pw");

		query = "select * from member ";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:dink20", "C##scott", "tiger");
			stmt = conn.createStatement();
			ResultSet rs = null;

			while (rs.next()) {

				String id = rs.getString("id");
				String pw = rs.getString("pw");
				if (loginid.equals(id) && loginpw.equals("pw")) {
					System.out.println("로그인 성공");
					response.sendRedirect("joinResult.jsp");
				} else {
					System.out.println("로그인 실패");
					response.sendRedirect("login.html");
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("join.html");
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
}
