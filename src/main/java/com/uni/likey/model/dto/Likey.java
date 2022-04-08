package com.uni.likey.model.dto;

public class Likey {
	
	private int likeyNo;
	private int userNo;
	private int recipeNo;
	
	public Likey() {	}
	
	public Likey(int likeyNo, int userNo, int recipeNo) {
		super();
		this.likeyNo = likeyNo;
		this.userNo = userNo;
		this.recipeNo = recipeNo;
	}

	public int getLikeyNo() {
		return likeyNo;
	}

	public void setLikeyNo(int likeyNo) {
		this.likeyNo = likeyNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	@Override
	public String toString() {
		return "Likey [likeyNo=" + likeyNo + ", userNo=" + userNo + ", recipeNo=" + recipeNo + "]";
	}
	
}
