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
 * Servlet implementation class LikeyClickServlet
 */
@WebServlet("/likeyClick.do")
public class LikeyClickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeyClickServlet() {
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
		
		int result = new LikeyService_jje().checkLikey(likey); //찜하기 되어있는 레시피인지 확인
		
		PrintWriter out = response.getWriter();
		if(result > 0) { //찜 되어있다면
			out.print("Already Likey");
		}else { //찜 되어있지 않다면
			out.print("Not Yet Likey");
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
