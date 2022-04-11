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
 * Servlet implementation class LiketDeleteServlet
 */
@WebServlet("/likeyDelete.do")
public class LiketDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LiketDeleteServlet() {
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
		
		int result = new LikeyService_jje().deletetLikey(likey);
		
		PrintWriter out = response.getWriter();
		if(result > 0) { //찜 삭제 되어있다면
			out.print("success");
		}else { //찜 삭제 실패했다면
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
