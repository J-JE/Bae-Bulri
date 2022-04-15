package com.uni.store.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.uni.common.Attachment;
import com.uni.common.MyFileRenamePolicy;
import com.uni.store.model.dto.Store;
import com.uni.store.model.service.StoreService;

/**
 * Servlet implementation class StoreUpdateServlet
 */
@WebServlet("/updateStore.do")
public class StoreUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {//멀티파트일때 처리
			int maxSize = 10*1024*1024; //1메가 바이트
			
			
			//1_2. 전달된 파일을 저장할 서버의 폴더 경로를 지정
			String resources = request.getSession().getServletContext().getRealPath("/resources/images");
			
			//저장 할 Path를 지정
			String savePath = resources + "\\store\\";
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath , maxSize , "UTF-8", new MyFileRenamePolicy());
			int sid = Integer.parseInt(multiRequest.getParameter("sid"));
			String title = multiRequest.getParameter("title");
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			int stock = Integer.parseInt(multiRequest.getParameter("stock"));
			Store s = new Store();
			s.setProductNo(sid);
			s.setProductName(title);
			s.setPrice(price);
			s.setStock(stock);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upFile") != null) {
				String originName = multiRequest.getOriginalFileName("upFile");//오리지날 이름
				String changeName = multiRequest.getFilesystemName("upFile");//수정한 파일 이름
				
				at = new Attachment();
				
				at.setFilePath(savePath);
				at.setOriginName(originName);
				at.setChangeName(changeName);
				
				if(multiRequest.getParameter("originFile") != null) {
					
					//업로드 된것을 지우겠다.
					File deleteFile = new File(savePath + multiRequest.getParameter("originFile"));//체인지 된 파일이 넘어온다.
					
					deleteFile.delete();

					//파일 번호도 같이 넘겨주니까 해당하는 파일을 set해줌
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
			
					System.out.println("at------------ : " + at.getFileNo());
				}else {
					//첨부된 파일이 없는경우 번호는 알아야함 없었으면 새로 insert를 해줘야함
					at.setRefBoardNo(sid);
				}
				
		}
			
			int result = new StoreService().updateStore(s,at);
			
			if(result > 0) {
				request.getSession().setAttribute("msg", "성공적으로 수정이 되었습니다.");
				response.sendRedirect("detailStore.do?sid="+sid);

			}else {
				request.setAttribute("msg", "레시피 수정에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response); 
			}
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
