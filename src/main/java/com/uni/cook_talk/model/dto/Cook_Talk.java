package com.uni.cook_talk.model.dto;

import java.util.Date;

public class Cook_Talk {
	
	private int boardNo;//게시물번호
	private String boardTitle;//게시물제목
	private String boardContent;//게시물내용
	private int userNo;	//회원번호
	private Date createDate;//작성일 
	private String status;//상태값
	
	public Cook_Talk() {
		// TODO Auto-generated constructor stub
	}

	public Cook_Talk(int boardNo, String boardTitle, String boardContent, int userNo, Date createDate, String status) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.userNo = userNo;
		this.createDate = createDate;
		this.status = status;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
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
		return "Cook_Talk [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", userNo=" + userNo + ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	

}
