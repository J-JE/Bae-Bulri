package com.uni.cook_talk.model.service;
import static com.uni.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.uni.cook_talk.model.dto.Cook_Talk;

public class CookTalkService {

	public ArrayList<Cook_Talk> selectList() {
		Connection conn = getConnection();
		return null;
	}

}
