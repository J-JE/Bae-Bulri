package com.uni.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.common.Attachment;
import com.uni.recipe.model.dto.Recipe;
import com.uni.recipe.model.service.RecipeService_jje;

/**
 * Servlet implementation class RecipeDetailServlet
 */
@WebServlet("/recipeDetail.do")
public class RecipeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rId = Integer.parseInt(request.getParameter("rId"));
		Recipe recipe = new RecipeService_jje().selectRecipe(rId);
		ArrayList<Attachment> fileList = new RecipeService_jje().selectAttachment(rId);
		
		if(recipe != null) {
			request.setAttribute("recipe", recipe);
			request.setAttribute("fileList", fileList);
			request.getRequestDispatcher("views/recipe/recipeDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "레시피 조회 실패");
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
