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
import com.uni.order.model.service.OrderServiceJw;

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
		/*
		 * 1	2	22/04/18	경기도	0	3000	주문중
5	2	22/04/18	경기도	0	3000	주문중
		 * */
		
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
				
		Order order = new Order();
		order.setOrderNo(orderNo);
		order.setUserNo(userNo);
		
		// 우선 order의 order_status 를 '주문완료' 상태로 바꿔줌
		int result = new OrderServiceJw().OrderProcess(order);
		
		Order_Detail od = null;
		
		if(result > 0) {
			// 주문완료 상태로 바뀌면 orderdetail의 내용들 payment로 보내줌
			od = new OrderServiceJw().orderProcess(orderNo);
			
			if(od != null) {
				request.setAttribute("order", order);
				request.setAttribute("od", od);
				request.getRequestDispatcher("views/order/payment.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "주문 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		} //else {
			// 주문완료 상태로 바뀌지 않으면 주문실패로 order,orderdetail 데이터 지워줌
			//int fail = new OrderServiceJw().orderFail(order, od);
		//}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
