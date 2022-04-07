package com.uni.member.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.common.PageInfo;
import com.uni.cook_talk.model.dto.Cook_Talk;
import com.uni.member.model.dao.MemberDao_th;
import com.uni.member.model.dto.Member;

public class MemberService_th {

	public Member selectMember(String userId) {
		Connection conn = getConnection();
		
		Member mem = new MemberDao_th().selectMember(conn,userId);
		
		close(conn);
		return mem;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new MemberDao_th().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Cook_Talk> boardSelect(PageInfo pi, String userId) {
		Connection conn = getConnection();
		ArrayList<Cook_Talk> list = new MemberDao_th().boardSelect(conn,pi,userId);
		close(conn);
		return list;
	}

}
