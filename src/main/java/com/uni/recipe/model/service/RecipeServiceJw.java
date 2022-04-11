package com.uni.recipe.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.common.Attachment;
import com.uni.recipe.model.dao.RecipeDaoJw;
import com.uni.recipe.model.dao.RecipeDaoTh;
import com.uni.recipe.model.dto.Recipe;
import static com.uni.common.JDBCTemplate.*;

public class RecipeServiceJw {

	public int insertRecipe(Recipe recipe, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result1 = new RecipeDaoJw().insertRecipe(conn, recipe);
		int result2 = 1;
		
		if(!list.isEmpty()) {
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).getFileNo() != 0) {
					result2 = new RecipeDaoJw().insertAttachment(conn, list);
				}else {
					result2 = new RecipeDaoJw().insertRecipeAttachement(conn, list);
				}
			}
		}
		
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}
}
