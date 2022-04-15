package com.uni.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.basket.model.service.BasketService;
import com.uni.member.model.dto.Member;
import com.uni.order.model.dto.Order;
import com.uni.order.model.service.OrderService;

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
		
		//1.주문 정보 생성
		int oInfo = new OrderService().insertOrder(uId); //주문 정보 생성
		if(oInfo>0) { //생성 완료되면
			System.out.println("주문정보 생성됨");
			//2. 주문 번호 조회
			int oNo = new OrderService().selectOrderNo(uId); //주문 번호 조회
			
			//3. 주문 상세 정보 생성
			String bNos = request.getParameter("bNos"); //파라미터로 주문할 장바구니 번호 갖고오기
			Order order = new Order();
			order.setOrderNo(oNo); //주문 번호
			order.setUserNo(uId); //회원 번호
			order.setOrderPrice(tPrice); //최종 결제 금액
			int oDetail = new OrderService().insertODetail(order, bNos); //주문 정보, 장바구니 번호들
			
			PrintWriter out = response.getWriter();

			if(oDetail>0) { 
				//4.주문 성공하면 장바구니 삭제 DELETE BASKET
				int delBasket = new BasketService().deleteBasket(bNos);
				if(delBasket > 0) {
					out.print("success");
				}
			}else { 
				out.print("failed");
				//5.주문 실패하면 주문 상세 정보 삭제 DELETE ORDER_DETAIL
				int delOD = new OrderService().deleteODetail(oNo); 
				//6.주문 실패하면 주문 정보 삭제 DELETE ORDER_PRO
				int delO = new OrderService().deleteOrder(oNo); 
				if(delOD > 0 && delO > 0) {
					System.out.println("주문정보 삭제 성공");
				}else {
					System.out.println("주문정보 삭제 실패");
				}
			}
			out.flush();
			out.close();
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
