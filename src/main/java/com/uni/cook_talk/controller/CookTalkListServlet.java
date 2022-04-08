package com.uni.cook_talk.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.common.PageInfo;
import com.uni.cook_talk.model.dto.Cook_Talk;
import com.uni.cook_talk.model.service.CookTalkService;

/**
 * Servlet implementation class CookTalkListServlet
 */
@WebServlet("/cookTalkList.do")
public class CookTalkListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookTalkListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//페이징처리
		
		int listCount;//총 게시물 갯수
		int currentPage;//현재 페이지 (요청한 페이지)
		int startPage;//현재 페이지 하단에 보여지는 페이징 바의 시작수
		int endPage;//현재 페이지 하단에 보여지는 페이징 바의 끝수
		
		int maxPage;//현재 페이지의 가장 마지막 페이지
		int pageLimit;//한 페이지 하단에 보여질 최대 갯수
		int boardLimit;//한 페이지에 보여질 게시물 최대 갯수
		
		//총 게시물 갯수 
		listCount = new CookTalkService().getListCount();
		System.out.println("listCount : " + listCount);
		
		//현재 페이지 
		currentPage = 1;
		
		//페이지 전환신 전달받은 페잊가 있을 경우 전달 받은 페이지를 currentPage에 담기
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//페이지 최대 갯수
		pageLimit = 10;
		
		
		//게시물 최대 갯수
		boardLimit = 10;
		
		// * maxPage : 총 페이지 수
				/*
				 * ex) boardLimit : 10 이라는 가정 하에
				 * 
				 * 총갯수   / boardLimit
				 * 100.0 / 10 = 10.0 = 10.0		=> 10페이지
				 * 101.0 / 10 = 10.1 = 11.0		=> 11페이지
				 * 105.0 / 10 = 10.5 = 11.0		=> 11페이지
				 * 109.0 / 10 = 10.9 = 11.0		=> 11페이지
				 * 
				 * 총게시글갯수(실수)/boardLimit의 값을 올림한 값!
				 */
			
		maxPage = (int)Math.ceil((double)listCount/boardLimit);//총게시물 갯수 나누기 게시물 최대해서 반올림
		
		// * startPage : 현재 페이지에 보여지는 페이징 바의 시작 수
				/*
				 * ex) pageLimit : 10
				 * 1, 11, 21, 31, ...			=> n * 10 + 1
				 * 
				 * currentPage = 1				=> 0 * 10 + 1
				 * currentPage = 5				=> 0 * 10 + 1
				 * currentPage = 10				=> 0 * 10 + 1
				 * 
				 * currentPage = 11				=> 1 * 10 + 1
				 * currentPage = 12				=> 1 * 10 + 1
				 * currentPage = 20				=> 1 * 10 + 1
				 * 
				 * currentPage = 1~10			=> n=0
				 * currentPage = 11~20			=> n=1
				 * 
				 * 								   n = (currentPage - 1) / pageLimit
				 */
			
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수
		// startPage : 1	=> endPage : 10
		// startPage : 11	=> endPage : 20
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		
		ArrayList<Cook_Talk>list = new CookTalkService().selectList(pi);
		System.out.println("서블릿"+list);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		RequestDispatcher view = request.getRequestDispatcher("views/cook_talk/cookTalkList.jsp");
		view.forward(request, response);
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
