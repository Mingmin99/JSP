package com.board.controller;

import java.util.ArrayList;

import com.board.model.PostDAO;
import com.board.model.PostDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeletePost implements PostService {

	@Override
	public ArrayList<PostDTO> getalllist(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertpost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	@Override
	public PostDTO selectpostbyid(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatepost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletepost(HttpServletRequest request, HttpServletResponse response) {
		String[] selectedIds = request.getParameterValues("postIds");
		PostDAO dao = new PostDAO();
		return dao.deletePost(selectedIds);
	}

	@Override
	public void replypost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
}