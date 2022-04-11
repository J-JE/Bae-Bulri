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

	public int deleteMember(String userid) {
		Connection conn = getConnection(); //getConnection을 이용해 연결
		
		int result = new MemberDao_gm().deleteMember(conn, userid); //MemberDao에 deleteMembeer를 호출
		
		if(result > 0) {
			commit(conn); // 만약 result값이 0 이상이라면 커밋
		}else {
			rollback(conn); //아니라면 rollback을 시켜준다
		}
		close(conn);
		return result;
	}

	public Member findid(String username, String phone) {
		Connection conn = getConnection();
		
		Member mem = new MemberDao_gm().findid(conn,username, phone);
		
		close(conn);
		return mem;
	}

	public Member findpwd(String userid, String username, String phone) {
		Connection conn = getConnection();
		
		Member mem = new MemberDao_gm().findpwd(conn,userid,username, phone);
		
		close(conn);
		return mem;
	}

	public int idCheck(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao_gm().idCheck(conn,userId);
		
		close(conn);
		return result;
	}

	

	

}
