package com.uni.store.model.dto;

public class Store {
	
	private int productNo;//상품번호
	private int category;//게시판분류번호
	private String productName;//상품명
	private int price;//가격
	private int stock;//재고
	private String status;//상태값
	
	public Store() {
		// TODO Auto-generated constructor stub
	}

	public Store(int productNo, int category, String productName, int price, int stock, String status) {
		super();
		this.productNo = productNo;
		this.category = category;
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.status = status;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Store [productNo=" + productNo + ", category=" + category + ", productName=" + productName + ", price="
				+ price + ", stock=" + stock + ", status=" + status + "]";
	}
	
	
}
