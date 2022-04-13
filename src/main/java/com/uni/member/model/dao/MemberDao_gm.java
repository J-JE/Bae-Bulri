package com.uni.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.uni.common.JDBCTemplate.*;

import com.uni.member.model.dto.Member;

public class MemberDao_gm {

	private Properties prop = new Properties();

	public MemberDao_gm() {
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

	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//loginMember=SELECT * FROM MEMBER WHERE USER_ID=? AND USER_PWD=? AND STATUS='Y'

		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			System.out.println(rset.getRow());
			System.out.println(sql);
			System.out.println(userId);
			System.out.println(userPwd);
			if(rset.next()) {
				loginUser = new Member(rset.getInt("USER_NO"),
										rset.getString("USER_ID"),
										rset.getString("USER_PWD"),
										rset.getString("USER_NAME"),
										rset.getString("EMAIL"),
										rset.getString("PHONE"),
										rset.getString("ADDRESS"),
										rset.getInt("POINT"),
										rset.getDate("ENROLL_DATE"),
										rset.getString("STATUS"));
										
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
				
		return loginUser;
	}

	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		

		String sql = prop.getProperty("insertMember");
		//INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL, ?,?,?,?,?,?,DAFULT,SYSDATE,DEFAULT)
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMember(Connection conn, Member m) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		//UPDATE MEMBER SET USER_PWD=?, USER_NAME=?, PHONE=?,EMAIL=?,ADDRESS=? WHERE USER_ID=?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMember(Connection conn, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		

		String sql = prop.getProperty("deleteMember");
		System.out.println(sql);
		try {
			sql = sql.replace("?", "\'" + userid + "\'");
			pstmt = conn.prepareStatement(sql);
			
			
			result = pstmt.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result; 
	}

	public Member findid(Connection conn, String username, String phone) {
		Member id = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				id = new Member();
				id.setUserId(rset.getString("USER_ID"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return id;
		
	}

	public Member findpwd(Connection conn, String userid, String username, String phone) {
		Member pwd = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, username);
			pstmt.setString(3, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pwd = new Member();
				pwd.setUserPwd(rset.getString("USER_PWD"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return pwd;
	}

	public int idCheck(Connection conn, String userId) {
		int result =0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Member> selectList(Connection conn) {
		ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		//selectList=SELECT USER_ID, USER_NAME, EMAIL, PHONE, ADDRESS, ENROLL_DATE FROM MEMBER WHERE STATUS='Y' ORDER BY USER_NAME;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getString("USER_ID"),
									rset.getString("USER_NAME"),
									rset.getString("EMAIL"),
									rset.getString("PHONE"),
									rset.getString("ADDRESS"),
									rset.getDate("ENROLL_DATE")));
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
