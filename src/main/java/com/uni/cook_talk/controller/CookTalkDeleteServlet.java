package com.uni.cook_talk.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.cook_talk.model.service.CookTalkService;

/**
 * Servlet implementation class CookTalkDeleteServlet
 */
@WebServlet("/deleteBoard.do")
public class CookTalkDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookTalkDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		int result = new CookTalkService().deleteCookTalk(cno);	
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "삭제가 성공하였습니다");
			response.sendRedirect("cookTalkList.do");
		}else {
			request.setAttribute("msg","삭제가 실패하였습니다");
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
