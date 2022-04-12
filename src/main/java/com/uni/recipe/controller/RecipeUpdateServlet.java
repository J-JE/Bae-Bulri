package com.uni.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.uni.common.Attachment;
import com.uni.common.MyFileRenamePolicy;
import com.uni.recipe.model.dto.Recipe;
import com.uni.recipe.model.service.RecipeServiceTh;

/**
 * Servlet implementation class RecipeUpdateServlet
 */
@WebServlet("/updateRecipe.do")
public class RecipeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeUpdateServlet() {
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
			String savePath = resources + "\\recipeFiles\\";
			
			
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath , maxSize , "UTF-8", new MyFileRenamePolicy());

			int rId = Integer.parseInt(multiRequest.getParameter("rId"));
			String[] pros = multiRequest.getParameterValues("product");
			String[] contents = multiRequest.getParameterValues("content");
			String pro = "";
			String content = "";
			if(pros != null) {
				pro = String.join(",", pros);
			}
			if(contents != null) {
				content = String.join("!", contents);
			}
			
			Recipe r = new Recipe();
			r.setRecipeNo(rId);
			r.setRecipeTitle(multiRequest.getParameter("title"));
			r.setRecipeTag(multiRequest.getParameter("tag"));
			r.setRecipeDes(multiRequest.getParameter("desc"));
			//r.setRecipePro(multiRequest.getParameter("product"));
			r.setRecipePro(pro);
			r.setRecipeTime(Integer.parseInt(multiRequest.getParameter("time")));
			//r.setRecipeContent(multiRequest.getParameter("content").replace("\n", "<br>"));
			r.setRecipeContent(content);
			
			
			//ArrayList<Attachment> fileList = new ArrayList<>();
			Attachment at = null;

			/*for(int i = 1; i <= 4; i++) {
				String file = "upFile"+i;*/
				
				if(multiRequest.getOriginalFileName("upFile") != null) {
					String originName = multiRequest.getOriginalFileName("upFile");//오리지날 이름
					String changeName = multiRequest.getFilesystemName("upFile");//새로 첨부하는 이름
					System.out.println("ori" + originName);
					System.out.println("che" + changeName);
					
					//변경된 내용을 객체에 담아줘야함
					at = new Attachment();
					
					at.setFilePath(savePath);
					at.setOriginName(originName);
					at.setChangeName(changeName);
					
					//fileList.add(at); //파일이 있으면 리스트에 담아준다.
				

					//기존에 첨부된 파일이 있는 경우에 
					if(multiRequest.getParameter("originFile") != null) {
						//System.out.println("file111111111 : " + file);
						//업로드 된것을 지우겠다.
						File deleteFile = new File(savePath + multiRequest.getParameter("originFile"));//체인지 된 파일이 넘어온다.
						
						deleteFile.delete();

						//파일 번호도 같이 넘겨주니까 해당하는 파일을 set해줌
						at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				
						System.out.println("at------------ : " + at.getFileNo());
					}else {
						//첨부된 파일이 없는경우 번호는 알아야함 없었으면 새로 insert를 해줘야함
						at.setRefBoardNo(rId);
					}
					
			}
	
			
			int result = new RecipeServiceTh().updateRecipe(r,at);
			//System.out.println("servlet =====" + fileList);
			
			if(result > 0) {
				response.sendRedirect("recipeDetail.do?rId="+rId);
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
