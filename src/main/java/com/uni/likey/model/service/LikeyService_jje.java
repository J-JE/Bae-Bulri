package com.uni.likey.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;

import com.uni.likey.model.dao.LikeyDao_jje;
import com.uni.likey.model.dto.Likey;

public class LikeyService_jje {

	public int checkLikey(Likey likey) {
		Connection conn = getConnection();
		
		int result = new LikeyDao_jje().checkLikey(conn, likey);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int insertLikey(Likey likey) {
		Connection conn = getConnection();
		
		int result = new LikeyDao_jje().insertLikey(conn, likey);
		
		if(result > 0) {
			commit(conn);
			System.out.println("찜 추가 성공, 커밋");
		}else {
			rollback(conn);
			System.out.println("찜 추가 실패, 롤백");
		}
		
		close(conn);
		return result;
	}

	public int deletetLikey(Likey likey) {
		Connection conn = getConnection();
		
		int result = new LikeyDao_jje().deletetLikey(conn, likey);
		
		if(result > 0) {
			commit(conn);
			System.out.println("찜 삭제 성공, 커밋");
		}else {
			rollback(conn);
			System.out.println("찜 삭제 실패, 롤백");
		}
		
		close(conn);
		return result;
	}
}
