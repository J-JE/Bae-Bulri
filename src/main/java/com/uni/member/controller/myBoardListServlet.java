package com.uni.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.common.PageInfo;
import com.uni.cook_talk.model.dto.Cook_Talk;
import com.uni.member.model.dto.Member;
import com.uni.member.model.service.MemberService_th;

/**
 * Servlet implementation class myBoardListServlet
 */
@WebServlet("/myBoardList.do")
public class myBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;   //총 게시글 갯수
		int currentPage; //현재 페이지 (요청한 페이지)
		int startPage;   //현재 페이지 하단에 보여지는 페이징 바의 시작수
		int endPage;     // 현재 페이지 하단에 보여지는 페이징 바의 끝수
		
		int maxPage;     //전체 페이지의 마지막 페이지
		int pageLimit;   //한페이지 하단에 보여질 페이지 최대갯수
		int boardLimit;  //한페이지에 보여질 게시글 최대갯수
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		listCount = new MemberService_th().getBoardListCount(userNo);
		
		
		currentPage = 1;  
		
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));//자료형이 int 타입이라 형변환시켜줌
		}
		
		
		pageLimit = 10;//페이지 최대 갯수를 10개로 설정
		
		//게시글 최대 갯수
		boardLimit = 10; //게시글 최대 갯수도 10개로 설정
		
				
		maxPage = (int)Math.ceil((double)listCount/boardLimit);//listCount를 boardLimit으로 나눈 값을 maxPage에 담는다.
		
		
		startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		
		
		endPage = startPage + pageLimit -1;
		
		//게시글에 끝에 따라 페이지는 달라지기때문에 endPage에 maxPage에 담아준다.
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//페이지를 생성해서 담는다.
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		String userId = loginUser.getUserId();
		ArrayList<Cook_Talk> list = new MemberService_th().boardSelect(pi,userId);
		System.out.println(list); //값이 잘 넘어오나 확인
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("/views/member/myPageBoardListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
