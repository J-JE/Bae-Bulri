package com.uni.member.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.common.PageInfo;
import com.uni.cook_talk.model.dto.Cook_Talk;
import com.uni.likey.model.dto.Likey;
import com.uni.member.model.dao.MemberDao_th;
import com.uni.member.model.dto.Member;
import com.uni.order.model.dto.Order_Detail;
import com.uni.recipe.model.dto.Recipe;

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

	public ArrayList<Order_Detail> orderSelect(PageInfo pi, String userId) {
		Connection conn = getConnection();
		ArrayList<Order_Detail> list = new MemberDao_th().orderSelect(conn,pi,userId);
		close(conn);
		return list;
	}

	public ArrayList<Recipe> likeySelect(PageInfo pi, String userId) {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new MemberDao_th().likeySelect(conn,pi,userId);
		close(conn);
		return list;

	}

	public int deleteLikey(int rno, int userNo) {
		Connection conn = getConnection();
		int result = new MemberDao_th().deleteLikey(conn,rno,userNo);
		System.out.println(result);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Cook_Talk> searchMyBoard(PageInfo pi, String bkw, String userId) {
		Connection conn = getConnection();
		ArrayList<Cook_Talk> list = new MemberDao_th().searchMyBoard(conn,bkw,pi,userId);
		
		close(conn);
		return list;
	}





}
