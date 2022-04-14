package com.uni.store.model.service;

import static com.uni.common.JDBCTemplate.*;
import static com.uni.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.common.Attachment;
import com.uni.common.PageInfo;
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

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new StoreDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	public Store selectStore(int sid) {
		Connection conn = getConnection();
		Store s = new StoreDao().selectStore(conn,sid);
		System.out.println("스토어 ==========sssssssssssssssssssssssssssssssss===="+s);
		close(conn);
		return s;
	}

	public Attachment selectAttachment(int sid) {
		Connection conn = getConnection();
		Attachment at  = new StoreDao().selectAttachment(conn, sid);
		System.out.println("스토어 atatatatatatatatatatatatatatatatataat"+at);
		close(conn);
		return at;
	}

	public int insertStore(Store s, Attachment at) {
		Connection conn = getConnection();
		int result1 = new StoreDao().insertStore(conn, s);
		
		int result2 = 1;
		
		if(at != null) {
			result2 = new StoreDao().insertAttachment(conn, at); 
		}
		System.out.println("스토어추가======================================"+result1+result2);
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}


	
}
