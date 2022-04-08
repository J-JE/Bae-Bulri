package com.uni.cook_talk.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.cook_talk.model.dto.Cook_Talk;
import com.uni.cook_talk.model.service.CookTalkService;

/**
 * Servlet implementation class CookTalkUpdateFormServlet
 */
@WebServlet("/upDateFormBoard.do")
public class CookTalkUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookTalkUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		Cook_Talk ckForm = new CookTalkService().selectCookTalk(cno);
		request.setAttribute("cookTalk", ckForm);
		RequestDispatcher view = request.getRequestDispatcher("/views/cook_talk/cookTalkUpdate.jsp");
	    view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
