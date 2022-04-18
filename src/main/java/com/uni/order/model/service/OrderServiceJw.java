package com.uni.order.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.basket.model.dto.Basket;
import com.uni.order.model.dao.OrderDaoJw;
import com.uni.order.model.dto.Order;
import com.uni.order.model.dto.Order_Detail;

import static com.uni.common.JDBCTemplate.*;

public class OrderServiceJw {

	public ArrayList<Basket> selectOrder(int userNo) {
		Connection conn = getConnection();
		ArrayList<Basket> list = new OrderDaoJw().selectOrder(conn, userNo);
		
		close(conn);
		return list;
	}

	public int OrderProcess(Order order, Order_Detail od) {
		Connection conn = getConnection();
		int result = new OrderDaoJw().orderProcess(conn, order, od);
		
		// 아직 x
		
		close(conn);
		return result;
	}

}
