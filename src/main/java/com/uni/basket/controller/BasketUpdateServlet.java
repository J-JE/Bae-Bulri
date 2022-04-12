package com.uni.basket.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.basket.model.service.BasketService;

/**
 * Servlet implementation class BasketUpdateServlet
 */
@WebServlet("/basketUpdate.do")
public class BasketUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int amount = Integer.parseInt(request.getParameter("amount"));
		int proNo = Integer.parseInt(request.getParameter("proNo"));
		System.out.println("수량 : "+amount);
		System.out.println("장바구니 번호 : "+proNo);
		
		int result =BasketService().updateBasket();
		
		PrintWriter out = response.getWriter();
		if(result > 0) { //찜 성공했으면
			out.print("success");
		}else { //찜 실패앴으면
			out.print("failed");
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
