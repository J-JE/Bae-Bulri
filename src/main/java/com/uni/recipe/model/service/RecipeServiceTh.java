package com.uni.recipe.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.common.Attachment;
import com.uni.recipe.model.dao.RecipeDaoTh;
import com.uni.recipe.model.dto.Recipe;

public class RecipeServiceTh {

	public int updateRecipe(Recipe r, ArrayList<Attachment> atList) {
		Connection conn = getConnection();
		//게시글
		int result1 = new RecipeDaoTh().updateRecipe(conn,r);
		
		//첨부파일
		int result2 = 1;
		if(!atList.isEmpty()) {
			for(int i = 0; i < atList.size(); i++) {
				if(atList.get(i).getFileNo() != 0) {
					result2 = new RecipeDaoTh().updateAttachment(conn,atList);
				}else {
					result2 = new RecipeDaoTh().insertUpdateAttachment(conn,atList);
				}
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1 * result2;
	}



}
