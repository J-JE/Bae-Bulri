package com.uni.recipe.model.dao;

import static com.uni.common.JDBCTemplate.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.recipe.model.dto.Recipe;

public class RecipeDao_jje {

	private Properties prop = new Properties();
	
	public RecipeDao_jje() {
		String fileName = RecipeDao_jje.class.getResource("/sql/recipe/recipe-query.properties").getPath();
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
	
	public ArrayList<Recipe> selectRecipeList(Connection conn) {
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
//		selectAllRecipeList=SELECT A.RECIPE_TITLE, A.RECIPE_TAG, B.CHANGE_NAME \
//		FROM RECIPE A JOIN ( SELECT * FROM ATTACHMENT \
//		WHERE FILE_NO IN( \
//		SELECT MIN(FILE_NO) FILE_NO FROM ATTACHMENT WHERE STATUS='Y' GROUP BY REF_BNO)) B ON (A.RECIPE_NO = B.REF_BNO) \
//		WHERE A.STATUS='Y' ORDER BY A.RECIPE_NO DESC
		
		String sql = prop.getProperty("selectAllRecipeList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Recipe r = new Recipe();
				r.setRecipeTitle(rset.getString("RECIPE_TITLE"));
				System.out.println(r.getRecipeTitle());
				r.setRecipeTag(rset.getString("RECIPE_TAG"));
				r.setThImg(rset.getString("CHANGE_NAME"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
