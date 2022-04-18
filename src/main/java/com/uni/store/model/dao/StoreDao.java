package com.uni.store.model.dao;

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

import com.uni.common.Attachment;
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
	    //selectStList=SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM(SELECT PRODUCT_NO,PRODUCT_NAME,PRICE,STOCK,CHANGE_NAME FROM STORE S JOIN (SELECT * FROM ATTACHMENT WHERE CATEGORY=2 ) B ON(S.PRODUCT_NO=B.REF_BNO)WHERE S.STATUS= 'Y')A)WHERE RNUM BETWEEN ? AND ?
	     
	     String sql = prop.getProperty("selectStList");
	     int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
	     int endRow = startRow + pi.getBoardLimit() - 1;
	    
	     
	 	try {
			pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
	        
			rset = pstmt.executeQuery();
			while(rset.next()) {//FROM전 까지만 받아서
				Store s = new Store();
				s.setProductNo(rset.getInt("PRODUCT_NO"));
				s.setProductName(rset.getString("PRODUCT_NAME"));
				s.setPrice(rset.getInt("PRICE"));
				s.setStock(rset.getInt("STOCK"));
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
		//getListCount=SELECT COUNT(*) FROM COOK_TALK WHERE STATUS='Y
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
		//selectSTORE=SELECT PRODUCT_NO,PRODUCT_NAME,PRICE,STOCK,CHANGE_NAME FROM STORE S LEFT JOIN (SELECT * FROM ATTACHMENT WHERE STATUS = 'Y') D ON ( S.PRODUCT_NO = D.REF_BNO ) AND S.STATUS = 'Y' WHERE S.PRODUCT_NO = ?

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				s = new Store(rset.getInt("PRODUCT_NO"),
						rset.getString("PRODUCT_NAME"),
						rset.getInt("PRICE"),
						rset.getInt("STOCK"),
						rset.getString("CHANGE_NAME")
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
	public Attachment selectAttachment(Connection conn, int sid) {
		//selectAttachment=SELECT FILE_NO, ORIGIN_NAME, CHANGE_NAME FROM ATTACHMENT WHERE REF_BNO=? AND STATUS='Y'
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	public int insertStore(Connection conn, Store s) {
			int result = 0;
		 PreparedStatement pstmt = null;
		 //insertSTORE=INSERT INTO STORE VALUES(SEQ_PNO.NEXTVAL, 2, ?, ?, ?, DEFAULT)
		 //insertSTORE=INSERT INTO STORE VALUES(SEQ_PNO.NEXTVAL, 2, ?, ?, ?, DEFAULT)

		  String sql = prop.getProperty("insertSTORE");
		  
		  try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, s.getProductName());
				pstmt.setInt(2, s.getPrice());
				pstmt.setInt(3, s.getStock());
			
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
		// insertAttachment=INSERT INTO ATTACHMENT VALUES(SEQ_FNO.NEXTVAL,2, SEQ_PNO.CURRVAL, ?, ?, ?, SYSDATE, DEFAULT)
	

		 String sql = prop.getProperty("insertAttachment");
		  
		  try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		
			
			return result;
		}
	public int updateStore(Connection conn, Store s) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateSTORE");
		//updateSTORE=UPDATE STORE  SET PRODUCT_NAME=?, PRICE=?, STOCK=? WHERE PRODUCT_NO=? 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getProductName());
			pstmt.setInt(2, s.getPrice());
			pstmt.setInt(3, s.getStock());
			pstmt.setInt(4, s.getProductNo());
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		//updateAttachment=UPDATE ATTACHMENT SET ORIGIN_NAME = ?, CHANGE_NAME = ?, FILE_PATH = ? WHERE FILE_NO = ?
		String sql = prop.getProperty("updateAttachment");
		try {
			{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileNo());
				
				result = pstmt.executeUpdate();// 값을 담아준다.
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteStore(Connection conn, int sid) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteSTORE");
		//deleteSTORE=UPDATE STORE  SET   STATUS = 'N' WHERE PRODUCT_NO= ?

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteAttachment(Connection conn, int sid) {
		//deleteAttachment=UPDATE ATTACHMENT SET STATUS='N' WHERE CATEGORY=2 AND REF_BNO=?

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<Store> searchStore(Connection conn, String sks, PageInfo pi) {
		ArrayList<Store>list = new ArrayList<Store>();
		 PreparedStatement pstmt = null;
	     ResultSet rset = null;
	     /*searchStore=SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM(SELECT PRODUCT_NO,PRODUCT_NAME,PRICE,STOCK,CHANGE_NAME \
	   FROM STORE S LEFT JOIN (SELECT * FROM ATTACHMENT WHERE CATEGORY=2 ) B ON (S.PRODUCT_NO=B.REF_BNO)AND 
	     S.STATUS= 'Y' WHERE S.PRODUCT_NAME LIKE ? )A)WHERE RNUM BETWEEN ? AND ?*/


	     String sql = prop.getProperty("searchStore");
	     int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
	     int endRow = startRow + pi.getBoardLimit() - 1;
	     try {
			pstmt = conn.prepareStatement(sql);
			sks='%'+sks+'%';
			pstmt.setString(1, sks);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Store s = new Store();
				s.setProductNo(rset.getInt("PRODUCT_NO"));
				s.setProductName(rset.getString("PRODUCT_NAME"));
				s.setPrice(rset.getInt("PRICE"));
				s.setStock(rset.getInt("STOCK"));
				s.setStroeImg(rset.getString("CHANGE_NAME"));
				
				list.add(s);
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
	public ArrayList<Store> selectSTopList(Connection conn) {
		ArrayList<Store> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectTopList");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while(rset.next()) {
				Store s = new Store();
				s.setProductNo(rset.getInt("PRODUCT_NO"));
				s.setProductName(rset.getString("PRODUCT_NAME"));
				s.setStroeImg(rset.getString("CHANGE_NAME"));
				list.add(s);
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
	




