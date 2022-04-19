package com.uni.order.model.dto;

import java.sql.Date;

public class Order_Detail {
	private int orderNo; // 주문번호
	private int productNo; // 상품번호
	private int amount; // 주문수량
	private int price; // 상품가격 (1개 가격)
	private int totalPrice; // 총 가격 (주문수량 * 상품가격)
	
	
	private String productName; //조인해서 받을 상품이름
	private String status;// 조인해서 받을 상태값
	private Date orderDate;//조인해서 받을 주문날짜
	
	public Order_Detail() {
		// TODO Auto-generated constructor stub
	}
	
	public Order_Detail(int orderNo, int productNo, int amount, int price, int totalPrice) {
		super();
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.amount = amount;
		this.price = price;
		this.totalPrice = totalPrice;
	}
	
	
	public Order_Detail(int orderNo, Date orderDate, String productName, int amount, int price, String status) {
		super();
		this.orderNo = orderNo;
		this.amount = amount;
		this.price = price;
		this.productName = productName;
		this.status = status;
		this.orderDate = orderDate;
	}


	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	@Override
	public String toString() {
		return "Order_Detail [orderNo=" + orderNo + ", productNo=" + productNo + ", amount=" + amount + ", price="
				+ price + ", totalPrice=" + totalPrice + "]";
	}
	
}
