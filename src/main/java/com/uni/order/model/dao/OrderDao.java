package com.uni.order.model.dao;

import static com.uni.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.uni.basket.model.dao.BasketDao;
import com.uni.order.model.dto.Order;

public class OrderDao {
	
	private Properties prop = new Properties();
	
	public OrderDao() {
		String fileName = BasketDao.class.getResource("/sql/order/order-query_jje.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertOrder(Connection conn, int uId) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOrderPro");
//		INSERT INTO ORDER_PRO (ORDER_NO, USER_NO, ORDER_DATE, ADDRESS, USE_POINT, DELIVERY, ORDER_STATUS)\
//		SELECT SEQ_ONO.NEXTVAL, USER_NO, SYSDATE, ADDRESS, 0, 3000, ?\
//		FROM MEMBER WHERE USER_NO=?
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "주문중");
			pstmt.setInt(2, uId);
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int selectOrderNo(Connection conn, int uId) {
		int oNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSequence");
//		SELECT SEQ_ONO.CURRVAL FROM DUAL
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, uId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				oNo=rset.getInt(1);
				System.out.println("시퀀스 번호(주문번호) : "+oNo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return oNo;
	}

	public int insertOrder(Connection conn, Order order, String bNos) {
		int result =0;
		Statement stmt = null;
		
		String sql = "INSERT INTO ORDER_DETAIL (ORDER_NO, PRODUCT_NO, AMOUNT, PRICE, TOTAL_PRICE) "
				+ "SELECT ORDER_NO, PRODUCT_NO, BASKET_AMOUNT, PRICE , "+order.getOrderPrice()+" FROM BASKET "
				+ "JOIN ( SELECT PRODUCT_NO, PRODUCT_NAME, PRICE, CHANGE_NAME FROM STORE A "
				+ "JOIN ( SELECT * FROM ATTACHMENT WHERE CATEGORY=2 ) B ON(A.PRODUCT_NO=B.REF_BNO))USING(PRODUCT_NO) "
				+ "JOIN ORDER_PRO USING(USER_NO) "
				+ "WHERE USER_NO="+order.getUserNo()+" AND ORDER_NO="+order.getOrderNo()+" AND BASKET_NO IN("+bNos+") ORDER BY BASKET_NO";
		
		try {
			stmt = conn.createStatement();
			
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		return result;
	}

	public int deleteODetail(Connection conn, int oNo) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteOrderDetail");
//		DELETE FROM ORDER_DETAIL WHERE ORDER_NO=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteOrder(Connection conn, int oNo) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteOrderPro");
//		DELETE FROM ORDER_PRO WHERE ORDER_NO=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
