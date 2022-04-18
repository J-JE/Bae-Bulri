package com.uni.cook_talk.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.cook_talk.model.service.CookTalkService;

/**
 * Servlet implementation class CookTalkUpdateServlet
 */
@WebServlet("/upDateCookTalk.do")
public class CookTalkUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookTalkUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		String ckTitle = request.getParameter("ckTitle");
		String ckContent = request.getParameter("ckContent").replace("\n", "<br>");
		
		int result = new CookTalkService().updateCookTalk(cno,ckTitle,ckContent);//서비스로 세개 보내줌

		
		if(result > 0) {
			request.setAttribute("msg", "수정이 완료되었습니다");
			response.sendRedirect("detailCookTalk.do?cno="+cno);
		}else {
			request.setAttribute("msg","조회 실패");
			
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
