package com.uni.survey.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.dto.Member;
import com.uni.survey.model.dto.Survey_Reply;
import com.uni.survey.model.service.SurveyService;

/**
 * Servlet implementation class surveyRInsertServlet
 */
@WebServlet("/srinsert.do")
public class surveyRInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public surveyRInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		int sno = Integer.parseInt(request.getParameter("sno"));
		int writer = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Survey_Reply sr = new Survey_Reply();
		sr.setReplyContent(content);
		sr.setSurveyNo(sno);
		sr.setUserNo(writer);
		
		int result = new SurveyService().insertReply(sr);
		
		PrintWriter out = response.getWriter();
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
