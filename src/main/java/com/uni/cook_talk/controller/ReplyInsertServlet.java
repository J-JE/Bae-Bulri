
package com.uni.cook_talk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.cook_talk.model.dto.Cook_Talk_Reply;
import com.uni.cook_talk.model.service.CookTalkService;
import com.uni.member.model.dto.Member;

/**
 * Servlet implementation class ReplyInsertServlet
 */
@WebServlet("/reinsert.do")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		int cid = Integer.parseInt(request.getParameter("cid"));
		int user = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Cook_Talk_Reply r = new Cook_Talk_Reply();
		r.setCtRContent(content);
		r.setBoardNo(cid);
		r.setUserNo(user);
		
		int result = new CookTalkService().insertReply(r);
		System.out.println("서블릿"+result);
		System.out.println("서블릿"+content);
		System.out.println("서블릿"+cid);
		System.out.println("서블릿"+user);
		PrintWriter out  = response.getWriter();
		if(result > 0) {
			out.print("success");
		}else {
			out.print("fail");
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
