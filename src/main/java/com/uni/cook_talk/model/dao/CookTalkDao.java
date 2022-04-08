package com.uni.cook_talk.model.dao;
import static com.uni.common.JDBCTemplate.*;

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

public class CookTalkDao {
	private Properties prop = new Properties();
	
	public CookTalkDao() {
		String fileName = CookTalkDao.class.getResource("/sql/cookTalk/cookTalk-query.properties").getPath();
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
	public ArrayList<Cook_Talk> selectList(Connection conn, PageInfo pi) {
			ArrayList<Cook_Talk>list = new ArrayList<Cook_Talk>();
		 PreparedStatement pstmt = null;
	     ResultSet rset = null;
//selectList =SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_ID,CREATE_DATE FROM COOK_TALK C JOIN MEMBER M ON C.USER_NO = M.USER_NO WHERE C.STATUS = 'Y' ORDER BY C.BOARD_NO DESC ) A ) WHERE RNUM BETWEEN ? AND ?

	     String sql = prop.getProperty("selectList");
	     int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
	     int endRow = startRow + pi.getBoardLimit() - 1;
	     try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
	        
			rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            //notice객체에다가 새로운 객체를 만드며 while문을 돌면서 꺼낸다.
	            list.add(new Cook_Talk(rset.getInt("BOARD_NO"),
	                            rset.getString("BOARD_TITLE"),
	                            rset.getString("BOARD_CONTENT"),
	                            rset.getString("USER_ID"),
	                            rset.getDate("CREATE_DATE")
	                  
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
	public Cook_Talk selectCookTalk(Connection conn, int cno) {
		Cook_Talk cookTalk = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCOOK_TALK");
		
		try {
			pstmt = conn.prepareStatement(sql);
			  pstmt.setInt(1, cno);
			  //selectCOOK_TALK=SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, USER_ID, CREATE_DATE FROM COOK_TALK C JOIN MEMBER USING ( USER_NO ) WHERE C.STATUS = 'Y' AND BOARD_NO = ?
			  rset = pstmt.executeQuery();
			  
			  if(rset.next()) {
				  cookTalk = new Cook_Talk(rset.getInt("BOARD_NO"),
						  rset.getString("BOARD_TITLE"),
						  rset.getString("BOARD_CONTENT"),
						  rset.getString("USER_ID"),
						  rset.getDate("CREATE_DATE")
						  );
			  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return cookTalk;
	}
	public int insertCookTalk(Connection conn, Cook_Talk c) {
		int result = 0;//값이 없을수도 있으니까 초기화 시켜주고
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCOOK_TALK");
		
		//insertCOOK_TALK=INSERT INTO COOK_TALK VALUES(SEQ_BNO.NEXTVAL, ?, ?, ?,  SYSDATE, DEFAULT)
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getBoardTitle());
			pstmt.setString(2, c.getBoardContent());
		 pstmt.setInt(3, c.getUserNo()) ;
			 
			  result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateCookTalk(Connection conn, int cno, String ckTitle, String ckContent) {
		int result = 0;
		PreparedStatement pstmt = null;
		//updateCOOK_TALK=UPDATE COOK_TALK SET BOARD_TITLE=?, BOARD_CONTENT=? WHERE BOARD_NO=? 
		String sql = prop.getProperty("updateCOOK_TALK");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ckTitle);
			pstmt.setString(2, ckContent);
			pstmt.setInt(3,cno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteCookTalk(Connection conn, int cno) {
		int result = 0;//값이 없을수도 있으니까 초기화 시켜주고
		PreparedStatement pstmt = null;
		//deleteCOOK_TALK=UPDATE COOK_TALK SET STATUS='N' WHERE BOARD_NO=?
		String sql = prop.getProperty("deleteCOOK_TALK");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			 result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
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


}
