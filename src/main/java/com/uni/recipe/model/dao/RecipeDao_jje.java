package com.uni.recipe.model.dao;

import static com.uni.common.JDBCTemplate.*;
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

import com.uni.common.Attachment;
import com.uni.common.PageInfo;
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

	
	public int getRListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getRecipeCount");
//		getRecipeCount=SELECT COUNT(*) FROM RECIPE WHERE STATUS='Y'
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql); //쿼리 담아서 실행해야 함
			
			if(rset.next()) {
				listCount = rset.getInt(1); //첫번째 컬럼
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	
	public ArrayList<Recipe> selectRecipeList(Connection conn, PageInfo pi) {
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllRecipeList");
/*
SELECT * FROM (SELECT ROWNUM RNUM, A.* \
FROM (SELECT RECIPE_NO, RECIPE_TITLE, RECIPE_TAG, R_CATEGORY_NAME, CHANGE_NAME\
FROM RECIPE B LEFT JOIN RECIPE_CATEGORY C ON(B.CATEGORY = C.R_CATEGORY_NO) \
LEFT JOIN (SELECT *FROM ATTACHMENT \
WHERE FILE_NO IN(SELECT MIN(FILE_NO) FILE_NO \
FROM ATTACHMENT WHERE STATUS='Y' GROUP BY REF_BNO ))D ON (B.RECIPE_NO = D.REF_BNO)\
AND B.STATUS='Y' ORDER BY RECIPE_NO DESC ) A) \
WHERE RNUM BETWEEN ? AND ?
*/
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Recipe r = new Recipe();
				r.setRecipeNo(rset.getInt("RECIPE_NO"));
				r.setRecipeTitle(rset.getString("RECIPE_TITLE"));
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


	public ArrayList<Recipe> searchRecipeList(Connection conn, String keyword, PageInfo pi) {
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		ArrayList<Recipe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchRecipeList");
/*	
SELECT * FROM ( SELECT ROWNUM RNUM, A.* FROM ( \
SELECT RECIPE_NO, RECIPE_TITLE, RECIPE_TAG, R_CATEGORY_NAME, CHANGE_NAME \
FROM RECIPE B LEFT JOIN RECIPE_CATEGORY C ON(B.CATEGORY = C.R_CATEGORY_NO) LEFT JOIN ( \
SELECT * FROM ATTACHMENT WHERE FILE_NO IN( \
SELECT MIN(FILE_NO) FILE_NO FROM ATTACHMENT WHERE STATUS='Y' GROUP BY REF_BNO) \
)D ON (B.RECIPE_NO = D.REF_BNO) AND B.STATUS='Y' WHERE B.RECIPE_TAG LIKE ? OR B.RECIPE_TITLE LIKE ?OR B.RECIPE_CONTENT LIKE ? \
ORDER BY RECIPE_NO DESC )A)WHERE RNUM BETWEEN ? AND ?
*/
		
		try {
			pstmt=conn.prepareStatement(sql);
			keyword='%'+keyword+'%';
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Recipe r = new Recipe();
				r.setRecipeNo(rset.getInt("RECIPE_NO"));
				r.setRecipeTitle(rset.getString("RECIPE_TITLE"));
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


	public int increaseCount(Connection conn, int rId) {
		int result =0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("increaseRecipeCount");
//		increaseRecipeCount=UPDATE RECIPE SET COUNT = COUNT+1 WHERE RECIPE_NO=?	

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public Recipe selectRecipe(Connection conn, int rId) {
		Recipe recipe = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecipe");
//		SELECT RECIPE_TITLE, RECIPE_CONTENT, RECIPE_TAG, RECIPE_PRO, R_CATEGORY_NAME \
//		FROM RECIPE A JOIN RECIPE_CATEGORY USING (R_CATEGORY_NO)\
//		WHERE A.STATUS = 'Y' AND RECIPE_NO = ?
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				recipe = new Recipe();
				recipe.setRecipeTitle(rset.getString("RECIPE_TITLE"));
				recipe.setRecipeContent(rset.getString("RECIPE_CONTENT"));
				recipe.setRecipeTag(rset.getString("RECIPE_TAG"));
				recipe.setRecipePro(rset.getString("RECIPE_PRO"));
				recipe.setrCategoryName(rset.getString("R_CATEGORY_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return recipe;
	}


	public ArrayList<Attachment> selectAttachment(Connection conn, int rId) {
		ArrayList<Attachment> fileList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectAttachment");
//		SELECT FILE_NO, ORIGIN_NAME, CHANGE_NAME FROM ATTACHMENT WHERE REF_BNO=? AND STATUS='Y'
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				fileList.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return fileList;
	}


}
