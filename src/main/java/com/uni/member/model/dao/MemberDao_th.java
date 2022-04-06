package com.uni.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.uni.member.model.dto.Member;
import static com.uni.common.JDBCTemplate.*;

public class MemberDao_th {
	private Properties prop = new Properties();

	public MemberDao_th() {
		String fileName = MemberDao_gm.class.getResource("/sql/member/member-query.properties").getPath();
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
		
		String sql = prop.getProperty("selectMember");
		
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
								 rset.getString("ADDRESS")
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

}
