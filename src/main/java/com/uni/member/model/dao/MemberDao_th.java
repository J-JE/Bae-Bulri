package com.uni.member.model.dao;

import static com.uni.common.JDBCTemplate.close;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.common.PageInfo;
import com.uni.cook_talk.model.dto.Cook_Talk;
import com.uni.member.model.dto.Member;

public class MemberDao_th {
	private Properties prop = new Properties();

	public MemberDao_th() {
		String fileName = MemberDao_gm.class.getResource("/sql/member/mypagemember-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public Member selectMember(Connection conn, String userId) {
		Member mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMyPage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			//SELECT USER_ID,USER_PWD,USER_NAME,EMAIL,PHONE,ADDRESS,POINT FROM MEMBER WHERE USER_ID= ?  AND STATUS='Y';
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			/*
			 * public Member(String userId, String userPwd, String userName, String phone, 
			String email, String address) {
			 */
			if(rset.next()) {
				mem = new Member(rset.getString("USER_ID"),
								 rset.getString("USER_PWD"),
								 rset.getString("USER_NAME"),
								 rset.getString("PHONE"),
								 rset.getString("EMAIL"),
								 rset.getString("ADDRESS"),
								 rset.getInt("POINT")
						      );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mem;
	}
	public int getListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	public ArrayList<Cook_Talk> boardSelect(Connection conn, PageInfo pi, String userId) {
		ArrayList<Cook_Talk> list = new ArrayList<Cook_Talk>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//selectMyBoard=SELECT * FROM(SELECT ROWNUM RNUM,A.* FROM(SELECT BOARD_NO,CREATE_DATE,BOARD_TITLE FROM COOK_TALK A JOIN MEMBER B ON A.USER_NO = B.USER_NO WHERE B.USER_ID = ? AND A.STATUS = 'Y'ORDER BY CREATE_DATE ) A) WHERE RNUM BETWEEN ? AND ?
		String sql = prop.getProperty("selectMyBoard");
		int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() -1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
					list.add(new Cook_Talk(rset.getInt("BOARD_NO"),
									   rset.getDate("CREATE_DATE"),
									   rset.getString("BOARD_TITLE")		
						));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
