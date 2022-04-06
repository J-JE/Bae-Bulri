package com.uni.member.model.service;

import java.sql.Connection;
import static com.uni.common.JDBCTemplate.*;

import com.uni.member.model.dao.MemberDao_gm;
import com.uni.member.model.dto.Member;

public class MemberService_gm {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao_gm().loginMember(conn, userId, userPwd);
		
		close(conn);
		return loginUser;
	}

}
