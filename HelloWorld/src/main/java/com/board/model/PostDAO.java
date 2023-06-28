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
	            Timestamp writeDate = rs.getTimestamp("WRITE_DATE");
	            int views = rs.getInt("views");
	            int category = rs.getInt("category");
	            int levelNum = rs.getInt("level_Num");
	            int blank = rs.getInt("blank");

	            PostDTO dto = new PostDTO(id, writer, title, content, writeDate, views, category, levelNum, blank);
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

			String query = "INSERT INTO MVC_BOARD (WRITER, TITLE, CONTENT) VALUES (?, ?, ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, post.getWriter());
			pstmt.setString(2, post.getTitle());
			pstmt.setString(3, post.getContent());

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

//게시글 조회 getPostById

//게시글 수정 updatePost

//게시글 삭제 deletePost

//조회수 업데이트 updateViews

}
