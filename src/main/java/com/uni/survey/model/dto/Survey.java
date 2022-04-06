package com.uni.survey.model.dto;

import java.sql.Date;

public class Survey {
	
	private int surveyNo;
	private int category;
	private String surveyTitle;
	private String surveyContent;
	private Date createDate;
	private String status;
	
	public Survey() {
		// TODO Auto-generated constructor stub
	}

	
	public Survey(int surveyNo, int category, String surveyTitle, String surveyContent, Date createDate,
			String status) {
		super();
		this.surveyNo = surveyNo;
		this.category = category;
		this.surveyTitle = surveyTitle;
		this.surveyContent = surveyContent;
		this.createDate = createDate;
		this.status = status;
	}


	public int getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getSurveyTitle() {
		return surveyTitle;
	}

	public void setSurveyTitle(String surveyTitle) {
		this.surveyTitle = surveyTitle;
	}

	public String getSurveyContent() {
		return surveyContent;
	}

	public void setSurveyContent(String surveyContent) {
		this.surveyContent = surveyContent;
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
		return "Survey [surveyNo=" + surveyNo + ", category=" + category + ", surveyTitle=" + surveyTitle
				+ ", surveyContent=" + surveyContent + ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
	
}
