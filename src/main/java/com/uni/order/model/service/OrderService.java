package com.uni.order.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;

import com.uni.order.model.dao.OrderDao;
import com.uni.order.model.dto.Order;

public class OrderService {

	public int insertOrder(int uId) {
		Connection conn = getConnection();
		int result = new OrderDao().insertOrder(conn, uId);
		
		if(result > 0) {
			commit(conn);
			System.out.println("주문 생성 성공, 커밋");
		}else {
			rollback(conn);
			System.out.println("주문 생성 실패, 롤백");
		}
		return result;
	}

	public int selectOrderNo(int uId) {
		Connection conn = getConnection();
		int oNo = new OrderDao().selectOrderNo(conn, uId);
		
		close(conn);
		return oNo;
	}

	public int insertODetail(Order order, String bNos) {
		Connection conn = getConnection();
		int result = new OrderDao().insertOrder(conn, order, bNos);
		
		if(result > 0) {
			commit(conn);
			System.out.println("주문 상세 생성 성공, 커밋");
		}else {
			rollback(conn);
			System.out.println("주문 상세 생성 실패, 롤백");
		}
		return result;
	}

	public int deleteODetail(int oNo) {
		Connection conn = getConnection();
		int result = new OrderDao().deleteODetail(conn, oNo);
		if(result > 0) {
			commit(conn);
			System.out.println("주문 상세 삭제 성공, 커밋");
		}else {
			rollback(conn);
			System.out.println("주문 상세 삭제 실패, 롤백");
		}
		return result;
	}

	public int deleteOrder(int oNo) {
		Connection conn = getConnection();
		int result = new OrderDao().deleteOrder(conn, oNo);
		if(result > 0) {
			commit(conn);
			System.out.println("주문 삭제 성공, 커밋");
		}else {
			rollback(conn);
			System.out.println("주문 삭제 실패, 롤백");
		}
		return result;
		
	}

}
