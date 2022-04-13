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

import com.uni.common.Attachment;
import com.uni.common.PageInfo;
import com.uni.recipe.model.dto.Recipe;
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
	    // selectStList=SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM(SELECT PRODUCT_NAME, PRICE, CHANGE_NAME FROM STORE S JOIN (SELECT * FROM ATTACHMENT WHERE CATEGORY=2 ) B ON(S.PRODUCT_NO=B.REF_BNO))A)WHERE RNUM BETWEEN ? AND ?
	     
	     int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
	     int endRow = startRow + pi.getBoardLimit() - 1;
	     String sql = prop.getProperty("selectStList");
	     
	 	try {
			pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
	        
			rset = pstmt.executeQuery();
			while(rset.next()) {//FROM전 까지만 받아서
				Store s = new Store();
				s.setProductName(rset.getString("PRODUCT_NAME"));
				s.setPrice(rset.getInt("PRICE"));
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
	public Store selectStore(Connection conn, int sid) {
		Store s = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSTORE");
		//selectSTORE= SELECT PRODUCT_NO,CATEGORY,PRODUCT_NAME,PRICE,STOCK FROM STORE WHERE PRODUCT_NO=?
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				s = new Store(rset.getInt("PRODUCT_NO"),
						rset.getInt("CATEGORY"),
						rset.getString("PRODUCT_NAME"),
						rset.getInt("PRICE"),
						rset.getInt("STOCK")
					
						);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return s;
	}
	public ArrayList<Attachment> selectThumbnail(Connection conn, int sid) {
		ArrayList<Attachment>list = new ArrayList<>() ;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, sid);
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						Attachment at = new Attachment();
						at.setFileNo(rset.getInt("FILE_NO"));
						at.setOriginName(rset.getString("ORIGIN_NAME"));
						at.setChangeName(rset.getString("CHANGE_NAME"));
						
						list.add(at);
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
	public int insertStore(Connection conn, Store s) {
		int result = 0;
		 PreparedStatement pstmt = null;
		 //insertSTORE=INSERT INTO STORE VALUES(SEQ_PNO.NEXTVAL, 2, ?, ?, ?, DEFAULT)
		  String sql = prop.getProperty("insertSTORE");
		  
		   try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getProductName());
			pstmt.setInt(2, s.getPrice());
			pstmt.setInt(3,s.getStock());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		
		return result;
	}
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		//insertAttachment=INSERT INTO ATTACHMENT VALUES(SEQ_FNO.NEXTVAL, ?, SEQ_PNO.CURRVAL, ?, ?, ?, SYSDATE, DEFAULT)
		 String sql = prop.getProperty("insertAttachment");
		 
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getCategory());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
