package com.uni.member.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;

import com.uni.member.model.dao.MemberDao_th;
import com.uni.member.model.dto.Member;

public class MemberService_th {

	public Member selectMember(String userId) {
		Connection conn = getConnection();
		
		Member mem = new MemberDao_th().selectMember(conn,userId);
		
		close(conn);
		return mem;
	}

}
