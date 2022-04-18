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
<title>배불리 : 주문</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>

	<div class="container">
	 <div class="con-top">
	 	<span>장바구니</span> >
   	 	<span id="zenOrder">주문하기</span> >
    	<span>결제하기</span>
	 </div>
	 
	 
	 <div class="orderInfo-wrap">
	 	<form name="orderForm" method="post" action="<%= contextPath %>/orderInsert.do">
	 	 <div class="order-pro">
	 	  <h3 class="subtitle">상품정보</h3>
	 	  <table class="pro-info" id="pro-table">
	  		<%
	  		for(int i=0; i<bList.size();i++){ 
        		
            	String proName=bList.get(i).getProductName(); //상품 명
            	int basketNo=bList.get(i).getBasketNo(); //장바구니 번호
            	String img = bList.get(i).getThImg(); //상품 이미지
            	int bPrice = (bList.get(i).getBasketAmount())*(bList.get(i).getProPrice()); //상품 가격(수량*가격)
            	int bAmount = bList.get(i).getBasketAmount();
            	sumPrice += bPrice;
	  		%>
	  		 <tr>
	  		 <td>
	  		 <img src="<%=contextPath %>/resources/images/store/<%=img%>" style="width: 50px; height: 50px; margin:2px;">
			  <label for ="<%=proName%>"><%=proName %></label>
			  <input type="hidden" value="<%=basketNo%>" name="proNo">
	  		 </td>
	  		 <td>
				<label>수량 </label>
				<input type="number" name="amount" min="0" max="50" value="<%=bAmount%>" style="width: 40px;">
				<input type="hidden" value="<%=bAmount%>" name="amount"> 
			</td>
			<td class="price">
				<%=bPrice%> 원
				<input type="hidden" value="<%=bPrice%>" name="price">
				<input type="hidden" value="<%=sumPrice%>" name="sumPrice">
			</td>
	  		 </tr>
	  		 <%} %>
	  		</table>
	 	 </div> <!-- order-pro --> 
	 	 
	 	 <div class="order-user">
	 	 <h3 class="subtitle">주문자 정보</h3>
	 	 <table class="user-info">
	 	  <%
	 	  String mName = m.getUserName();
	 	  String phone = m.getPhone();
	 	  String email = m.getEmail();
	 	 %>
	 	 <tr>
	 	 	<th>이름</th>
	 	 	<td><%=mName %></td>
	 	 </tr>
	 	 <tr>
	 	  <th>휴대전화</th>
	 	  <td><%=phone %></td>
	 	 </tr>
	 	 <tr>
	 	  <th>이메일</th>
	 	  <td><%=email %></td>
	 	 </tr>
	 	  </table>
	 	  <span>* 정확한 정보로 입력되어 있는지 확인해주세요.</span> <br>
	  	  <span>* 마이페이지에서 회원정보 수정이 가능합니다.</span>
	 	 </div> <!-- order-user -->
	 	 
	 	 <div class="order-addr">
	 	 <h3 class="subtitle">배송지 정보</h3>
	 	 <%
	 	 	String address = m.getAddress();
	 	 %>
	 	 <div class="addressInfo-div">
	 	  <div class="addressInfo-btn-div">
	 	   <button class="address-btn address-btn-1" onclick="showAdress('1')" style="background-color: #3c3838;">기존 주소</button>
		   <button class="address-btn address-btn-2" onclick="showAdress('2')">직접 입력</button>
	 	  </div>
	 	  
	 	  <div class="addressInfo-input-div-wrap">
	 	   <div class="addressInfo-input-div addressInfo-input-div-1" style="display: block">
	 	    <table>
	 	     <colgroup>
				<col width="25%">
				<col width="*">
			 </colgroup>
			 <tr>
				<th>이름</th>
				<td>
				<%= mName %>
				</td>
			</tr>
			<tr>
				<th>주소</th>
  		 		<td>
	  		 	<input class="selectAddress" value="T" type="hidden">
				<input class="addr-input" value="" type="hidden">
				<input class="address1_input" type="hidden" value="<%=address%>">
				<%=address%>									
				</td>
			</tr>
	 	    </table>
	 	   </div>
	 	   
	 	   <div class="addressInfo-input-div addressInfo-input-div-2">
	 	    <table>
	 	     <colgroup>
				<col width="25%">
				<col width="*">
			 </colgroup>
			 <tr>
				<th>이름</th>
				<td>
					<input class="addr-input">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input class="selectAddress" value="F" type="hidden">
					<input type="text" id="address1_input" name="selectAddr" placeholder="주소를 입력하세요.">
					<input class="address-input">
				</td>
			</tr>
	 	    </table>
	 	   </div>
	 	  </div> <!-- addrInfo-div-wrap -->
	 	  
	 	 </div> <!-- addrInfo-div -->
	 	 </div> <!-- order-addr -->
	 	 
	 	 <div class="order-pay">
	 	  <h3 class="subtitle">결제 정보</h3>
	 	  <div class="order-area-point">
	 	   <table class="point-table">
	 	   <% int point = m.getPoint(); %>
	 	   <colgroup>
	 	   	<col width="25%">
	 	   	<col width="*">
	 	   </colgroup>
	 	   <tr>
	 	    <th>포인트 사용</th>
	 	    <td>
	 	     <input class="point-input" value="<%=point%>">원
	 	     <a class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</a>
			 <a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none;">사용취소</a>
	 	    </td>
	 	   </tr>
	 	   </table>
	 	  </div>
	 	 </div> <!-- oder-pay -->
	 	 
	 	</form>
	 </div> <!-- orderInfo-wrap -->
	</div> <!-- container -->
	
<script type="text/javascript">
// 주소입력란 동작
function showAddress(className){
	// 모두 숨기기
	$(".addressInfo-input-div").css('display', 'none');
	// 보이기
	$(".addressInfo-input-div-" + className).css('dispaly', 'block');
	
	// 버튼 색상 변경
	$(".address-btn").css('backgroundColor', '#555');
	$(".address-btn-" + className).css('backgroundColor', '#3c3838');
	
	// 모든 selectAddress F(선택 X)
	$(".addressInfo-input-div").each(function(i, obj){
		$(obj).find(".selectAddress").val("F");
	});
	
 	// 선택한 selectAddress T(선택)
	$(".addressInfo-input-div" + className).find(".selectAddress").val("T");
}

$(".order-point-input").on("propertychange change keyup paste input", function(){
	const maxPoint = <%= point%>;
	
	let inputValue = parseInt($(this).val());
	
	if(inputValue < 0){
		$(this).val(0);
	}else if(inputValue > maxPoint){
		$(this).val(maxPoint);
	}
});

// 포인트 사용 버튼 영역

$(".order-point-input-btn").on("click", function(){
	const maxPoint = <%= point%>;
	
	let state = $(this).data("state");
	
	if(state == 'N'){
		// 값 변경
		$(".order-point-input").val(maxPoint);
		// 글 변경
		$(".order-point-input-btn-Y").css("display", "inline-block");
		$(".order-point-input-btn-N").css("display", "none");
	} else if(state == 'Y'){
		// 취소
		// 값 변경
		$(".order-point-input").val(0);
		// 글 변경
		$(".order-point-input-btn-Y").css("display", "none");
		$(".order-point-input-btn-N").css("display", "inline-block");
	}
});
</script>
</body>
</html>