package com.uni.store.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.common.Attachment;
import com.uni.store.model.dto.Store;
import com.uni.store.model.service.StoreService;

/**
 * Servlet implementation class StoreUpdateFormServlet
 */
@WebServlet("/updateStoreForm.do")
public class StoreUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int sid = Integer.parseInt(request.getParameter("sid"));
		
		Store s = new StoreService().selectStore(sid);
	    Attachment at = new StoreService().selectAttachment(sid);
	    
	    if(s != null) {
			request.setAttribute("s", s);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("views/store/storeUpdate.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "목록이 없습니다.");
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
