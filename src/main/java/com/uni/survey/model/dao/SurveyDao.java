package com.uni.survey.model.dao;

import static com.uni.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.common.Attachment;
import com.uni.survey.model.dto.Survey;
import com.uni.survey.model.dto.Survey_Reply;

public class SurveyDao {

	private Properties prop = new Properties();
	
	public SurveyDao() {
		String fileName = SurveyDao.class.getResource("/sql/survey/survey-query.properties").getPath();
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
	public ArrayList<Survey> selectList(Connection conn) {
		ArrayList<Survey> list = new ArrayList<Survey>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		//selectList=SELECT SURVEY_NO, SURVEY_TITLE, CREATE_DATE FROM NOTICE WHERE STATUS='Y' ORDER BY SURVEY_NO DESC
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Survey(rset.getInt("SURVEY_NO"),
									rset.getString("SURVEY_TITLE"),
									rset.getDate("CREATE_DATE")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int insertSurvey(Connection conn, Survey s) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertSurvey");
		//insertSurvey=INSERT INTO SURVEY VALUES (SEQ_SNO.NEXTVAL,3,?,?,SYSDATE,DEFAULT)

//		SURVEY_TITLE
//		SURVEY_CONTENT

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getSurveyTitle());
			pstmt.setString(2, s.getSurveyContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return	result;
	}
	public int insertAttachment(Connection conn, Attachment at) {
		//insertAttachment=INSERT INTO ATTACHMENT VALUES(SEQ_FNO.NEXTVAL, 3, SEQ_SNO.CURRVAL, ?, ?, ?, SYSDATE, DEFAULT)
				int result =0;
				PreparedStatement pstmt = null;
//				ORIGIN_NAME
//				CHANGE_NAME
//				FILE_PATH
				String sql = prop.getProperty("insertAttachment");
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, at.getOriginName());
					pstmt.setString(2, at.getChangeName());
					pstmt.setString(3, at.getFilePath());
					
					
					result = pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					close(pstmt);
				}
				
				return	result;
	}
	public Survey selectSurvey(Connection conn, int nno) {
		Survey s = null;
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		//selectSurvey=SELECT SURVEY_NO, SURVEY_TITLE, CREATE_DATE FROM SURVEY WHERE STATUS = 'Y' AND SURVEY_NO=?
		
		String sql = prop.getProperty("selectSurvey");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				s = new Survey(rset.getInt("SURVEY_NO"),
								rset.getString("SURVEY_TITLE"),
								rset.getDate("CREATE_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}
	
	public Attachment selectAttachment(Connection conn, int nno) {
		//selectAttachment=SELECT FILE_NO, ORIGIN_NAME, CHANGE_NAME FROM ATTACHMENT WHERE REF_BNO=? AND STATUS='Y'

		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	
	public int deleteSurvey(Connection conn, int nno) {
		int result = 0;
		PreparedStatement pstmt = null;
		//deleteSurvey=UPDATE SURVEY SET STATUS='N' WHERE SURVEY_NO=?
		String sql = prop.getProperty("deleteSurvey");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteAttachment(Connection conn, int nno) {
		//deleteAttachment=UPDATE ATTACHMENT SET STATUS='N' WHERE REF_BNO=?
				int result = 0;
				PreparedStatement pstmt = null;
				String sql = prop.getProperty("deleteAttachment");
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, nno);
					
					result = pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					close(pstmt);
				}
				return result;
	}
	public ArrayList<Survey_Reply> selectRList(Connection conn, int sno) {
		ArrayList<Survey_Reply> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRlist");
		//SELECT S_REPLY_NO, S_REPLY_CONTENT, USER_NO, CREATE_DATE FROM SURVEY_REPLY R JOIN MEMBER USING(USER_NO) WHERE SURVEY_NO=? AND R.STATUS='Y' ORDER BY S_REPLY_NO DESC
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			while(rset.next()) {
				Survey_Reply r = new Survey_Reply(rset.getInt("S_REPLY_NO"),
									rset.getString("S_REPLY_CONTENT"),
									rset.getDate("CREATE_DATE"),
									rset.getString("USER_ID"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public int insertReply(Connection conn, Survey_Reply sr) {
		int result =0;
		PreparedStatement pstmt = null;
		//insertReply=INSERT INTO SURVEY_REPLY VALUES(SEQ_SRNO.NEXTVAL, ?, ?, ?, SYSDATE, DEFAULT)
//		SURVEY_NO
//		S_REPLY_CONTENT
//		USER_NO
		String sql = prop.getProperty("insertReply");
		
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, sr.getSurveyNo());
				pstmt.setString(2, sr.getReplyContent());
				pstmt.setInt(3, sr.getUserNo());
				
				
				result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return	result;
	}

}
