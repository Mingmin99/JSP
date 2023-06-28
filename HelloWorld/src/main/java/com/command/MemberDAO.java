package com.command;

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
//			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MemberDTO> memberAllSelect() {
	    ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();

	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String query = "SELECT * FROM member2";

	    try {
	        Class.forName(driver);
	        conn = DriverManager.getConnection(url, uid, upw);
	        pstmt = conn.prepareStatement(query);
	        rs = pstmt.executeQuery(); // rs 변수 초기화 추가

	        while (rs.next()) {
	            String name = rs.getString("name");
	            String id = rs.getString("id");
	            String pw = rs.getString("pw");
	            String email = rs.getString("email");
	            String phone = rs.getString("phone");
	            String status = rs.getString("status");
	            String user_permission = rs.getString("user_permission");

	            MemberDTO dto = new MemberDTO(name, id, pw, email, phone, status, user_permission);
	            dtos.add(dto);
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

	    return dtos;
	}

	public int memberInsert(MemberDTO memberDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int iResult = 0;

		String query = "INSERT INTO member2 (name, id, pw, email, phone, status, user_permission) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
//			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getId());
			pstmt.setString(3, memberDTO.getPw());
			pstmt.setString(4, memberDTO.getEmail());
			pstmt.setString(5, memberDTO.getPhone());
			pstmt.setString(6, memberDTO.getStatus());
			pstmt.setString(7, memberDTO.getUser_permission());
			iResult = pstmt.executeUpdate();

			if (iResult >= 1) {
				System.out.println("회원가입 성공");
			} else {
				System.out.println("회원가입 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
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
		return iResult;
	}

	public MemberDTO memberLogin(String loginId, String loginPw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO loginMemberDto = null;

		String query = "SELECT * FROM member2 WHERE id = ? AND pw = ?";

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
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String status = rs.getString("status");
				String user_permission = rs.getString("user_permission");

				loginMemberDto = new MemberDTO(name, id, pw, email, phone, status, user_permission);
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

	public MemberDTO selectById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO memberDto = null;

		String query = "SELECT * FROM member2 WHERE id = ?";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String status = rs.getString("status");
				String user_permission = rs.getString("user_permission");

				memberDto = new MemberDTO(name, id, pw, email, phone, status, user_permission);
				// Set other attributes as needed
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
		return memberDto;
	}

	public int userUpdate(MemberDTO memberDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int iResult = 0;

		String query = "UPDATE member2 SET name = ?, pw = ?, phone = ?, email = ? WHERE id = ?";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);

			System.out.println("1");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberDto.getName());
			pstmt.setString(2, memberDto.getPw());
			pstmt.setString(3, memberDto.getPhone());
			pstmt.setString(4, memberDto.getEmail());
			pstmt.setString(5, memberDto.getId()); // Assuming "id" is the unique identifier for the member

			iResult = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
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
		return iResult;
	}
	public ArrayList<MemberDTO> selectBeforeApprove() {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<MemberDTO> memberList = new ArrayList<>();

	    String query = "SELECT * FROM member2 WHERE status = '승인전'";

	    try {
	        Class.forName(driver);
	        conn = DriverManager.getConnection(url, uid, upw);
	        pstmt = conn.prepareStatement(query);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            String id = rs.getString("id");
	            String name = rs.getString("name");
	            String pw = rs.getString("pw");
	            String email = rs.getString("email");
	            String phone = rs.getString("phone");
	            String status = rs.getString("status");
	            String user_permission = rs.getString("user_permission");

	            MemberDTO memberDto = new MemberDTO(name, id, pw, email, phone, status, user_permission);
	            memberList.add(memberDto);
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
	    return memberList;
	}
	public ArrayList<MemberDTO> selectStop() {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<MemberDTO> memberList = new ArrayList<>();

	    String query = "SELECT * FROM member2 WHERE status = '일시정지'";

	    try {
	        Class.forName(driver);
	        conn = DriverManager.getConnection(url, uid, upw);
	        pstmt = conn.prepareStatement(query);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            String id = rs.getString("id");
	            String name = rs.getString("name");
	            String pw = rs.getString("pw");
	            String email = rs.getString("email");
	            String phone = rs.getString("phone");
	            String status = rs.getString("status");
	            String user_permission = rs.getString("user_permission");

	            MemberDTO memberDto = new MemberDTO(name, id, pw, email, phone, status, user_permission);
	            memberList.add(memberDto);
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
	    return memberList;
	}
	public int updateStatusToNormal(String memberId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    int iResult = 0;

	    String query = "UPDATE member2 SET status = '정상' WHERE id = ?";

	    try {
	        Class.forName(driver);
	        conn = DriverManager.getConnection(url, uid, upw);

	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, memberId);

	        iResult = pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
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
	    return iResult;
	}
	
	
	
	public int updateStatusToStop(String memberId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    int iResult = 0;

	    String query = "UPDATE member2 SET status = '일시정지' WHERE id = ?";

	    try {
	        Class.forName(driver);
	        conn = DriverManager.getConnection(url, uid, upw);

	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, memberId);

	        iResult = pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
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
	    return iResult;
	}
	public int deleteMember(String memberId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    int deleteResult = 0;

	    String query = "DELETE FROM member2 WHERE id = ? AND status = '일시정지'";

	    try {
	        Class.forName(driver);
	        conn = DriverManager.getConnection(url, uid, upw);

	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, memberId);

	        deleteResult = pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
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
	    return deleteResult;
	}




}