package com.uni.store.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.getConnection;
import static com.uni.common.JDBCTemplate.*;
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
		
		close(conn);
		return s;
	}

	public ArrayList<Attachment> selectThumbnail(int sid) {
Connection conn = getConnection();
		
		ArrayList<Attachment>list = new StoreDao().selectThumbnail(conn,sid);
		close(conn);
		return list;
	}

	public int insertStore(Store s, Attachment at) {
		Connection conn = getConnection();
		int result1 = new StoreDao().insertStore(conn, s);
		
		int result2 = 1;
		
		if(at != null) {
			result2 = new StoreDao().insertAttachment(conn, at); 
			if(result1 * result2 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result1 * result2;
		}
		return result1 * result2;
	}
}
