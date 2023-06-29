package com.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PostDAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:dink20";
	private String uid = "C##scott";
	private String upw = "tiger";
	private DataSource ds;

	public PostDAO() {
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

	public ArrayList<PostDTO> getAllList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<PostDTO> dtos = new ArrayList<PostDTO>();

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);

			String query = "SELECT * FROM MVC_BOARD";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp write_Date = rs.getTimestamp("write_Date");
				int views = rs.getInt("views");
				int category = rs.getInt("category");
				int levelNum = rs.getInt("level_Num");
				int blank = rs.getInt("blank");

				PostDTO dto = new PostDTO(id, writer, title, content, write_Date, views, category, levelNum, blank);
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

//게시글 작성 createPost
	public void InsertPost(PostDTO post) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);

			String query = "INSERT INTO MVC_BOARD (WRITER, TITLE, CONTENT, category) VALUES (?, ?, ?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, post.getWriter());
			pstmt.setString(2, post.getTitle());
			pstmt.setString(3, post.getContent());
			pstmt.setInt(4, post.getCategory());

			int iResult = pstmt.executeUpdate();

			if (iResult > 0) {
				System.out.println("게시글이 성공적으로 생성되었습니다.");
			} else {
				System.out.println("게시글 생성에 실패하였습니다.");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	// 상세보기 및 조회수 업데이트
	public PostDTO selectPostbyId(int id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PostDTO dto = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			String query = "SELECT * FROM MVC_BOARD WHERE id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp write_Date = rs.getTimestamp("write_Date");
				int views = rs.getInt("views") + 1;
				int category = rs.getInt("category");
				int levelNum = rs.getInt("level_Num");
				int blank = rs.getInt("blank");

				dto = new PostDTO(id, writer, title, content, write_Date, views, category, levelNum, blank);

				String query1 = "UPDATE MVC_BOARD SET VIEWS =? WHERE ID = ? ";
				pstmt = conn.prepareStatement(query1);
				pstmt.setInt(1, dto.getViews());
				pstmt.setInt(2, id);
				pstmt.executeUpdate();

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

		// sysout 추가
		System.out.println("Selected post: " + dto);

		return dto;
	}

	public int updatePost(int id, PostDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int iResult = 0;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			String query = "UPDATE MVC_BOARD SET writer = ?, title = ?, content = ?, write_Date = ? WHERE id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(5, id);

			System.out.println(id);
			iResult = pstmt.executeUpdate();

			if (iResult > 0) {
				System.out.println("Update successful. Rows affected: " + iResult);
			} else {
				System.out.println("Update failed. No rows affected.");
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

//게시글 삭제 deletePost
//	public int deletePost(int id) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs;
//		int iResult = 0;
//
//		try {
//			Class.forName(driver);
//			conn = DriverManager.getConnection(url, uid, upw);
//			String query = "DELETE FROM MVC_BOARD WHERE ID = ?";
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, id);
//			iResult = pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//
//		} finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return iResult;
//	}
	public int deletePost(String[] ids) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		int iResult = 0;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			String query = "DELETE FROM MVC_BOARD WHERE ID = ?";
			pstmt = conn.prepareStatement(query);
			
			for(String id : ids) {
				int convertedId = Integer.parseInt(id);
				pstmt.setInt(1, convertedId);
				iResult = pstmt.executeUpdate();
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

//그룹 설정해주기 
	public int setCategory() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		int num = 1;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			String query = "SELECT MAX(ID) FROM MVC_BOARD";
			pstmt = conn.prepareStatement(query);

			rs = pstmt.executeQuery();
			rs.next();
			num = rs.getInt(1) + 1;

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
		return num;

	}

	public void replyPost(int originalPostId, PostDTO replydto) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        Class.forName(driver);
	        conn = DriverManager.getConnection(url, uid, upw);

	        // 원글 조회
	        String originalPostQuery = "SELECT CATEGORY, LEVEL_NUM FROM MVC_BOARD WHERE ID = ?";
	        pstmt = conn.prepareStatement(originalPostQuery);
	        pstmt.setInt(1, originalPostId);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            int originalCategory = rs.getInt("CATEGORY");
	            int originalLevel = rs.getInt("LEVEL_NUM");

	            // 답글 작성
	            String replyQuery = "INSERT INTO MVC_BOARD (WRITER, TITLE, CONTENT, CATEGORY, LEVEL_NUM) VALUES (?, ?, ?, ?, ?)";
	            pstmt = conn.prepareStatement(replyQuery);
	            pstmt.setString(1, replydto.getWriter());

	            // 제목에 레벨만큼 "-" 기호 추가
	            String replyTitle = "-".repeat(originalLevel) + " " + replydto.getTitle();
	            pstmt.setString(2, replyTitle);

	            pstmt.setString(3, replydto.getContent());
	            pstmt.setInt(4, originalCategory);
	            pstmt.setInt(5, originalLevel + 1);

	            int iResult = pstmt.executeUpdate();

	            if (iResult > 0) {
	                System.out.println("답글이 성공적으로 생성되었습니다.");
	            } else {
	                System.out.println("답글 생성에 실패하였습니다.");
	            }
	        } else {
	            System.out.println("원글을 찾을 수 없습니다.");
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (pstmt != null) {
	                pstmt.close();
	            }
	            if (conn != null) {
	                conn.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}

}
