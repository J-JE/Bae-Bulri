package com.uni.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.dto.Member;
import com.uni.order.model.dto.Order;

/**
 * Servlet implementation class OrderInsert
 */
@WebServlet("/orderInsert.do")
public class OrderInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uId = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int tPrice = Integer.parseInt(request.getParameter("tPrice")); //총 가격
		
		Order order = new Order();
		order.setUserNo(uId);
		order.setOrderPrice(tPrice);
		
//		int oInfo = new OrderService().insertOrder(order); //주문 정보 생성
//		if(oInfo>0) { //생성 완료되면
//			int oNo = new OrderService().selectOrderNo(); //주문 번호 조회
//			String bNos = request.getParameter("bNos"); //파라미터로 주문할 장바구니 번호 갖고오기
			
//			int oDeatil = new OrderService().insertODetail(oNo, bNos);
//		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
