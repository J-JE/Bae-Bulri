package com.uni.basket.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.commit;
import static com.uni.common.JDBCTemplate.getConnection;
import static com.uni.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.uni.basket.model.dao.BasketDao;
import com.uni.basket.model.dto.Basket;

public class BasketService {

	public int insertBasket(Basket basket) {
		Connection conn = getConnection();
		int result = new BasketDao().insertBasket(conn, basket);
		
		if(result > 0) {
			commit(conn);
			System.out.println("장바구니 추가 성공, 커밋");
		}else {
			rollback(conn);
			System.out.println("장바구니 추가 실패, 롤백");
		}
		
		close(conn);
		return result;
	}

}
