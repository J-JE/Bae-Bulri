package com.uni.recipe.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.recipe.model.service.RecipeServiceJw;

/**
 * Servlet implementation class RecipeDeleteServlet
 */
@WebServlet("/deleteRecipe.do")
public class RecipeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rId = Integer.parseInt(request.getParameter("rId"));
		
		int result = new RecipeServiceJw().deleteRecipe(rId);
		
		if(result > 0) {
			response.sendRedirect("recipeList.do");
		}else {
			request.setAttribute("msg", "레시피 삭제에 실패하였습니다.");
			// 관리자만 실행할 수 있는 권한이 있기 때문에 에러페이지 연결 안해도 될 것 같음
			//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
