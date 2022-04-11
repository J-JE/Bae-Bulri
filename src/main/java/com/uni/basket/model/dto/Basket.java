package com.uni.basket.model.dto;

public class Basket {
	
	private int basketNo;
	private int userNo;
	private String productName;
	private int basketAmount;
	
	public Basket() {	}
	
	public Basket(int basketNo, int userNo, String productName, int basketAmount) {
		super();
		this.basketNo = basketNo;
		this.userNo = userNo;
		this.productName = productName;
		this.basketAmount = basketAmount;
	}

	public Basket(int userNo, String productName, int basketAmount) {
		super();
		this.userNo = userNo;
		this.productName = productName;
		this.basketAmount = basketAmount;
	}
	
	public Basket(int userNo, String productName) {
		super();
		this.userNo = userNo;
		this.productName = productName;
	}

	public int getBasketNo() {
		return basketNo;
	}

	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getBasketAmount() {
		return basketAmount;
	}

	public void setBasketAmount(int basketAmount) {
		this.basketAmount = basketAmount;
	}

	@Override
	public String toString() {
		return "Basket [basketNo=" + basketNo + ", userNo=" + userNo + ", productNo=" + productName + ", basketAmount="
				+ basketAmount + "]";
	}

}
