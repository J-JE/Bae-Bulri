package com.uni.recipe.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.uni.common.Attachment;
import com.uni.common.MyFileRenamePolicy;
import com.uni.recipe.model.service.RecipeServiceJw;

/**
 * Servlet implementation class RecipeInsertServlet
 */
@WebServlet("/insertRecipe.do")
public class RecipeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maxSize = 10 * 1024 * 1024; // 아직 전송 파일 용량 부분 얘기 안되어있어서 임시값임
		
		String uploadPath = request.getServletContext().getRealPath("/resources");
		
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		String category = multi.getParameter("category");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		
		/* recipe DTO가 없어서 일단 비워둠*/
		
		Attachment at = null;
		
		if(multi.getOriginalFileName("upfile") != null) {
			String originName = multi.getOriginalFileName("upfile");
			String changeName = multi.getFilesystemName("upfile");
			
			at = new Attachment();
			at.setFilePath(uploadPath);
			at.setOriginName(originName);
			at.setChangeName(changeName);
			
			// 마찬가지로 아직 레시피 DTO가 없어서 일단 주석 처리
			//int result = new RecipeServiceJw().insertRecipe(at);
			int result = 0; // 에러방지용 임시값
			
			if(result > 0) {
				request.setAttribute("msg", "레시피가 등록되었습니다.");
				response.sendRedirect("listRecipe.do");
			}else {
				if(at != null) {
					File failedFile = new File(uploadPath + at.getChangeName());
					failedFile.delete();
				}
				
				request.setAttribute("msg", "레시피 등록에 실패하였습니다.");
				// 원래 이 상태면 에러페이지를 띄우는데 레시피 등록은 관리자만 하는건데 에러페이지를 띄우는게 의미가 있을지?
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
