package com.uni.survey.model.service;

import static com.uni.common.JDBCTemplate.*;
import static com.uni.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.common.Attachment;
import com.uni.survey.model.dao.SurveyDao;
import com.uni.survey.model.dto.Survey;

public class SurveyService {

	public ArrayList<Survey> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Survey> list = new SurveyDao().selectList(conn);
		
		close(conn);
		return list;
	}

	public int insertSurvey(Survey s, Attachment at) {
		Connection conn = getConnection();
		int result1 = new SurveyDao().insertSurvey(conn,s);
		
		int result2 = 1;
		if(at != null) {
			result2 = new SurveyDao().insertAttachment(conn,at);
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

	public Survey selectSurvey(int nno) {
		Connection conn = getConnection();
		Survey s = null;
		
		s = new SurveyDao().selectSurvey(conn,nno);
		
		close(conn);
		return s;
	}

	public Attachment selectAttachment(int nno) {
		Connection conn = getConnection();
		
		Attachment at = new SurveyDao().selectAttachment(conn, nno);
		close(conn);
		return at;
	}

}
