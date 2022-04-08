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
		
		
		//총게시글 갯수를 구함
		listCount = new MemberService_th().getListCount();
		
		//현재페이지 게시글이 있으면 페이지를 선택을 함.
		currentPage = 1;  //menubar에서 게시판 탭을 눌렀을때 제일 첫번째 page보여줘야 하기떄문에
		
		//페이지 전환시 전달받은 페이지가 있을경우 전달받은 페이지를 currentPage에 담기
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));//자료형이 int 타입이라 형변환시켜줌
		}
		
		//페이지 최대 갯수
		pageLimit = 10;//페이지 최대 갯수를 10개로 설정
		
		//게시글 최대 갯수
		boardLimit = 10; //게시글 최대 갯수도 10개로 설정
		
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
				
		maxPage = (int)Math.ceil((double)listCount/boardLimit);//listCount를 boardLimit으로 나눈 값을 maxPage에 담는다.
		//게시글 수를 게시글 최대 갯수로 나눈 값을 maxpage로 설정을 해야한다.
		
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
		
		startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		
		// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수
		// startPage : 1	=> endPage : 10
		// startPage : 11	=> endPage : 20
		
		endPage = startPage + pageLimit -1;
		
		//게시글에 끝에 따라 페이지는 달라지기때문에 endPage에 maxPage에 담아준다.
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//페이지를 생성해서 담는다.
		PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String userId = loginUser.getUserId();
		ArrayList<Cook_Talk> list = new MemberService_th().boardSelect(pi,userId);
		System.out.println(list); //값이 잘 넘어오나 확인
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("/views/member/myPageBoardListView.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
