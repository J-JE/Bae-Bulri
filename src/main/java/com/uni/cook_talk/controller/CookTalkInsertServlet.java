package com.uni.cook_talk.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.cook_talk.model.dto.Cook_Talk;
import com.uni.cook_talk.model.service.CookTalkService;
import com.uni.member.model.dto.Member;

/**
 * Servlet implementation class CookTalkInsertServlet
 */
@WebServlet("/insertCookTalk.do")
public class CookTalkInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookTalkInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ckTitle = request.getParameter("ckTitle");
		String ckContent = request.getParameter("ckContent");
		
		 int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
	
		Cook_Talk c = new Cook_Talk(ckTitle,ckContent,userNo);
		
		int result = new CookTalkService().insertCookTalk(c);
		
		 if(result>0) {
			 request.getSession().setAttribute("msg", "게시물이 등록되었습니다");
			 response.sendRedirect("cookTalkList.do");
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
