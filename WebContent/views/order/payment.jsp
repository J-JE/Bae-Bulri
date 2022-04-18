<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.uni.member.model.dto.Member" %> 
<%@ page import="com.uni.order.model.dto.Order" %>
<%@ page import="com.uni.order.model.dto.Order_Detail" %>
<%@ page import="com.uni.store.model.dto.Store" %>
<%@ page import="com.uni.basket.model.dto.Basket" %>
<%@ page import="java.util.ArrayList" %>
<%
	Member m = (Member)request.getSession().getAttribute("loginUser");
	
	int sumPrice = 0;
	
	Store product = (Store)request.getAttribute("product");
	Basket basket = (Basket)request.getAttribute("basket");
	Order order = (Order)request.getAttribute("order");
	
	//ArrayList<Order> oList = (ArrayList<Order>)request.getAttribute("oList");
	
	ArrayList<Basket> bList = (ArrayList<Basket>)request.getAttribute("bList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배불리 : 결제</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>

	<!-- 결제 api -->
	
</body>
</html>