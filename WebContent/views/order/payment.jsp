<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.uni.member.model.dto.Member" %> 
<%@ page import="com.uni.order.model.dto.Order" %>
<%@ page import="com.uni.order.model.dto.Order_Detail" %>
<%
	Member m = (Member)request.getSession().getAttribute("loginUser");
	
	Order order = (Order)request.getAttribute("order");
	Order_Detail od = (Order_Detail)request.getAttribute("od");
	
	int totalPrice = 0;
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
	
	<div class="container">
		
	<div class="payment_area">
		<table align="center">
	
		<tr>
			<th>상품금액</th>
			<td><%=od.getPrice() %></td>
			<th>수량</th>
			<td><%=od.getAmount() %></td>
			<th>배송비</th>
			<td><%=order.getDelivery() %></td>
			<th>사용 포인트</th>
			<td><%=order.getPoint() %></td>
			<th>결제금액</th>
			<td>
			<%
				if(od != null){
					totalPrice = (od.getPrice() * od.getAmount()) + order.getDelivery();
				}
			%> 원
			</td>
		</tr>
		
		</table>
		
		<button class="pay_btn" onclick="payment()">결제하기</button>
	</div>
				
	</div>
	
<script>
//이니시스 결제로 하고 싶었는데 이니시스는 등록 절차를 거쳐야해서 카카오페이로 변경
//카카오페이 최소 결제금액 = 100원
function payment(data){
	var IMP = window.IMP;
	IMP.init('imp18688349'); // 가맹점 식별코드
	
	IMP.request_pay({
		pg : "kakaopay",
		pay_method: 'card',
		merchant_uid: '<%= order.getOrderNo() %>'
		name: '배불리 결제',
		amount: <%= totalPrice %>,
		//m_redirect_url: 'redirect url'
	}), function(rsp){
		if(rsp.success){
			// 결제 성공시
			var msg = "결제가 완료되었습니다.";
			alert(msg);
			location.href = "<%=contextPath %>/orderComplete.do";
		}else{
			// 결제 실패시
			var msg = "결제에 실패하였습니다.";
			alert(msg);
		}
	}
}
</script>
</body>
</html>