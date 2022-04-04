package com.uni.order.model.dto;

import java.util.Date;
import java.util.List;

public class Order {
	
	private int orderNo; // 주문번호
	private int userNo; // 회원번호
	private Date orderDate; // 주문날짜
	private String address; // 배송주소
	private int usePoint; // 사용 포인트
	private int delivery; // 배송비
	private String orderStatus; // 주문상태
	private List<Order_Detail> list; // 주문상품
	
	private int price; // 주문금액 (주문상품*주문수량)
	private int orderPrice; // 최종 결제 금액 (주문상품*주문수량 + 배송비 - 사용포인트)
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	

	public int getOrderNo() {
		return orderNo;
	}




	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}




	public int getUserNo() {
		return userNo;
	}




	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}




	public Date getOrderDate() {
		return orderDate;
	}




	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public int getUsePoint() {
		return usePoint;
	}




	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}




	public int getDelivery() {
		return delivery;
	}




	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}




	public String getOrderStatus() {
		return orderStatus;
	}




	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}




	public List<Order_Detail> getList() {
		return list;
	}




	public void setList(List<Order_Detail> list) {
		this.list = list;
	}




	public int getPrice() {
		return price;
	}




	public void setPrice(int price) {
		this.price = price;
	}




	public int getOrderPrice() {
		return orderPrice;
	}




	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}


	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userNo=" + userNo + ", orderDate=" + orderDate + ", address=" + address
				+ ", usePoint=" + usePoint + ", delivery=" + delivery + ", orderStatus=" + orderStatus + ", list="
				+ list + ", price=" + price + ", orderPrice=" + orderPrice + "]";
	}


	public void orderPrice() {
		for(Order_Detail order : list) {
			price += order.getTotalPrice();
		}
		
		if(price >= 60000) {
			delivery = 0;
		}else {
			delivery = 3000;
		}
		
		orderPrice = price + delivery - usePoint;
	}
	
}
