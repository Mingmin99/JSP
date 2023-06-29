package com.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import java.util.ArrayList;

import com.board.model.PostDTO;
import com.command.MemberAllService;
import com.command.MemberDTO;
import com.command.Service;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("*.do")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostServlet() {
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

		if (command.equals("/day07/board/view/GetAllList.do")) {
			// GetAllList 인스턴스 생성
			PostService GetAllList = new GetAllList();

			// MemberAllService의 execute 메서드 호출하여 회원 목록 가져오기
			ArrayList<PostDTO> getalllist = GetAllList.getalllist(request, response);

			for (PostDTO all : getalllist) {
				System.out.println(all.getId() + " " + all.getWriter() + " " + all.getTitle() + " " + all.getContent()
						+ " " + all.getWriteDate() + " " + all.getViews() + " " + all.getCategory() + " "
						+ all.getLevelNum() + " " + all.getBlank());
			}

			// 가져온 회원 목록을 request에 저장
			request.setAttribute("getalllist", getalllist);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/day07/board/view/getAllList.jsp");
			dispatcher.forward(request, response);
		}

		// insert 게시글 등록
		else if (command.equals("/day07/board/view/Insert.do")) {
			// GetAllList 인스턴스 생성
			// 서비스 뭘로 할거야 정하는 것
			PostService insertPost = new InsertPost();

			// insertPost 서비스의 insertpost 메서드 호출하여 글 등록하기
			insertPost.insertpost(request, response);
			response.sendRedirect("GetAllList.do");

		} else if (command.equals("/day07/board/view/detail.do")) {
			System.out.println("상세보기 메소드 실행");
			PostService detailpost = new DetailPost();
			PostDTO post = detailpost.selectpostbyid(request, response);

			// JSP 파일로 전달할 데이터 설정
			request.setAttribute("post", post);

			System.out.println(post.getWriter());

			// 포워딩
			RequestDispatcher reqDpt = request.getRequestDispatcher("/day07/board/view/detailPost1.jsp");
			reqDpt.forward(request, response);
//	            response.sendRedirect("detailPost.jsp");

		} else if (command.equals("/day07/board/view/update.do")) {
			System.out.println("수정메소드 실행");

			PostService update = new UpdatePost();
			update.updatepost(request, response);
			response.sendRedirect("GetAllList.do");

		} else if (command.equals("/day07/board/view/delete.do")) {
			System.out.println("삭제 메소드 실행");

			PostService delete = new DeletePost();
			delete.deletepost(request, response);
			response.sendRedirect("GetAllList.do");

		}

		else if (command.equals("/day07/board/view/reply.do")) {
			System.out.println("답글 등록 메소드 실행");

			PostService reply = new ReplyPost();
			reply.replypost(request, response);
			response.sendRedirect("GetAllList.do");

		}

		else {
			System.out.println("연결 실패");
		}

	}

}