package com.uni.cook_talk.model.dto;

import java.util.Date;

public class Cook_Talk_Reply {
	
	private int ctReplyNo;//댓굴번호
	private int boardNo;//게시물번호
	private String ctRContent;//게시물내용
	private int userNo;	//회원번호
	private Date createDate;//작성일 
	private String status;//상태값
	private String userId;//회원아이디
	public Cook_Talk_Reply() {
		// TODO Auto-generated constructor stub
	}

	public Cook_Talk_Reply(int ctReplyNo, int boardNo, String ctRContent, int userNo, Date createDate, String status, String userId) {
		super();
		this.ctReplyNo = ctReplyNo;
		this.boardNo = boardNo;
		this.ctRContent = ctRContent;
		this.userNo = userNo;
		this.createDate = createDate;
		this.status = status;
		this.userId = userId;
	}
	
	
	


	public Cook_Talk_Reply(int ctReplyNo, String ctRContent,String userId, Date createDate) {
		super();
		this.ctReplyNo = ctReplyNo;
		this.ctRContent = ctRContent;
		this.userId = userId;
		this.createDate = createDate;
		
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getCtReplyNo() {
		return ctReplyNo;
	}

	public void setCtReplyNo(int ctReplyNo) {
		this.ctReplyNo = ctReplyNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getCtRContent() {
		return ctRContent;
	}

	public void setCtRContent(String ctRContent) {
		this.ctRContent = ctRContent;
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
		return "Cook_Talk_Reply [ctReplyNo=" + ctReplyNo + ", boardNo=" + boardNo + ", ctRContent=" + ctRContent
				+ ", userNo=" + userNo + ", createDate=" + createDate + ", status=" + status + ", userId=" + userId
				+ "]";
	}

	
	
	
}
