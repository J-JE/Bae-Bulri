package com.uni.store.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.common.PageInfo;
import com.uni.cook_talk.model.dao.CookTalkDao;
import com.uni.cook_talk.model.dto.Cook_Talk;
import com.uni.store.model.dao.StoreDao;
import com.uni.store.model.dto.Store;

public class StoreService {

	public ArrayList<Store> selectStList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Store>list = new StoreDao().selectStList(conn, pi);
		System.out.println("스토어============================="+list);
		close(conn);
		return list;
	}

}
