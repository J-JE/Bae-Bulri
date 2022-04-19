<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.uni.member.model.dto.Member" %> 
<%@ page import="com.uni.order.model.dto.Order" %>
<%@ page import="com.uni.order.model.dto.Order_Detail" %>
<%@ page import="java.util.ArrayList" %>
<%
	Member m = (Member)request.getSession().getAttribute("loginUser");
	
	Order order = (Order)request.getAttribute("order");
	//Order_Detail od = (Order_Detail)request.getAttribute("od");
	ArrayList<Order_Detail> od = (ArrayList<Order_Detail>)request.getAttribute("od");
	
	
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
	
	int sumPrice = 0;
	int delivery = 3000;
	int tPrice = od.get(0).getTotalPrice();
	
	for(int i=0; i<od.size();i++){ 
        int amount = od.get(i).getAmount();
        int price = od.get(i).getPrice(); //상품 가격(수량*가격)
       
        sumPrice += amount*price;
        
        //int orderNo = od.get(i).getOrderNo();
        //int userNo = od.get(i).getUserNo();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배불리 : 결제</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<style>
	.container{
		margin: 20px;
	}
	
    .con-top{
        color: rgb(155, 89, 182);
    }
    
    #zenOrder{
        color: rgb(155, 89, 182);
        font-weight: bold;
    }
    
    .pay_btn{
    	color: white;
    	background-color: #BCE7EB;
    }
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>

<div class="container">
  <div class="con-top">
	<span>장바구니</span> >
   	<span>주문하기</span> >
    <span id="zenOrder">결제하기</span>
</div>
  
  <div class="payment_area">
  
  <div class="card">
    <div class="card-header">결제 정보</div>
    
    <div class="card-body">
     
     <table>
		
		<%
			int point = m.getPoint();
		
            %>
	
		<tr>
			<th>상품 가격</th>
			<td><%=sumPrice %></td>
		</tr>
		<tr>
			<th>배송비</th>
			<td>3000</td>
		</tr>
		<tr>
			<th>사용 포인트</th>
			<td><%= point %></td>
		</tr>
		<tr>
			<th>결제 금액</th>
			<td><%=tPrice%></td>
		</tr>
		
		</table>
		
		<br>
		<button class="pay_btn" onclick="payment()">결제하기</button>
     
    </div> 
  </div>
  
  </div> <!-- payment_area -->

  
</div> <!-- container -->
	
	
<script>
function payment(){
	var IMP = window.IMP;
	IMP.init('imp18688349'); // 가맹점 식별코드
	
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '배불리 결제' , //결제창에서 보여질 이름
	    amount : 7500, // 가격
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	    	alert(msg);
	    	location.href = "<%=contextPath%>/orderComplete.do";
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	    	 alert(msg);
	    }
	});
}
</script>
</body>
</html>