package com.uni.order.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.basket.model.dto.Basket;

import static com.uni.common.JDBCTemplate.*;
import com.uni.member.model.dto.Member;
import com.uni.order.model.dto.Order;
import com.uni.order.model.dto.Order_Detail;
import com.uni.store.model.dto.Store;

public class OrderDaoJw {
	private Properties prop = new Properties();
	
	public OrderDaoJw() {
		String fileName = OrderDaoJw.class.getResource("/sql/order/order-query.properties").getPath();
		System.out.println("fileName  " + fileName);
		
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


	public int orderProcess(Connection conn, Order order) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("UPDATE ORDER_PRO SET ORDER_STATUS = '주문완료' WHERE ORDER_NO = ? AND USER_NO = ?");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order.getOrderNo());
			pstmt.setInt(2, order.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public Order_Detail orderProcess(Connection conn, int orderNo) {
		Order_Detail od = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				od = new Order_Detail();
				od.setOrderNo(rset.getInt("ORDER_NO"));
				od.setProductNo(rset.getInt("PRODUCT_NO"));
				od.setAmount(rset.getInt("AMOUNT"));
				od.setPrice(rset.getInt("PRICE"));
				od.setTotalPrice(rset.getInt("TOTAL_PRICE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return od;
	}

/*
	public int orderFail(Connection conn, Order_Detail od) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("orderFail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, od.getOrderNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int orderFail(Connection conn, Order order) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("orderDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order.getOrderNo());
			pstmt.setInt(2, order.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
*/
}
