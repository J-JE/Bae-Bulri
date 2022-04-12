package com.uni.recipe.controller;

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
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String resources = request.getSession().getServletContext().getRealPath("/resources/images");
			
			String savePath = resources + "\\recipeFiles\\";
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
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
			
			if(multi.getOriginalFileName("upFile") != null) {
				String originName = multi.getOriginalFileName("upFile");
				String changeName = multi.getFilesystemName("upFile");
				
				at = new Attachment();
				at.setCategory(category);
				at.setFilePath(savePath);
				at.setOriginName(originName);
				at.setChangeName(changeName);
			}
			
			int result = new RecipeServiceJw().insertRecipe(recipe, at);
							
				if(result > 0) {
					request.getSession().setAttribute("msg", "레시피가 등록되었습니다.");
					response.sendRedirect("listRecipe.do");
				}else {
					if(at != null) {
						File failedFile = new File(savePath + at.getChangeName());
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
