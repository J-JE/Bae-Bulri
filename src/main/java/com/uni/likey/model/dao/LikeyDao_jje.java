package com.uni.likey.model.dao;

import static com.uni.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import com.uni.recipe.model.dao.RecipeDao_jje;

public class LikeyDao_jje {
	private Properties prop = new Properties();
	
	public LikeyDao_jje() {
		String fileName = RecipeDao_jje.class.getResource("/sql/likey/likey-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
