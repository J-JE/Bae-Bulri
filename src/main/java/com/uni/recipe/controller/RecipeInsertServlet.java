package com.uni.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

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
		int maxSize = 10 * 1024 * 1024; // 파일 최대 사이즈
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/recipe");
		
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
		int category = Integer.parseInt(multi.getParameter("category"));
		String title = multi.getParameter("title");
		String tag = multi.getParameter("tag");
		String desc = multi.getParameter("desc");
		String product = multi.getParameter("product");
		int time = Integer.parseInt(multi.getParameter("time"));
		String content = multi.getParameter("content");
				
		Recipe recipe = new Recipe();
		recipe.setrCategoryNo(category);
		recipe.setRecipeTitle(title);
		recipe.setRecipeTag(tag);
		recipe.setRecipeDes(desc);
		recipe.setRecipePro(product);
		recipe.setRecipeTime(time);
		recipe.setRecipeContent(content);
		
		Attachment at = null;
		
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		
		for(int i = 1; i <= 4; i++) {
			String file = "upFile" + i;
			
			if(multi.getOriginalFileName(file) != null) {
				String originName = multi.getOriginalFileName(file);
				String changeName = multi.getFilesystemName(file);
				
				at = new Attachment();
				at.setCategory(category);
				at.setFilePath(uploadPath);
				at.setOriginName(originName);
				at.setChangeName(changeName);
				
				list.add(at);
			}
		}
	
			int result = new RecipeServiceJw().insertRecipe(recipe, list);
			
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
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
