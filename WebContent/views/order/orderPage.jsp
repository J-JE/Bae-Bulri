<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.member.model.dto.Member"%>
<%
	Member m = (Member)request.getAttribute("loginUser");
	//String name = m.getUserName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기 : 배불리</title>
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
   </div> <!-- con-top -->
   
   <div id="accordion">
   	<div class="card">
   	 <div class="card-header">
   	  <a class="collapsed card-link" data-toggle="collapse" href="#collapseOne">
   	  	주문 상품
   	  </a>
   	 </div> <!-- card-header -->
   	 <div id="collapseOne" class="collapse show" data-parent="#accordion">
   	 	
   	 </div> <!-- collapseOne -->
   	</div> <!-- card -->
   	
   	<div class="card">
   	 <div class="card-header">
   	  <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
   	  	주문자 정보
   	  	<!-- 수정 버튼 -->
   	  </a>
   	 </div> <!-- card-header -->
   	 <div id="collapseTwo" class="collapse show" data-parent="#accordion">
   	  <div class="customer-area">
   	   주문자 : <% if(m != null) {
   		   m.getUserName();
   	   }else{%> 주문자 이름 들어올 자리
   	   <%} %>
   	   <br>
   	   전화번호 : <% if(m != null){
   		   m.getPhone();
   	   }else{ %> 전화번호 들어올 자리
   	   <%} %>
   	   <br>
   	   이메일 : <% if(m != null){
   		   m.getEmail();
   	   }else{ %> 이메일 들어올 자리
   	   <%} %>
   	   <br><br>
   	   * 정확한 정보로 등록되어 있는지 확인해주세요.
   	  </div> <!-- customer-area -->
   	 </div> <!-- collapseTwo -->
   	</div> <!-- card -->
   	
   	<div class="card">
   	<div class="card-header">
   	 <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
   	 	배송지 정보
   	 </a>
   	</div> <!-- card-header -->
   	<div id="collapseThree" class="collapse show" data-parent="#accordion">
   	 <div class="addr-info">
   	 
   	  <div class="addr-area-1">
   	  <button class="addr_btn addr_btn_1" onclick="showAddr('1')" style="background-color: #3c3838;">기존 주소</button>
   	  <button class="addr_btn addr_btn_2" onclick="showAddr('2')">직접 입력</button>
   	 </div> <!-- addr-area-1 -->
   	 
   	 <div class="addr-area-2">
   	  <div class="addr-area-2 addr-inner-div" style="display: block">
   	  	<table>
   	  		<colgroup>
   	  			<col width="25%">
   	  			<col width="*">
   	  		</colgroup>
   	  		<tr>
   	  		 <th>이름</th>
   	  		 <td>
   	  		 	<% if(m != null){
   	  		 		m.getUserName();
   	  		 	}else{ %> 이름 들어가는 부분
   	  		 	<%} %>
   	  		 </td>
   	  		</tr>
   	  		<tr>
   	  		 <th>주소</th>
   	  		 <td>
   	  		 	<input class="selectAddress" value="T" type="hidden">
				<input class="addressee_input" value="" type="hidden">
				<input class="address1_input" type="hidden" value="">
				<% if(m != null){
					m.getAddress();
				}else{ %> 주소 들어갈 자리
				<%} %>
   	  		 </td>
   	  		</tr>
   	  	</table>
   	  </div>
   	  
   	  <div class="addr-area2 addr-inner-div-2" style="display: bloack">
   	  	<table>
   	  		<colgroup>
   	  			<col width="25%">
   	  			<col width="*">
   	  		</colgroup>
   	  		<tr>
   	  			<th>이름</th>
   	  			<td>
   	  			 <input class="addressee_input">
   	  			</td>
   	  		</tr>
   	  		<tr>
   	  			<th>주소</th>
   	  			<td>
   	  				<input class="selectAddress" value="F" type="hidden">
					<input type="text" id="selectAddr" name="selectAddr">
   	  			</td>
   	  		</tr>
   	  	</table>
   	  </div>
  	 </div> <!-- addr-area-2 -->
   	 
   	 </div> <!-- addr-info -->
   	</div> <!-- collapseThree -->
   	</div> <!-- card -->
   	
   	<div class="card">
   	<div class="card-header">
   	 <a class="collapsed card-link" data-toggle="collapse" href="#collapseFour">
   	 	결제 정보
   	 </a>
   	 <div id="collapseFour" class="collapse show" data-parent="#accordion">
   	  <div>
   	  </div>
   	 </div> <!-- collapseFour -->
   	</div> <!-- card-header -->
   	</div> <!-- card -->
   
   </div> <!-- accordion -->  
    
	
      
      <div class="card">
      <div id="collapseFour" class="collapse show" data-parent="#accordion">
        <div class="card-body">
         <div class="point-area">
		<table class="point_table">
			<colgroup>
				<col width="25%">
				<col width="*">
			</colgroup>
		<tbody>
		<tr>
			<th>포인트 사용</th>
			<td>
				포인트
				<% if(m != null) {
				m.getPoint();
				}else{ %>
				<%} %>
				<input class="order_point_input" value="0">원 
				<a class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</a>
				<a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none;">사용취소</a>
			</td>
		</tr>
		</tbody>
		</table>
	</div> <!-- point-area -->
	
		<div class="total_info_div">
			<!-- 가격 종합 정보 -->
			<div class="total_info_price_div">
				<ul>
					<li>
						<span class="price_span_label">상품 금액</span>
						<span class="totalPrice_span">10</span>원
					</li>
					<li>
						<span class="price_span_label">배송비</span>
						<span class="delivery_price_span">3000</span>원
					</li>
					<li>
						<span class="price_span_label">포인트</span>
						<span class="usePoint_span">10</span>원
					</li>
					<li class="price_total_li">
						<strong class="price_span_label total_price_label">결제 금액</strong>
						<strong class="strong_red">
							<span class="total_price_red finalTotalPrice_span">
								10
							</span>원
						</strong>
					</li>
				</ul>
			</div>
			
			
			<div class="total_info_btn_div">
				<a class="order_btn">결제하기</a>
			</div>
			
			<div class="paymentArea">
            <!-- 결제하기 버튼 -->
            <button onclick="payment()">결제하기</button>
            </div> <!-- paymentArea -->
		</div>				
				
        </div> <!-- card-body -->
      </div>
    </div>
    
    </div> <!-- accordion -->
	
</div> <!-- container -->

	<script>
		function payment(){
			var IMP = window.IMP;
			IMP.init('imp18688349'); // 가맹점 식별코드
			
			// 이 부분은 나중에 회원 정보에서 가져오도록 수정할 예정, 현재는 결제API 연동 확인을 위한 임시 데이터입니다.
			IMP.request_pay({
				pg: "inicis",
				pay_method: "card", // 결제수단
			    merchant_uid : 'merchant_'+new Date().getTime(), // 주문번호
			    name : '배불리 결제',
			    amount : '1',
			    buyer_email : '<%= m.getEmail() %>',
			    buyer_name : '<%= m.getUserName() %>',
			    buyer_tel : '<%= m.getPhone() %>',
			    buyer_addr : '<%= m.getAddress() %>'
			}, function (rsp){
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
					alert(msg);
					location.href = "/views/order/orderComplete.jsp";
				}else{
					var msg = '결제에 실패하였습니다.';
					alert(msg);
					location.href = "" // 결제실패 메세지 후 띄워줄 에러페이지 (아직 안 만듦)
				}
			})
		}
	</script>
</body>
</html>