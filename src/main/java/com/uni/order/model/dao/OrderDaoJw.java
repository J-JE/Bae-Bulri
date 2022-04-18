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

	public ArrayList<Basket> selectOrder(Connection conn, int userNo) {
		ArrayList<Basket> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBList");
//SELECT BASKET_NO, USER_NO, PRODUCT_NAME, BASKET_AMOUNT, PRICE \
//FROM BASKET JOIN (SELECT PRODUCT_NO, PRODUCT_NAME, PRICE \
//FROM STORE A JOIN (SELECT * FROM ATTACHMENT WHERE CATEGORY=2) B ON(A.PRODUCT_NO=B.REF_BNO) \
//)USING(PRODUCT_NO) WHERE USER_NO=? ORDER BY BASKET_NO
						
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Basket b = new Basket();
				b.setBasketNo(rset.getInt("BASKET_NO"));
				b.setUserNo(rset.getInt("USER_NO"));
				b.setProductName(rset.getString("PRODUCT_NAME"));
				b.setBasketAmount(rset.getInt("BASKET_AMOUNT"));
				b.setProPrice(rset.getInt("PRICE"));
				b.setThImg(rset.getString("CHANGE_NAME"));
				list.add(b);
				System.out.println(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int orderProcess(Connection conn, Order o, Order_Detail od) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("orderProcess");
		
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

}
