package com.uni.survey.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.common.Attachment;
import com.uni.survey.model.dto.Survey;
import com.uni.survey.model.service.SurveyService;

/**
 * Servlet implementation class surveyDetailServlet
 */
@WebServlet("/detailsurvey.do")
public class surveyDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public surveyDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		Survey s = new SurveyService().selectSurvey(nno);
		Attachment at = new SurveyService().selectAttachment(nno);
		
		if(s != null) {
			request.setAttribute("s", s);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/survey/surveyForm.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "게시글 상세조회 실패하였습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
