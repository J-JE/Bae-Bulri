package com.uni.cook_talk.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.cook_talk.model.dto.Cook_Talk;
import com.uni.cook_talk.model.service.CookTalkService;

/**
 * Servlet implementation class CookTalkDetailServlet
 */
@WebServlet("/detailCookTalk.do")
public class CookTalkDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookTalkDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		Cook_Talk cookTalk = new CookTalkService().selectCookTalk(cno);	
		request.getRequestDispatcher("views/cook_talk/cookTalkDetail.jsp").forward(request, response);
		request.setAttribute("c", cookTalk);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
