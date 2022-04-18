package com.uni.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.dto.Member;
import com.uni.order.model.dto.Order;
import com.uni.order.model.dto.Order_Detail;
import com.uni.order.model.service.OrderService;
import com.uni.order.model.service.OrderServiceJw;
import com.uni.store.model.dto.Store;

/**
 * Servlet implementation class OrderProcessServlet
 */
@WebServlet("/orderProcess.do")
public class OrderProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String address = request.getParameter("address");
		
		// 총 결제 금액
		int sumPrice = 0;
		
		Order order = new Order();
		order.setUserNo(userNo);
		order.setAddress(address);
					
		/*
		String[] products = request.getParameterValues("product");
		
		if(products != null) {
			for(int i = 0; i < products.length; i++) {
				Store store = new OrderServiceJw().selectProduct(products[i]);
				sumPrice += store.getPrice();
			}
		} */
		
		Order_Detail od = new Order_Detail();
		//od.setOrderNo();
		
		int result = new OrderServiceJw().OrderProcess(order, od);
		
		if(result > 0) {
			request.getRequestDispatcher("views/order/payment.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "주문에 실패하였습니다.");
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
