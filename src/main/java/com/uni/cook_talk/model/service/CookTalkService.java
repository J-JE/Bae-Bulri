package com.uni.cook_talk.model.service;
import static com.uni.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.uni.common.PageInfo;
import com.uni.cook_talk.model.dao.CookTalkDao;
import com.uni.cook_talk.model.dto.Cook_Talk;

public class CookTalkService {

	public ArrayList<Cook_Talk> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Cook_Talk>list = new CookTalkDao().selectList(conn, pi);
		System.out.println("서비스"+list);
		close(conn);
		return list;
	}
	
	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new CookTalkDao().getListCount(conn);
		
		close(conn);
		return listCount;
	}
	public Cook_Talk selectCookTalk(int cno) {
		Connection conn = getConnection();
		
		Cook_Talk cookTalk = new CookTalkDao().selectCookTalk(conn,cno);
		
		close(conn);
		return cookTalk;
	}

	public int insertCookTalk(Cook_Talk c) {
		Connection conn = getConnection();
		
		int result = new CookTalkDao().insertCookTalk(conn, c);
		if(result> 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateCookTalk(int cno, String ckTitle, String ckContent) {
		Connection conn = getConnection();
		
		int result = new CookTalkDao().updateCookTalk(conn,cno,ckTitle,ckContent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteCookTalk(int cno) {
		Connection conn = getConnection();
		int result = new CookTalkDao().deleteCookTalk(conn, cno);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	

}
