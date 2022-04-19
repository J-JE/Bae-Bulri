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
	
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
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
    
    .order_btn{
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
   	<span id="zenOrder">주문하기</span> >
    <span>결제하기</span>
</div>



<div id="accordion">

<form name="orderForm" method="post" action="<%=contextPath %>/orderProcess.do">


    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#collapseOne">
          상품 정보
        </a>
      </div>
      <div id="collapseOne" class="collapse show" data-parent="#accordion">
        <div class="card-body">
           <div id="basket_info">
        	<!--장바구니 테이블-->
            <table id="info_table" style="width: 100%;">
            	<!--장바구니 테이블 머리-->
                <tr id="talbeTop">
                    <th style="padding:10px;">상품/옵션 정보</th>
                    <th style="padding:10px;">수량</th>
                    <th style="padding:10px;">상품금액</th>
                </tr>
                <!-- 장바구니 테이블 몸통 -->
                <%
                   for(int i=0; i<list.size();i++){ 
                        
                    String proName=list.get(i).getProductName(); //상품 명
                    String img = list.get(i).getThImg(); //상품 이미지
                    int amount = list.get(i).getBasketAmount();
                    int price = list.get(i).getPrice(); //상품 가격(수량*가격)
                    sumPrice+=price;
                    
                    int orderNo = list.get(i).getOrderNo();
                    int userNo = list.get(i).getUserNo();
                %>
                <input type="hidden" name="orderNo" value="<%= orderNo %>">
                <input type="hidden" name="userNo" value="<%= userNo %>">
                <tr style="border-top: solid 1px lightgray;">
                    <td class="pro_info">
                        <img src="<%=contextPath %>/resources/images/store/<%=img%>" style="width: 50px; height: 50px; margin:2px;">
                        <label for ="<%=proName%>"><%=proName%></label>
                    </td>
                    <td>
                        수량 : <%=amount%>
                    </td>
                    <td class="price">
                        <%=price%> 원
                    </td>
                </tr>
                <%} %>
           </table>
        </div>
        </div>
      </div>
    </div>
    
    
    
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
        주문자 정보
      </a>
      </div>
      <div id="collapseTwo" class="collapse show" data-parent="#accordion">
        <div class="card-body">
         <table class="user-info">
	 	  <%
	 	  String mName = m.getUserName();
	 	  String phone = m.getPhone();
	 	  String email = m.getEmail();
	 	 %>
	 	 <tr>
	 	 	<th>이름</th>
	 	 	<td><%=mName %></td>
	 	 	<td><input type="hidden" name="mName" value="<%=mName%>"></td>
	 	 </tr>
	 	 <tr>
	 	  <th>휴대전화</th>
	 	  <td><%=phone %></td>
	 	  <td><input type="hidden" name="phone" value="<%=phone%>"></td>
	 	 </tr>
	 	 <tr>
	 	  <th>이메일</th>
	 	  <td><%=email %></td>
	 	  <td><input type="hidden" name="email" value="<%=email%>"></td>
	 	 </tr>
	 	  </table> <br>
	 	  <span>* 정확한 정보로 입력되어 있는지 확인해주세요.</span> <br>
	  	  <span>* 마이페이지에서 회원정보 수정이 가능합니다.</span>
        </div>
      </div>
    </div>
    
    
    
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
          배송지 정보
        </a>
      </div>
      <div id="collapseThree" class="collapse show" data-parent="#accordion">
        <div class="card-body">
        
        <% String address = m.getAddress(); %>
        
       <div class="addressInfo_div">
		<!-- <div class="addressInfo_button_div">
			<button class="address_btn address_btn_1" onclick="showAdress('1')">기존 주소</button>
				<button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
			</div> -->
			<div class="addressInfo_input_div_wrap">
				<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
					<table>
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>이름</th>
								<td>
									<%=mName %>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<%=address %>
									<input class="selectAddress" value="T" type="hidden">
									<input class="address1_input" name="address" type="hidden" value="<%=address%>">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="addressInfo_input_div addressInfo_input_div_2">
				<!--	<table>
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>이름</th>
								<td>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<input class="selectAddress" value="F" type="hidden">
									<input class="address1_input">직접 입력<br>
								</td>
							</tr>
						</tbody>
					</table> -->
				</div>
			</div>
		</div>				
          
          
        </div>       
        
      </div>
    </div>
    
    
    
    
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
          결제 정보
        </a>
      </div>
      <div id="collapseFour" class="collapse show" data-parent="#accordion">
        <div class="card-body">
        
        <div class="point_div">
		<% int point = m.getPoint(); %>
		<table class="point_table">
		<colgroup>
			<col width="25%">
			<col width="*">
		</colgroup>
		<tbody>
		<tr>
			<th>포인트 사용</th>
			<td>
				<%=point %> | <input class="order_point_input" value="0">원 
				<a class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</a>
				<a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none;">사용취소</a>
				
			</td>
		</tr>
		</tbody>
		</table>
		</div> <!-- 포인트 영역 -->
        
          
          <div class="tatal_info_div">
          
          <div class="total_info_price_div">
          
          <!--%
          
            for(int i=0; i<list.size();i++){ 
                 
             String proName=list.get(i).getProductName(); //상품 명
             String img = list.get(i).getThImg(); //상품 이미지
             int amount = list.get(i).getBasketAmount();
             int price = list.get(i).getPrice(); //상품 가격(수량*가격)
             int delivery = 3000; // 배송비
             sumPrice = price + delivery;
          %-->
          
          <ul>
          	<li>
          		<span class="price_span_label">상품 금액</span>
          		<span class="totalPrice_span"> <%=sumPrice %> </span>원
          	</li>
          	
          	<li>
          		<span class="price_span_label">배송비</span>
          		<span class="delivery_price_span"> 3000 </span>원
          	</li>
          	
          	<li>
          		<span class="price_span_label">포인트</span>
          		<span class="usePoint_span"> <%= point %> </span>원
          	</li>
          	
          	<li class="price_total_li">
          		<strong class="price_span_label total_price_label">결제 금액</strong>
          		<strong class="strong_red">
          			<span class="total_price_red finalTotalPrice_span">
          				<%= sumPrice+3000 %>
          			</span>원
          		</strong>
          	</li>
          <!--%} %-->
          </ul>
          
          </div>         
          </div> <!-- 최종 결제 정보 영역 -->
          
          <div class="total_info_btn_div">
          	<button class="order_btn">주문하기</button>
          </div>
 
        </div>
      </div>
    </div>
</form>    
    
  </div> <!-- accordion -->


</div> <!-- container -->


<script type="text/javascript">
$(document).ready(function(){
	setTotalInfo();
});


// 포인트 영역
// 0 이상 최대 포인트 이하
$(".order_point_input").on("properychange change keyup paste input", function(){
	const maxPoint = <%= point%>;
	
	let inputValue = parseInt($(this).val());
	
	if(inputValue < 0){
		$(this).val(0);
	} else if(inputValue > maxPoint){
		$(this).val(maxPoint);
	}
	
	setTotalInfo();
});

$(".order_point_input_btn").on("click", function(){
	let maxPoint = <%= point%>;
	
	let state = $(this).data("state");
	
	if(state == 'N'){
		// 모두 사용
		// 값 변경
		$(".order_point_input").val(maxPoint);
		// 글 변경
		$(".order_point_input_btn_Y").css("display", "inline-block");
		$(".order_point_input_btn_N").css("display", "none");
	} else if(state == 'Y') {
		// 취소
		// 값 변경
		$(".order_point_input").val(0);
		// 글 변경
		$(".order_point_input_btn_Y").css("display", "none");
		$(".order_point_input_btn_N").css("display", "inline-block");
	}
	
	setTotalInfo();
});


// 결제하기 버튼
$(".order_btn").on("click", function(){
	// 주소
	$(".addressInfo_input_div").each(function(i, obj){
		if($(obj).find(".selectAddress").val() === 'T'){
			$("input[name='memberAddr1']").val($(obj).find(".address1_input").val());
		}
	});
	
	// 포인트
	$("input[name='usePoint']").val($(".order_point_input").val());
	
	
	// 전송
	$(".orderForm").submit();
});

</script>

</body>
</html>