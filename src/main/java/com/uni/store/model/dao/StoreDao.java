package com.uni.store.model.dao;

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

import com.uni.store.model.dto.Store;

public class StoreDao {
	private Properties prop = new Properties();
	
	public StoreDao() {
		String fileName = StoreDao.class.getResource("/sql/store/store-query.properties").getPath();
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
	public ArrayList<Store> selectStList(Connection conn, PageInfo pi) {
		ArrayList<Store>list = new ArrayList<Store>();
		 PreparedStatement pstmt = null;
	     ResultSet rset = null;
	    /* selectStList= SELECT * FROM ( SELECT ROWNUM RNUM, A.* FROM (\
SELECT PRODUCT_NAME, PRICE, RECIPE_TITLE, CHANGE_NAME \
FROM STORE  JOIN RECIPE USING(CATEGORY) \
LEFT JOIN (SELECT * FROM ATTACHMENT WHERE FILE_NO IN( \
SELECT MIN(FILE_NO) FILE_NO FROM ATTACHMENT WHERE STATUS='Y' GROUP BY REF_BNO) \
) ON (REF_BNO = PRODUCT_NO) AND STORE.STATUS='Y' ORDER BY PRODUCT_NO DESC )A)WHERE RNUM BETWEEN ? AND ?*/
	     
	     int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
	     int endRow = startRow + pi.getBoardLimit() - 1;
	     String sql = prop.getProperty("selectStList");
	     
	 	try {
			pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
	        
			rset = pstmt.executeQuery();
			while(rset.next()) {//FROM전 까지만 받아서
				Store s = new Store();
				s.setProductName(rset.getString("PRODUCT_NAME"));
				s.setPrice(rset.getInt("PRICE"));
				s.setRecipeTitle(rset.getString("RECIPE_TITLE"));
				s.setStroeImg(rset.getString("CHANGE_NAME"));
				
				list.add(s);//s에 담은 정보를 list에 담아주고
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
