package com.uni.recipe.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.recipe.model.dao.RecipeDao_jje;
import com.uni.recipe.model.dto.Recipe;

public class RecipeService_jje {

	public ArrayList<Recipe> selectRecipeList() {
		Connection conn = getConnection();
		ArrayList<Recipe> list = new RecipeDao_jje().selectRecipeList(conn);
		
		close(conn);
		return list;
	}

	
	
}
