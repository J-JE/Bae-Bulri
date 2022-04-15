package com.uni.basket.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.basket.model.dao.BasketDao;
import com.uni.basket.model.dto.Basket;

public class BasketService {

	public int insertBasket(Basket basket) {
		Connection conn = getConnection();
		int result = new BasketDao().insertBasket(conn, basket);
		
		if(result > 0) {
			commit(conn);
			System.out.println("장바구니 추가 성공, "+result+"행 커밋");
		}else {
			rollback(conn);
			System.out.println("장바구니 추가 실패, 롤백");
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Basket> selectBasketlist(int uId) {
		Connection conn = getConnection();
		ArrayList<Basket> list = new BasketDao().selectBasketlist(conn, uId);
		
		close(conn);
		return list;
	}

	public int updateBasket(Basket basket) {
		Connection conn = getConnection();
		int result = new BasketDao().updateBasket(conn, basket);
		
		if(result > 0) {
			commit(conn);
			System.out.println("장바구니 수정 성공, 커밋");
		}else {
			rollback(conn);
			System.out.println("장바구니 수정 실패, 롤백");
		}
		
		close(conn);
		return result;
	}

	public int deleteBasket(String bskNo) {
		Connection conn = getConnection();
		int result = new BasketDao().deleteBasket(conn, bskNo);
		
		if(result > 0) {
			commit(conn);
			System.out.println("장바구니 삭제 성공, 커밋");
		}else {
			rollback(conn);
			System.out.println("장바구니 삭제 실패, 롤백");
		}
		
		close(conn);
		return result;
	}

}
