package com.uni.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.dto.Member;
import com.uni.member.model.service.MemberService_th;

/**
 * Servlet implementation class myLikeyDeleteServlet
 */
@WebServlet("/deleteLikey.do")
public class myLikeyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myLikeyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rno = Integer.parseInt(request.getParameter("rno"));
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		System.out.println("=====rno"+rno);
		int result = new MemberService_th().deleteLikey(rno,userNo);
		System.out.println(result);
		System.out.println("rno" + rno);
		System.out.println("userNo" + userNo);
		if(result > 0) {
			response.sendRedirect("myLikeyList.do");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
