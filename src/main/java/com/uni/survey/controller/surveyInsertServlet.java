package com.uni.survey.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.uni.common.Attachment;
import com.uni.common.MyFileRenamePolicy;
import com.uni.survey.model.dto.Survey;
import com.uni.survey.model.service.SurveyService;

/**
 * Servlet implementation class surveyInsertServlet
 */
@WebServlet("/insertsurvey.do")
public class surveyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public surveyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 if(ServletFileUpload.isMultipartContent(request)) { //멀티파트로 넘어옴
	           int maxSize = 10 * 1024 * 1024;
	           
	           String resources = request.getSession().getServletContext().getRealPath("/resources/images");

	           String savePath = resources + "\\survey\\";
	           
	           System.out.println("savePath : "+ savePath);
	           
	           MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	           
	           Survey s = new Survey();
	           String title = multiRequest.getParameter("title");
	           String content = multiRequest.getParameter("content");
	           
	           s.setSurveyTitle(title);
	           s.setSurveyContent(content);
	          
	           Attachment at= null;
	           if(multiRequest.getOriginalFileName("upfile") != null) {
					String originName = multiRequest.getOriginalFileName("upfile");
					String changeName = multiRequest.getFilesystemName("upfile");
					
					System.out.println("originName : " + originName);
					System.out.println("changeName : " + changeName);
					
					at = new Attachment();
					at.setFilePath(savePath);
					at.setOriginName(originName);
					at.setChangeName(changeName);
	           }
	           int result = new SurveyService().insertSurvey(s,at);
	           if(result > 0) {
					request.getSession().setAttribute("msg", "게시글이 성공적으로 등록되었습니다");
					response.sendRedirect("surveyList.do");
				}else {
					if(at != null) {
						File failedFile = new File(savePath+ at.getChangeName());
						failedFile.delete();
					}
					request.setAttribute("msg", "게시글 등록 실패하였습니다");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					
				}
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
