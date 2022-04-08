package com.uni.member.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.commit;
import static com.uni.common.JDBCTemplate.getConnection;
import static com.uni.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.uni.member.model.dao.MemberDao_gm;
import com.uni.member.model.dao.MemberDao_th;
import com.uni.member.model.dto.Member;

public class MemberService_gm {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao_gm().loginMember(conn, userId, userPwd);
		
		close(conn);
		return loginUser;
	}

	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao_gm().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Member updatemember(Member m) {
		Connection conn = getConnection();
		
		Member updateMem = null;
		int result = new MemberDao_gm().updateMember(conn,m);
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao_th().selectMember(conn, m.getUserId());
		}else {
			rollback(conn);
			
		}
		close(conn);
		return updateMem;
	}

	

	

}
