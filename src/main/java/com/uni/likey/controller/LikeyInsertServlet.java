package com.uni.likey.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.likey.model.dto.Likey;
import com.uni.likey.model.service.LikeyService_jje;
import com.uni.member.model.dto.Member;

/**
 * Servlet implementation class LikeyInsertServlet
 */
@WebServlet("/likeyInsert.do")
public class LikeyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int writer = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int rId = Integer.parseInt(request.getParameter("rId"));
		
		Likey likey = new Likey();
		likey.setUserNo(writer);
		likey.setRecipeNo(rId);
		System.out.println("rId"+rId);
		
		int result = new LikeyService_jje().insertLikey(likey);
		
		PrintWriter out = response.getWriter();
		if(result > 0) { //찜 성공했으면
			out.print("success");
		}else { //찜 실패앴으면
			out.print("failed");
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
