package com.uni.recipe.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.uni.common.Attachment;
import com.uni.recipe.model.dto.Recipe;
import static com.uni.common.JDBCTemplate.*;

public class RecipeDaoJw {
	
	private Properties prop = new Properties();
	
	public void recipeDao() {
		//String fileName = properties 파일 아직 없어서 주석 처리
		// properties 파일이 없어서 일단 비워둠
	}

	public int insertRecipe(Connection conn, Recipe recipe) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("INSERT TO RECIPE VALUES(SEQ_RNO.NEXTVAL, DEFAULT, ?, ?, ?, DEFAULT, DEFAULT)");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, recipe.getRecipeTitle());
			pstmt.setString(2, recipe.getRecipeContent());
			pstmt.setInt(3, Integer.parseInt(recipe.getRecipeTag()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection conn, Attachment at) {
		return 0;
	}

}
