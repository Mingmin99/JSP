package com.board.controller;

import java.util.ArrayList;

import com.board.model.PostDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface PostService {
   public  ArrayList<PostDTO> getalllist(HttpServletRequest request, HttpServletResponse response);

   public void insertpost(HttpServletRequest request, HttpServletResponse response);
}
