package com.uni.basket.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.basket.model.dto.Basket;
import com.uni.basket.model.service.BasketService;
import com.uni.member.model.dto.Member;

/**
 * Servlet implementation class BasketPageServlet
 */
@WebServlet("/basket.do")
public class BasketPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uId = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		ArrayList<Basket> list = new BasketService().selectBasketlist(uId);
		
		if(list != null) {
			request.setAttribute("BasketList", list);
			request.getRequestDispatcher("views/basket/basketView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "장바구니 조회 실패");
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
