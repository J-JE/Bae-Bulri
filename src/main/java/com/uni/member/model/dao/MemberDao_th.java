package com.uni.member.model.dao;

import static com.uni.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.common.PageInfo;
import com.uni.cook_talk.model.dto.Cook_Talk;
import com.uni.likey.model.dto.Likey;
import com.uni.member.model.dto.Member;
import com.uni.order.model.dto.Order_Detail;
import com.uni.recipe.model.dto.Recipe;

public class MemberDao_th {
	private Properties prop = new Properties();

	public MemberDao_th() {
		String fileName = MemberDao_th.class.getResource("/sql/member/mypagemember-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public Member selectMember(Connection conn, String userId) {
		Member mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyPage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			//SELECT USER_ID,USER_PWD,USER_NAME,EMAIL,PHONE,ADDRESS,POINT FROM MEMBER WHERE USER_ID= ?  AND STATUS='Y';
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			/*
			 * public Member(String userId, String userPwd, String userName, String phone, 
			String email, String address) {
			 */
			if(rset.next()) {
				mem = new Member(rset.getString("USER_ID"),
								 rset.getString("USER_PWD"),
								 rset.getString("USER_NAME"),
								 rset.getString("PHONE"),
								 rset.getString("EMAIL"),
								 rset.getString("ADDRESS"),
								 rset.getInt("POINT")
						      );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mem;
	}
	public int getListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	public ArrayList<Cook_Talk> boardSelect(Connection conn, PageInfo pi, String userId) {
		ArrayList<Cook_Talk> list = new ArrayList<Cook_Talk>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//selectMyBoard=SELECT * FROM(SELECT ROWNUM RNUM,A.* FROM(SELECT BOARD_NO,CREATE_DATE,BOARD_TITLE FROM COOK_TALK A JOIN MEMBER B ON A.USER_NO = B.USER_NO WHERE B.USER_ID = ? AND A.STATUS = 'Y'ORDER BY CREATE_DATE ) A) WHERE RNUM BETWEEN ? AND ?
		String sql = prop.getProperty("selectMyBoard");
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
					list.add(new Cook_Talk(rset.getInt("BOARD_NO"),
									   rset.getDate("CREATE_DATE"),
									   rset.getString("BOARD_TITLE")		
						));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Order_Detail> orderSelect(Connection conn, PageInfo pi, String userId) {
		ArrayList<Order_Detail> list = new ArrayList<Order_Detail>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//selectMyOrder=SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT A.ORDER_NO, C.ORDER_DATE, B.PRODUCT_NAME, A.AMOUNT, A.PRICE, C.ORDER_STATUS FROM ORDER_DETAIL A JOIN STORE B ON A.PRODUCT_NO = B.PRODUCT_NO JOIN ORDER_PRO C ON A.ORDER_NO = C.ORDER_NO JOIN MEMBER D ON C.USER_NO = D.USER_NO WHERE D.USER_ID = ? ORDER BY ORDER_NO DESC) A) WHERE RNUM BETWEEN ? AND ?
		String sql = prop.getProperty("selectMyOrder");
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
					
					list.add(new Order_Detail(rset.getInt("ORDER_NO"),
										rset.getDate("ORDER_DATE"),
									   rset.getString("PRODUCT_NAME"),
									   rset.getInt("AMOUNT"),
									   rset.getInt("PRICE"),
									   rset.getString("ORDER_STATUS")
						));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Recipe> likeySelect(Connection conn, PageInfo pi, String userId) {
		ArrayList<Recipe> list = new ArrayList<Recipe>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//selectMyLikey=SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM ( SELECT B.RECIPE_NO, RECIPE_TITLE, CHANGE_NAME FROM RECIPE B LEFT JOIN RECIPE_CATEGORY C ON ( B.CATEGORY = C.R_CATEGORY_NO ) JOIN LIKEY  C ON B.RECIPE_NO = C.RECIPE_NO JOIN MEMBER D ON C.USER_NO = D.USER_NO  LEFT JOIN (SELECT * FROM ATTACHMENT WHERE FILE_NO IN ( SELECT MIN(FILE_NO) FILE_NO FROM ATTACHMENT WHERE STATUS = 'Y' GROUP BY REF_BNO) )F ON ( B.RECIPE_NO = F.REF_BNO )AND B.STATUS = 'Y' WHERE D.USER_ID = ? ORDER BY B.RECIPE_NO DESC ) A) WHERE RNUM BETWEEN ? AND ?
		String sql = prop.getProperty("selectMyLikey");
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Recipe r = new Recipe(); //생성자가 없으니 setter로 생성
				r.setRecipeNo(rset.getInt("RECIPE_NO"));
				r.setRecipeTitle(rset.getString("RECIPE_TITLE"));
				r.setThImg(rset.getString("CHANGE_NAME"));
				
				list.add(r);
				/*list.add(new Recipe(rset.getString("RECIPE_TITLE")		
					));*/
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int deleteLikey(Connection conn, int rno, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		//deleteMyLikey=DELETE FROM LIKEY WHERE LIKEY_NO = ? AND USER_NO = ?
		String sql = prop.getProperty("deleteMyLikey");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Cook_Talk> searchMyBoard(Connection conn, String bkw, PageInfo pi, String userId) {
		ArrayList<Cook_Talk> list = new ArrayList<Cook_Talk>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//SearchMyBoard=SELECT * FROM( SELECT ROWNUM RNUM, A.* FROM ( SELECT BOARD_NO, BOARD_TITLE, CREATE_DATE FROM COOK_TALK A JOIN MEMBER B ON A.USER_NO = B.USER_NO WHERE BOARD_TITLE LIKE ? AND B.USER_ID = ? AND A.STATUS = 'Y' ORDER BY BOARD_NO DESC) A) WHERE RNUM BETWEEN ? AND ?
		String sql = prop.getProperty("SearchMyBoard");
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
	    int endRow = startRow + pi.getBoardLimit() - 1;
	    
	    try {
	    	pstmt = conn.prepareStatement(sql);
			bkw = '%' +bkw + '%';
			pstmt.setString(1, bkw);
			pstmt.setString(2, userId);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Cook_Talk(rset.getInt("BOARD_NO"),
						   rset.getDate("CREATE_DATE"),
						   rset.getString("BOARD_TITLE")		
			));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}



}
