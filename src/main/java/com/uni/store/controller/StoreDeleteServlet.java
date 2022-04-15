package com.uni.store.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.store.model.service.StoreService;

/**
 * Servlet implementation class StoreDeleteServlet
 */
@WebServlet("/deleteStore.do")
public class StoreDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sid = Integer.parseInt(request.getParameter("sid"));
		int result = new StoreService().deleteStore(sid);
		System.out.println("스토어 삭제 ========================================result1"+  result);
		if(result > 0) {
			request.getSession().setAttribute("msg", "삭제를 성공하였습니다");
			response.sendRedirect("storeList.do");
		}else {
			request.setAttribute("msg", "삭제가 실패하였습니다");
			request.getRequestDispatcher("views/commom/errorPage.jsp").forward(request, response);
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
