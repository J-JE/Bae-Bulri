package com.uni.cook_talk.model.dao;
import static com.uni.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

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
	public ArrayList<Cook_Talk> selectList(Connection conn) {
		ArrayList<Cook_Talk>list = new ArrayList<Cook_Talk>();
		 PreparedStatement pstmt = null;
	     ResultSet rset = null;
	     //selectList =SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, USER_NO, CREATE_DATE FROM COOK_TALK C JOIN MEMBER USING (USER_NO) WHERE C.STATUS = 'Y' ORDER BY C.BOARD_NO DESC 
	     String sql = prop.getProperty("selectList");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            //notice객체에다가 새로운 객체를 만드며 while문을 돌면서 꺼낸다.
	            list.add(new Cook_Talk(rset.getInt("BOARD_NO"),
	                            rset.getString("BOARD_TITLE"),
	                            rset.getString("BOARD_CONTENT"),
	                            rset.getInt("USER_NO"),
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


}
