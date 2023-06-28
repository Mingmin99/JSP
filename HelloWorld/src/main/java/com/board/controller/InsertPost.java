package com.board.controller;

import java.util.ArrayList;

import com.board.model.PostDAO;
import com.board.model.PostDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertPost implements PostService {

	@Override
	public ArrayList<PostDTO> getalllist(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertpost(HttpServletRequest request, HttpServletResponse response) {
		PostDAO dao = new PostDAO();

		PostDTO dto = new PostDTO(request.getParameter("writer"), request.getParameter("title"),
				request.getParameter("content"));

		// PostDTO 객체를 DAO를 이용하여 데이터베이스에 등록
		dao.InsertPost(dto);
	}

}
