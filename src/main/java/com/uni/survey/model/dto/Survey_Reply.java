package com.uni.survey.model.dto;

import java.sql.Date;

public class Survey_Reply {
	private int replyNo;
	private int surveyNo;
	private String replyContent;
	private int userNo;
	private Date createDate;
	private String status;
	private String userid;
	public Survey_Reply() {
		// TODO Auto-generated constructor stub
	}

	
	public Survey_Reply(int replyNo, int surveyNo, String replyContent, int userNo, Date createDate, String status) {
		super();
		this.replyNo = replyNo;
		this.surveyNo = surveyNo;
		this.replyContent = replyContent;
		this.userNo = userNo;
		this.createDate = createDate;
		this.status = status;
	}

	
	public Survey_Reply(int replyNo, int surveyNo, String replyContent, int userNo, Date createDate, String status,
			String userid) {
		super();
		this.replyNo = replyNo;
		this.surveyNo = surveyNo;
		this.replyContent = replyContent;
		this.userNo = userNo;
		this.createDate = createDate;
		this.status = status;
		this.userid = userid;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Survey_Reply [replyNo=" + replyNo + ", surveyNo=" + surveyNo + ", replyContent=" + replyContent
				+ ", userNo=" + userNo + ", createDate=" + createDate + ", status=" + status + ", userid=" + userid
				+ "]";
	}


	public Survey_Reply(int replyNo, String replyContent, int userNo, Date createDate) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.userNo = userNo;
		this.createDate = createDate;
	}


	public Survey_Reply(int replyNo, String replyContent, Date createDate, String userid) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.userid = userid;
	}
	
	
	
	
}
