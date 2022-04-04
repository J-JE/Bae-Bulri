package com.uni.order.model.dto;

public class Order_Detail {
	private int orderNo; // 주문번호
	private int productNo; // 상품번호
	private int amount; // 주문수량
	private int price; // 상품가격 (1개 가격)
	private int totalPrice; // 총 가격 (주문수량 * 상품가격)
	
	public Order_Detail() {
		// TODO Auto-generated constructor stub
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

	@Override
	public String toString() {
		return "Order_Detail [orderNo=" + orderNo + ", productNo=" + productNo + ", amount=" + amount + ", price="
				+ price + ", totalPrice=" + totalPrice + "]";
	}
	
}
