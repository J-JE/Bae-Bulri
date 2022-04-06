package com.uni.common;

import java.sql.Date;

public class Attachment { //참조파일 dto -> recipe, store, survey에서 사용됨
	private int fileNo;			// 파일 번호
	private int category;		// 게시판 분류 번호
	private int refBoardNo;		// 참조 게시글 번호
	private String originName;	// 파일 원본명
	private String changeName;	// 파일 수정명
	private String filePath;	// 저장폴더경로
	private Date uploadDate;	// 업로드일
	private String status;		// 파일 상태값

	public Attachment() {	}
	
	public Attachment(int fileNo, int category, int refBoardNo, String originName, String changeName, String filePath,
			Date uploadDate, String status) {
		super();
		this.fileNo = fileNo;
		this.category = category;
		this.refBoardNo = refBoardNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getRefBoardNo() {
		return refBoardNo;
	}

	public void setRefBoardNo(int refBoardNo) {
		this.refBoardNo = refBoardNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", category=" + category + ", refBoardNo=" + refBoardNo
				+ ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", uploadDate=" + uploadDate + ", status=" + status + "]";
	}
	
}
