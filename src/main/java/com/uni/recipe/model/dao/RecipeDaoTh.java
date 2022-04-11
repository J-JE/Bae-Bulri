package com.uni.recipe.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.uni.common.JDBCTemplate.*;
import com.uni.common.Attachment;
import com.uni.member.model.dao.MemberDao_gm;
import com.uni.recipe.model.dto.Recipe;

public class RecipeDaoTh {

	private Properties prop = new Properties();

	public RecipeDaoTh() {
		String fileName = MemberDao_gm.class.getResource("/sql/recipe/recipe_Th-query.properties").getPath();
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
	public int updateRecipe(Connection conn, Recipe r) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRecipeTitle());
			pstmt.setString(2, r.getRecipeTag());
			pstmt.setString(3, r.getRecipeDes());
			pstmt.setString(4, r.getRecipePro());
			pstmt.setInt(5, r.getRecipeTime());
			pstmt.setString(6, r.getRecipeContent());
			pstmt.setInt(7, r.getRecipeNo());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateAttachment(Connection conn, ArrayList<Attachment> atList) {
		//updateAttachment=UPDATE ATTACHMENT SET ORIGIN_NAME = ?, CHANGE_NAME = ?, FILE_PATH = ?
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttachment");
		try {
			for(int i = 0; i < atList.size(); i++) {
				Attachment at = atList.get(i);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				
				result += pstmt.executeUpdate();// 값을 담아준다.
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertUpdateAttachment(Connection conn, ArrayList<Attachment> atList) {
		// TODO Auto-generated method stub
		return 0;
	}

}
