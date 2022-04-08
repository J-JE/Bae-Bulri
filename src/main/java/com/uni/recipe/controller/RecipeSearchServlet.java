package com.uni.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.common.PageInfo;
import com.uni.recipe.model.dto.Recipe;
import com.uni.recipe.model.service.RecipeService_jje;

/**
 * Servlet implementation class RecipeSearchServlet
 */
@WebServlet("/recipeSearch.do")
public class RecipeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//////////////////////////////////////////////////////페이징
		int listCount; //총게시글 갯수
		int currentPage; //현재페이지 (요청한 페이지)
		int startPage; //현재 페이지 하단에 보여지는 페이징 바의 시작 수
		int endPage; //현재 페이지 하단에 보여지는 페이징 바의 끝 수
		
		int maxPage; //전체 페이지의 가장 마지막 페이지
		int pageLimit; //한 페이지 하단에 보여질 페이지 최대 갯수
		int boardLimit; //한 페이지에 보여질 게시글 최대 갯수
		
		listCount = new RecipeService_jje().getRListCount();
		System.out.println("listCount : "+listCount);
		
		currentPage = 1; //메뉴바에서 선택했을 때 첫페이지를 띄워주기 위해 현재 페이지를 1을 설정하고 시작한다.
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		pageLimit = 10;
		boardLimit = 12;
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		if(maxPage < endPage) {//endPage가 maxPage보다 작으면
			endPage = maxPage; //endPage를 maxPage로 설정한다.
		}
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		request.setAttribute("pi", pi);
		
		//////////////////////////////////////////////////////레시피
		String keyword = request.getParameter("keyword");
		ArrayList<Recipe> list = new RecipeService_jje().searchRecipeList(keyword, pi); //레시피 목록 호출
		
		request.setAttribute("list", list);
		System.out.println(list);
		request.getRequestDispatcher("views/recipe/recipeListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
