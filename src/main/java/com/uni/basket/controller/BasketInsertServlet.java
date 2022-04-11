package com.uni.basket.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.basket.model.dto.Basket;
import com.uni.basket.model.service.BasketService;
import com.uni.member.model.dto.Member;

/**
 * Servlet implementation class BasketInsertServlet
 */
@WebServlet("/basketInsert.do")
public class BasketInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BasketInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int writer = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String pro = request.getParameter("pro");
		
		System.out.println("userNo : "+writer);
		System.out.println("pro : "+pro);
		
		Basket basket = new Basket(writer, pro);
		
		int result = new BasketService().insertBasket(basket);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.print("success");
		}else {
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
