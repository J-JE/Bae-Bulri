package com.uni.basket.model.dto;

public class Basket {
	
	private int basketNo;
	private int userNo;
	private String productName;
	private int basketAmount;
	private int proPrice;
	
	private String thImg;	//썸네일이미지
	
	public Basket() {	}
	
	public Basket(int basketNo, int userNo, String productName, int basketAmount, int proPrice, String thImg) {
		super();
		this.basketNo = basketNo;
		this.userNo = userNo;
		this.productName = productName;
		this.basketAmount = basketAmount;
		this.proPrice = proPrice;
		this.thImg = thImg;
	}

	public Basket(int basketNo, int userNo, String productName, int basketAmount, int proPrice) {
		super();
		this.basketNo = basketNo;
		this.userNo = userNo;
		this.productName = productName;
		this.basketAmount = basketAmount;
		this.proPrice = proPrice;
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

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public String getThImg() {
		return thImg;
	}

	public void setThImg(String thImg) {
		this.thImg = thImg;
	}

	@Override
	public String toString() {
		return "Basket [basketNo=" + basketNo + ", userNo=" + userNo + ", productName=" + productName
				+ ", basketAmount=" + basketAmount + ", proPrice=" + proPrice + "]";
	}

}
