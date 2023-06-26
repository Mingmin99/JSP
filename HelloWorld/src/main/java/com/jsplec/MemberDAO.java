package com.jsplec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:dink20";
	private String uid = "C##scott";
	private String upw = "tiger";

	private DataSource ds;

	public MemberDAO() {
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//		} catch(Exception e) {
//			e.printStackTrace();
//		}

		/*
		 * JNDI(Java Naming and Directory Interface) 웹 애플리케이션 실행 시 톰캣이 만들어 놓은
		 * ConnectionPool 객체에 접근할 때는 JNDI를 이용한다. JNDI에 설정해 놓았다는 것은 Context.xml에 Resouce를
		 * 생성해 놓은 것을 말한다.
		 */
		try {
			Context ctx = new InitialContext();
			// ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MemberDTO> memberSelect() {
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
//			conn = DriverManager.getConnection(url, uid, upw);
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from member");

			while (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");

				MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
				dtos.add(dto);
			}
		} catch (Exception e) {

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return dtos;
	}

	public int memberInsert(MemberDTO memberDTO) {
		System.out.println(memberDTO.getGender());

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int iResult = 0;

		String query = "Insert into member(name, id, pw, phone1, phone2,phone3, gender) values(?, ?, ? ,? ,?,?,?)";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
//			conn = ds.getConnection();
			String name = memberDTO.getName();
			String id = memberDTO.getId();
			String pw = memberDTO.getPw();
			String phone1 = memberDTO.getPhone1();
			String phone2 = memberDTO.getPhone2();
			String phone3 = memberDTO.getPhone3();
			String gender = memberDTO.getGender();

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			pstmt.setString(4, phone1);
			pstmt.setString(5, phone2);
			pstmt.setString(6, phone3);
			pstmt.setString(7, gender);
			iResult = pstmt.executeUpdate();

			if (iResult >= 1) {
				System.out.println("회원가입 성공");
			} else {
				System.out.println("회원가입 실패");
			}

		} catch (Exception e) {

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return iResult;

	}

	public MemberDTO memberLogin(String loginId, String loginPw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO loginMemberDto = null;

		String query = "select * from member where id = ? and pw = ?";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginId);
			pstmt.setString(2, loginPw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");

				loginMemberDto = new MemberDTO(id, pw, name, phone1, phone2, phone3, gender);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return loginMemberDto;
	}

	// 업데이트
	public void memberUpdate(MemberDTO memberDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "UPDATE member SET name = ?, pw = ?, phone1 = ?, phone2 = ?, phone3 = ?, gender = ? WHERE id = ?";
		System.out.println("a");
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberDto.getName());
			pstmt.setString(2, memberDto.getPw());
			pstmt.setString(3, memberDto.getPhone1());
			pstmt.setString(4, memberDto.getPhone2());
			pstmt.setString(5, memberDto.getPhone3());
			pstmt.setString(6, memberDto.getGender());
			pstmt.setString(7, memberDto.getId());
			
			System.out.println(memberDto.getName());
			System.out.println(memberDto.getPw());
			System.out.println(memberDto.getPhone1());
			System.out.println(memberDto.getPhone2());
			System.out.println(memberDto.getPhone3());
			System.out.println(memberDto.getGender());
			System.out.println(memberDto.getId());
			pstmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
