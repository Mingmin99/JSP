package com.command;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Service {
	  ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response);
}

