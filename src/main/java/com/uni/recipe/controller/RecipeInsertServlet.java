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
import com.uni.recipe.model.dto.Recipe;
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

		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String tag = multi.getParameter("tag");
		
		Recipe recipe = new Recipe();
		recipe.setRecipeTitle(title);
		recipe.setRecipeContent(content);
		recipe.setRecipeTag(tag);
		
		Attachment at = null;
		
		if(multi.getOriginalFileName("upfile") != null) {
			String originName = multi.getOriginalFileName("upfile");
			String changeName = multi.getFilesystemName("upfile");
			
			at = new Attachment();
			at.setFilePath(uploadPath);
			at.setOriginName(originName);
			at.setChangeName(changeName);
			
			int result = new RecipeServiceJw().insertRecipe(recipe, at);
			
			if(result > 0) {
				request.setAttribute("msg", "레시피가 등록되었습니다.");
				response.sendRedirect("listRecipe.do");
			}else {
				if(at != null) {
					File failedFile = new File(uploadPath + at.getChangeName());
					failedFile.delete();
				}
				
				request.setAttribute("msg", "레시피 등록에 실패하였습니다.");
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
