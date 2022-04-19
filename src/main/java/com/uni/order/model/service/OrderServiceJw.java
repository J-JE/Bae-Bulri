package com.uni.order.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.order.model.dao.OrderDaoJw;
import com.uni.order.model.dto.Order;
import com.uni.order.model.dto.Order_Detail;

import static com.uni.common.JDBCTemplate.*;

public class OrderServiceJw {

	public int OrderProcess(Order order) {
		Connection conn = getConnection();
		int result = new OrderDaoJw().orderProcess(conn, order);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Order_Detail> orderProcess(int orderNo) {
		Connection conn = getConnection();
//		Order_Detail od = new OrderDaoJw().orderProcess(conn, orderNo);
		ArrayList<Order_Detail> od = new OrderDaoJw().orderProcess(conn, orderNo);
		
		close(conn);
		return od;
	}


	public ArrayList<Order> selectOrder(Order order, int orderNo, int userNo) {
		Connection conn = getConnection();
		ArrayList<Order> list = new OrderDaoJw().selectOrder(conn, order, orderNo, userNo);
		
		close(conn);
		return list;
	}


/*	
	public int orderFail(Order order, Order_Detail od) {
		Connection conn = getConnection();
		int result1 = new OrderDaoJw().orderFail(conn, od);
		int result2 = 0;
		
		if(result1 > 0) {
			result2 = new OrderDaoJw().orderFail(conn, order);
			
			if(result2 > 0) {
				commit(conn);
			}
		}else{
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}
*/

}
