package com.uni.basket.model.dao;

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

import com.uni.basket.model.dto.Basket;

public class BasketDao {
	
	private Properties prop = new Properties();
	
	public BasketDao() {
		String fileName = BasketDao.class.getResource("/sql/basket/basket-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertBasket(Connection conn, Basket basket) {
		int result =0;
		Statement stmt = null;
		
//		String sql = prop.getProperty("insertBasketList");
//		INSERT INTO BASKET (BASKET_NO, USER_NO, PRODUCT_NO, BASKET_AMOUNT)\
//		SELECT SEQ_BNO.NEXTVAL, ?, PRODUCT_NO, 1\
//		FROM STORE WHERE PRODUCT_NAME IN ? AND STOCK > 0
		
		String sql = "INSERT INTO BASKET (BASKET_NO, USER_NO, PRODUCT_NO, BASKET_AMOUNT) SELECT SEQ_BKNO.NEXTVAL, "+basket.getUserNo()+", PRODUCT_NO, 1 FROM STORE WHERE PRODUCT_NAME IN ("+basket.getProductName()+") AND STOCK > 0";
		
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
//		SELECT BASKET_NO, USER_NO, PRODUCT_NAME, BASKET_AMOUNT, PRICE , CHANGE_NAME \
//		FROM BASKET JOIN (SELECT PRODUCT_NO, PRODUCT_NAME, PRICE, CHANGE_NAME \
//		FROM STORE A JOIN (SELECT * FROM ATTACHMENT WHERE CATEGORY=2) B ON(A.PRODUCT_NO=B.REF_BNO) \
//		)USING(PRODUCT_NO) WHERE USER_NO=?
		
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
						rset.getInt("PRICE"),
						rset.getString("CHANGE_NAME")
						);
				list.add(basket);
				System.out.println(basket);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return list;
	}

	public int updateBasket(Connection conn, Basket basket) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBasket");
//		UPDATE BASKET SET BASKET_AMOUNT = ? WHERE BASKET_NO = ?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, basket.getBasketAmount());
			pstmt.setInt(2, basket.getBasketNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteBasket(Connection conn, String bskNo) {
		int result =0;
		Statement stmt = null;
		
//		DELETE FROM BASKET WHERE BASKET_NO IN (?)
		
		String sql = "DELETE FROM BASKET WHERE BASKET_NO IN ("+bskNo+")";
		
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
}
