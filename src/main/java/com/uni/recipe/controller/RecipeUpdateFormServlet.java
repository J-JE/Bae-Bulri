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
import com.uni.recipe.model.service.RecipeServiceTh;

/**
 * Servlet implementation class RecipeUpdateFormServlet
 */
@WebServlet("/updateFormRecipe.do")
public class RecipeUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rId = Integer.parseInt(request.getParameter("rId"));

		Recipe r = new RecipeServiceTh().selectUpdateRecipe(rId);
		//ArrayList<Attachment> fileList = new RecipeServiceTh().selectUpdateAttachment(rId);
		Attachment at = new RecipeServiceTh().selectUpdateAttachment(rId);
		System.out.println(r);
		if(r != null) {
			request.setAttribute("r", r);
			//request.setAttribute("fileList", fileList);
			request.setAttribute("at", at);
			//System.out.println("-----------"+fileList);
			request.getRequestDispatcher("views/recipe/recipeUpdateFormView.jsp").forward(request, response);
		
		}else {
			request.setAttribute("msg", "목록이 없습니다.");
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
