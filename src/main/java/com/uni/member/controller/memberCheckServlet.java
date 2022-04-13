package com.uni.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.uni.member.model.dto.Member;
import com.uni.member.model.service.MemberService_gm;

/**
 * Servlet implementation class memberCheckServlet
 */
@WebServlet("/checkmember.do")
public class memberCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String arr[] = request.getParameterValues("selected");
		
		String userid = "";
		if(arr != null) {
			userid = String.join("\',\'", arr);
		}
		System.out.println(userid);
		int result = new MemberService_gm().deleteMember(userid);
		
		if(result > 0) {
			request.setAttribute("msg", "삭제가 완료되었습니다.");
			response.sendRedirect(request.getContextPath()); 
		}else {
			request.setAttribute("msg", "회원탈퇴에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
