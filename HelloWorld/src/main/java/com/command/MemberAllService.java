package com.command;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class MemberAllService implements Service {

    @Override
    public ArrayList<MemberDTO> execute(HttpServletRequest request, HttpServletResponse response) { 
        MemberDAO mDao = new MemberDAO();
        return mDao.memberAllSelect();
    }

}
