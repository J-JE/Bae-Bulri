package com.uni.recipe.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
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
		String fileName = RecipeDaoJw.class.getResource("/sql/recipe/recipe-query.properties").getPath();
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

	public int insertRecipe(Connection conn, Recipe recipe) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recipe.getrCategoryNo());
			pstmt.setString(2, recipe.getRecipeTitle());
			pstmt.setString(3, recipe.getRecipeTag());
			pstmt.setString(4, recipe.getRecipeDes());
			pstmt.setString(5, recipe.getRecipePro());
			pstmt.setInt(6, recipe.getRecipeTime());
			pstmt.setString(7, recipe.getRecipeContent());
			
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
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getCategory());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
