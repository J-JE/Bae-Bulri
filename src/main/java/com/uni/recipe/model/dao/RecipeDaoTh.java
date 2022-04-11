package com.uni.recipe.model.dao;

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
		//updateRecipe=UPDATE RECIPE SET RECIPE_TITLE = ?, RECIPE_TAG = ?, RECIPE_DES = ?, RECIPE_PRO = ?, RECIPE_TIME=?, RECIPE_CONTENT = ? WHERE RECIPE_NO = ?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRecipeTitle());
			pstmt.setString(2, r.getRecipeTag());
			pstmt.setString(3, r.getRecipeDes());
			pstmt.setString(4, r.getRecipePro());
			pstmt.setInt(5, r.getRecipeTime());
			pstmt.setString(6, r.getRecipeContent());
			pstmt.setInt(7, r.getRecipeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateAttachment(Connection conn, ArrayList<Attachment> fileList) {
		//updateAttachment=UPDATE ATTACHMENT SET ORIGIN_NAME = ?, CHANGE_NAME = ?, FILE_PATH = ? WHERE FILE_NO = ?
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttachment");
		try {
			for(int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileNo());
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

	public int insertUpdateAttachment(Connection conn, ArrayList<Attachment> fileList) {
		int result = 0;
		PreparedStatement pstmt = null;
		//insertUpdateAttachment=INSERT INTO ATTACHMENT VALUES(SEQ_FNO.NEXTVAL, 1, ?, ?, ?, ?, SYSDATE, DEFAULT)
		String sql = prop.getProperty("insertUpdateAttachment");
		try {
			
			for(int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, at.getRefBoardNo());
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setString(4, at.getFilePath());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public Recipe selectUpdateRecipe(Connection conn, int rId) {
		Recipe r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//selectRecipe=SELECT RECIPE_NO,CATEGORY,R_CATEGORY_NO,RECIPE_TITLE,RECIPE_TAG, RECIPE_DES, RECIPE_PRO, RECIPE_TIME, RECIPE_CONTENT FROM RECIPE WHERE STATUS = 'Y' AND RECIPE_NO=?
		String sql = prop.getProperty("selectRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { //하나의 게시글만 조회
				/*r = new Recipe(rset.getInt("RECIPE_NO"),
								rset.getInt("CATEGORY"),
								rset.getInt("R_CATEGORY_NO"),
								rset.getString("RECIPE_TITLE"),
								rset.getString("RECIPE_TAG"),
								rset.getString("RECIPE_DES"),
								rset.getString("RECIPE_PRO"),
								rset.getInt("RECIPE_TIME"),
								rset.getString("RECIPE_CONTENT")
								);*/
				r = new Recipe();
				r.setRecipeNo(rset.getInt("RECIPE_NO"));
				r.setCategory(rset.getInt("CATEGORY"));
				r.setrCategoryNo(rset.getInt("R_CATEGORY_NO"));
				r.setRecipeTitle(rset.getString("RECIPE_TITLE"));
				r.setRecipeTag(rset.getString("RECIPE_TAG"));
				r.setRecipeDes(rset.getString("RECIPE_DES"));
				r.setRecipePro(rset.getString("RECIPE_PRO"));
				r.setRecipeTime(rset.getInt("RECIPE_TIME"));
				r.setRecipeContent(rset.getString("RECIPE_CONTENT"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
	}
	public ArrayList<Attachment> selectUpdateAttachment(Connection conn, int rId) {
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			//selectUpdateAttachment=SELECT FILE_NO, ORIGIN_NAME, CHANGE_NAME FROM ATTACHMENT WHERE REF_BNO=? AND STATUS='Y'
			String sql = prop.getProperty("selectUpdateAttachment");
			
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return fileList;
	}

}
