package com.uni.likey.model.dao;

import static com.uni.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.uni.likey.model.dto.Likey;
import com.uni.recipe.model.dao.RecipeDao_jje;

public class LikeyDao_jje {
	private Properties prop = new Properties();
	
	public LikeyDao_jje() {
		String fileName = RecipeDao_jje.class.getResource("/sql/likey/likey-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int checkLikey(Connection conn, Likey likey) {
		int result =0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("recipeLikeyCheck");
//		SELECT COUNT(*) FROM LIKEY WHERE USER_NO=? AND RECIPE_NO=?
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, likey.getUserNo());
			System.out.println("likey.getUserNo()"+likey.getUserNo());
			pstmt.setInt(2, likey.getRecipeNo());
			System.out.println("likey.getRecipeNo()"+likey.getRecipeNo());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result=rset.getInt(1);
				System.out.println(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertLikey(Connection conn, Likey likey) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertLikey");
//		INSERT INTO LIKEY VALUES(SEQ_LNO.NEXTVAL,?,?)
//		USER_NO
//		RECIPE_NO
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, likey.getUserNo());
			pstmt.setInt(2, likey.getRecipeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deletetLikey(Connection conn, Likey likey) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteLikey");
//		DELETE FROM LIKEY WHERE USER_NO=? AND RECIPE_NO=?
//		USER_NO
//		RECIPE_NO
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, likey.getUserNo());
			pstmt.setInt(2, likey.getRecipeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}
