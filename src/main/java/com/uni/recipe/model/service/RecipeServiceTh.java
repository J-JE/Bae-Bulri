package com.uni.recipe.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.common.Attachment;
import com.uni.recipe.model.dao.RecipeDaoTh;
import com.uni.recipe.model.dto.Recipe;

public class RecipeServiceTh {

	public int updateRecipe(Recipe r, Attachment at) {
		Connection conn = getConnection();
		//게시글
		int result1 = new RecipeDaoTh().updateRecipe(conn,r);
		
		//첨부파일
		int result2 = 1;

		if(at != null) {

				if(at.getFileNo() != 0) {
					result2 = new RecipeDaoTh().updateAttachment(conn,at);
	
					System.out.println("service1" +at);
				}else {
				
					result2 = new RecipeDaoTh().insertUpdateAttachment(conn,at);
					System.out.println("service2" +at);
				}
		}
		System.out.println(result1);
		System.out.println(result2);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}

		close(conn);
		return result1 * result2;
	}

	public Recipe selectUpdateRecipe(int rId) {
		Connection conn = getConnection();
		Recipe r =new RecipeDaoTh().selectUpdateRecipe(conn, rId);
		
		close(conn);
		return r;
	}

	public Attachment selectUpdateAttachment(int rId) {
		/*Connection conn = getConnection();
		
		ArrayList<Attachment> fileList = new RecipeDaoTh().selectUpdateAttachment(conn, rId);
		
		close(conn);
		return fileList;*/
		
		Connection conn = getConnection();
		Attachment at = new RecipeDaoTh().selectUpdateAttachment(conn, rId);
		close(conn);
		return at;
	}

	



}
