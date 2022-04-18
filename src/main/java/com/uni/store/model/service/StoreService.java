package com.uni.store.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.common.Attachment;
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
			System.out.println("서비스1=11111111==================="+result1);
			System.out.println("서비스=22222==================="+result2);
		}
		if(result1 *result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}

	public int updateStore(Store s, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new StoreDao().updateStore(conn,s);
		
		int result2 = 1;
		if(at != null) {
				if(at.getFileNo() != 0) {
					result2 = new StoreDao().updateAttachment(conn,at);
				}else {
					result2 = new StoreDao().insertAttachment(conn,at);
				}
				}
				if(result1 *result2 > 0) {
					commit(conn);
				}else {
					rollback(conn);
				}
		close(conn);
		return result1 * result2;
	}

	public int deleteStore(int sid) {
		Connection conn = getConnection();
		
		int result1 = new StoreDao().deleteStore(conn,sid);
		int result2 = new StoreDao().deleteAttachment(conn,sid);
		
		System.out.println("스토어 삭제 ========================================result1"+result1);
		System.out.println("스토어 삭제 ========================================result2"+result2);
		if(result1 *result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2 ;
	}

	public ArrayList<Store> searchStore(String sks, PageInfo pi) {
		Connection conn = getConnection();		
		ArrayList<Store> list = new StoreDao().searchStore(conn,sks,pi);
		System.out.println("검색===================================="+list);
		
		close(conn);
		return list;
	}

	public ArrayList<Store> selectSTopList() {
		Connection conn = getConnection();
		
		ArrayList<Store> list = new StoreDao().selectSTopList(conn);
		
		close(conn);
		return list;
	}
	
}
