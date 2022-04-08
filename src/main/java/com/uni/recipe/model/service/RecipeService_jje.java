package com.uni.recipe.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.common.Attachment;
import com.uni.common.PageInfo;
import com.uni.recipe.model.dao.RecipeDao_jje;
import com.uni.recipe.model.dto.Recipe;

public class RecipeService_jje {

	public int getRListCount() {
		Connection conn = getConnection();
		int listCount = new RecipeDao_jje().getRListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	public ArrayList<Recipe> selectRecipeList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao_jje().selectRecipeList(conn, pi);
		
		close(conn);
		return list;
	}

	public ArrayList<Recipe> searchRecipeList(String keyword, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao_jje().searchRecipeList(conn, keyword, pi);
		
		close(conn);
		return list;
	}

	public Recipe selectRecipe(int rId) {
		Connection conn = getConnection();
		int result = new RecipeDao_jje().increaseCount(conn, rId);
		Recipe recipe = null;
		
		if(result > 0) {
			commit(conn);
			System.out.println("커밋 됨");
			//조회수가 올라갔을 때 객체 생성
			recipe = new RecipeDao_jje().selectRecipe(conn, rId);
		}else {
			rollback(conn);
			System.out.println("커밋 안됨");
		}
		
		close(conn);
		return recipe;
	}

	public ArrayList<Attachment> selectAttachment(int rId) {
		Connection conn = getConnection();
		ArrayList<Attachment> fileList = new RecipeDao_jje().selectAttachment(conn, rId);
		close(conn);
		return fileList;
	}

	
	
}
