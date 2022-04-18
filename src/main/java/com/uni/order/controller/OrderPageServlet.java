package com.uni.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.basket.model.dto.Basket;
import com.uni.member.model.dto.Member;
import com.uni.order.model.dto.Order;
import com.uni.order.model.service.OrderService;
import com.uni.order.model.service.OrderServiceJw;

/**
 * Servlet implementation class OrderPageServlet
 */
@WebServlet("/order.do")
public class OrderPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int oNo = Integer.parseInt(request.getParameter("oNo"));
		
		//임시
		
//		ArrayList<Basket> list = new OrderServiceJw().selectOrder(userNo);
		ArrayList<Order> list = new OrderService().selectOrder(oNo);
		
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/order/orderPage.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "주문 실패");
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
