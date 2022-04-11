package com.uni.basket.model.dao;

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

import com.uni.basket.model.dto.Basket;

public class BasketDao {
	
	private Properties prop = new Properties();
	
	public BasketDao() {
		String fileName = BasketDao.class.getResource("/sql/basket/basket-query.properties").getPath();
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

	public int insertBasket(Connection conn, Basket basket) {
		int result =0;
		Statement stmt = null;
		
//		String sql = prop.getProperty("insertBasketList");
//		INSERT INTO BASKET (BASKET_NO, USER_NO, PRODUCT_NO, BASKET_AMOUNT)\
//		SELECT SEQ_BNO.NEXTVAL, ?, PRODUCT_NO, 1\
//				FROM STORE WHERE PRODUCT_NAME IN ? AND STOCK > 0
		
		String sql = "INSERT INTO BASKET (BASKET_NO, USER_NO, PRODUCT_NO, BASKET_AMOUNT) SELECT SEQ_BNO.NEXTVAL, "+basket.getUserNo()+", PRODUCT_NO, 1 FROM STORE WHERE PRODUCT_NAME IN ("+basket.getProductName()+") AND STOCK > 0";
		
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

	public ArrayList<Basket> selectBasketlist(Connection conn, int uId) {
		ArrayList<Basket> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBasketList");
//		SELECT BASKET_NO, USER_NO, PRODUCT_NAME, BASKET_AMOUNT PRICE FROM BASKET JOIN STORE USING(PRODUCT_NO) WHERE USER_NO=?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Basket basket = new Basket(
						rset.getInt("BASKET_NO"), 
						rset.getInt("USER_NO"), 
						rset.getString("PRODUCT_NAME"), 
						rset.getInt("BASKET_AMOUNT"),
						rset.getInt("PRICE")
						);
				list.add(basket);
				System.out.println(basket);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
