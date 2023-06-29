package com.board.controller;

import java.util.ArrayList;

import com.board.model.PostDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface PostService {
	public ArrayList<PostDTO> getalllist(HttpServletRequest request, HttpServletResponse response);

	public void insertpost(HttpServletRequest request, HttpServletResponse response);

	public PostDTO selectpostbyid(HttpServletRequest request, HttpServletResponse response);

	public int updatepost(HttpServletRequest request, HttpServletResponse response);

	public int deletepost(HttpServletRequest request, HttpServletResponse response);
	
	public void replypost(HttpServletRequest request, HttpServletResponse response);
}
