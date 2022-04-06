package com.uni.member.model.dto;

import java.sql.Date;

public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String phone;
	private String email;
	private String address;
	private int point;
	private Date enrollDate;
	private String status;
	
	
	
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", phone=" + phone + ", email=" + email + ", address=" + address + ", point=" + point
				+ ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	

	public Member(int userNo, String userId, String userPwd, String userName, String phone, String email,
			String address, int point, Date enrollDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.point = point;
		this.enrollDate = enrollDate;
		this.status = status;
	}

	public Member(String userId, String userPwd) {
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	public Member(String userId, String userName, String phone, 
			String email, String address) {
		this.userId = userId;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}
	
	public Member(String userId, String phone, 
			String email, String address) {
		this.userId = userId;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}
	
	public Member(String userId, String userPwd, String userName, String phone, 
			String email, String address) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}
	
}
