package com.uni.store.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.uni.common.Attachment;
import com.uni.common.MyFileRenamePolicy;
import com.uni.member.model.dto.Member;
import com.uni.store.model.dto.Store;
import com.uni.store.model.service.StoreService;

/**
 * Servlet implementation class StoreInsertServlet
 */
@WebServlet("/insertStore.do")
public class StoreInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param category 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response, int category) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String resources = request.getSession().getServletContext().getRealPath("/resources/images");
			
			String savePath = resources + "\\store\\";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath , maxSize , "UTF-8", new MyFileRenamePolicy());
			
			String title = multiRequest.getParameter("title");
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			int stock = Integer.parseInt(multiRequest.getParameter("stock"));
					 
			Store s = new Store();//스토어 등록
			s.setProductName(title);
			s.setPrice(price);
			s.setStock(stock);
			
			Attachment at = null;
	           if(multiRequest.getOriginalFileName("upfile") != null) {
	              String originName = multiRequest.getOriginalFileName("upfile");
	              String changeName = multiRequest.getFilesystemName("upfile");//바뀐 파일 이름
	              
	              
	              at = new Attachment();
	            
	              at.setFilePath(savePath);
	              at.setOriginName(originName);
	              at.setChangeName(changeName);
	           }
	           int result = new StoreService().insertStore(s,at);
	           
	           if(result > 0) {//등록 성공시
	              request.getSession().setAttribute("msg", "제품 등록 성공");
	              response.sendRedirect("storeList.do");
	           }else {
	              if(at != null) {//첨부파일이 null이 아니면
	                 File failedFile = new File(savePath + at.getChangeName());
	                 failedFile.delete();//파일을 지워줌
	              }
	              request.setAttribute("msg", "제품 등록 실패");
	              request.getRequestDispatcher("views/commom/errorPage.jsp").forward(request, response);

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
