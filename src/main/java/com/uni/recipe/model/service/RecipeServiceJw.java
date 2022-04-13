package com.uni.recipe.model.service;

import java.sql.Connection;

import com.uni.common.Attachment;
import com.uni.recipe.model.dao.RecipeDaoJw;
import com.uni.recipe.model.dto.Recipe;

import static com.uni.common.JDBCTemplate.*;

public class RecipeServiceJw {

	public int insertRecipe(Recipe recipe, Attachment at) {
		Connection conn = getConnection();
		int result1 = new RecipeDaoJw().insertRecipe(conn, recipe);
		int result2 = 1;
		
		if(at != null) {
			result2 = new RecipeDaoJw().insertAttachment(conn, at);
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}

	public int deleteRecipe(int rId) {
		Connection conn = getConnection();
		int result1 = new RecipeDaoJw().deleteRecipe(conn, rId);
		int result2 = new RecipeDaoJw().deleteAttachment(conn, rId);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}
}
