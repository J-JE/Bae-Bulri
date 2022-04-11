package com.uni.cook_talk.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uni.cook_talk.model.dto.Cook_Talk_Reply;
import com.uni.cook_talk.model.service.CookTalkService;

/**
 * Servlet implementation class ReplyListServlet
 */
@WebServlet("/rlist.do")
public class ReplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int cid = Integer.parseInt(request.getParameter("cid"));
		
		ArrayList<Cook_Talk_Reply>list = new CookTalkService().selectReList(cid);
				
				 	System.out.println("================"+list);
			      response.setContentType("application/json; charset=utf-8"); 
			      Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			      gson.toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
