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
	Order order = (Order)request.getAttribute("order");
	
	ArrayList<Basket> bList = (ArrayList<Basket>)request.getAttribute("bList");
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
   
   <div class="orderForm">
    <form name="orderForm" method="post" action="./orderProcess.jsp">
    <div id="accordion">
  
    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#collapseOne">
          주문 상품
        </a>
      </div>
    
      <div id="collapseOne" class="collapse show" data-parent="#accordion">
        <div class="card-body">
        	
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
	  		   <img src="<%=contextPath %>/resources/images/store/<%= img%>" style="width: 50px; height: 50px; margin:2px;">
			  <label for ="<%=proName%>"><%=proName%></label>
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
        	
        </div> <!-- card-body -->
      </div> <!-- collapseOne -->
    </div> <!-- card -->
    
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
        주문자 정보
      </a>
      </div>
      <div id="collapseTwo" class="collapse show" data-parent="#accordion">
        <div class="card-body">
          <div class="customer-area">
         	<table class="customer">
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
		</div>
        </div> <!-- card-body -->
      </div> <!-- collapseTwo -->
    </div> <!-- card -->
    
    
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
          배송지 정보
        </a>
      </div>
      
      <div id="collapseThree" class="collapse show" data-parent="#accordion">
        <div class="card-body">
          <div class="addressInfo_div">
			<div class="addressInfo_button_div">
			<button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color: #3c3838;">기존 주소</button>
			<button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
			</div>
			
			<%
	  	 	String address = m.getAddress();
	  		%>
			
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
								<%= mName %>
								</td>
							</tr>
							<tr>
								<th>주소</th>
   	  		 				<td>
   	  		 	<input class="selectAddress" value="T" type="hidden">
				<input class="addressee_input" value="" type="hidden">
				<input class="address1_input" type="hidden" value="<%=address%>">
				<%=address%>									
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="addressInfo_input_div addressInfo_input_div_2">
				<table>
					<colgroup>
						<col width="25%">
						<col width="*">
					</colgroup>
					<tbody>
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
							<input class="selectAddress" value="F" type="hidden">
							<input type="text" id="address1_input" name="selectAddr" placeholder="주소를 입력하세요.">
						</td>
					</tr>
					</tbody>
				</table>
						</div>
					</div>
				</div> <!-- 여기까지 배송주소 영역 -->
        </div>
      </div>
      
      <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#collapseFour">
        결제 정보
      </a>
      </div>
      <div id="collapseFour" class="collapse show" data-parent="#accordion">
        <div class="card-body">
         <div class="point-area">
		<table class="point_table">
			<colgroup>
				<col width="25%">
				<col width="*">
			</colgroup>
		<%
		 int point = m.getPoint();
		%>
		<tr>
			<th>포인트 사용</th>
			<td>
				<input class="order_point_input" value="<%=point%>">원 
				<a class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</a>
				<a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none;">사용취소</a>
			</td>
		</tr>
		</table>
	</div> <!-- point-area -->
	
		<div class="total_info_div">
			<div class="total_info_price_div">
				<ul>
					<li>
						<span id="price_span_label">상품 금액</span>
						<span class="totalPrice_span"><%=sumPrice %></span>원
						<input type="hidden" name="proSumPrice" value="<%=sumPrice%>">
					</li>
					<li>
						<span class="price_span_label">배송비</span>
						<span class="delivery_price_span">3000</span>원
						<input type="hidden" name="proDel" value="<%=order.getDelivery()%>">
					</li>
					<li>
						<span class="price_span_label">포인트</span>
						<span class="usePoint_span">0</span>원
					</li>
					<li class="price_total_li">
						<strong class="price_span_label total_price_label">결제 금액</strong>
						<strong class="strong_red">
							<span class="total_price_red finalTotalPrice_span">
							<%=sumPrice + order.getAddress() %>
							</span>원
							<input type="hidden" name="orderSum" value="<%=sumPrice + order.getAddress()%>">
						</strong>
					</li>
				</ul>
			</div>
			<!-- 결제 영역 -->
			<div class="total_info_btn_div">
			<!-- 결제하기 버튼 -->
				<button class="payment-btn" onclick="payment()">결제하기</button>
			</div>
		</div>				
				
        </div> <!-- card-body -->
      </div>
    </div>
    </div>
    </div> <!-- accordion -->
    
    </form>
   </div> <!-- orderForm -->
    
</div> <!-- container -->

<script>
$(document).ready(function(){
	
	/* 주문 조합정보란 최신화 */
	setTotalInfo();	
		
});

/* 주소입력란 버튼 */
function showAdress(className){
		/* 모두 숨기기 */
		$(".addressInfo_input_div").css('display', 'none');
		/* 컨텐츠 보이기 */
		$(".addressInfo_input_div_" + className).css('display', 'block');		
	
	/* 버튼 색상 변경 */
		/* 모든 색상 동일 */
			$(".address_btn").css('backgroundColor', '#555');
		/* 지정 색상 변경 */
			$(".address_btn_"+className).css('backgroundColor', '#3c3838');	
	/* selectAddress T/F */
		/* 모든 selectAddress F만들기 */
			$(".addressInfo_input_div").each(function(i, obj){
				$(obj).find(".selectAddress").val("F");
			});
		/* 선택한 selectAdress T만들기 */
			$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");		
		
}

/* 포인트 입력 */
//0 이상 && 사용자가 가진 포인트 이하
$(".order_point_input").on("propertychange change keyup paste input", function(){
	const maxPoint = parseInt('${memberInfo.point}');	
	
	let inputValue = parseInt($(this).val());	
	
	if(inputValue < 0){
		$(this).val(0);
	} else if(inputValue > maxPoint){
		$(this).val(maxPoint);
	}	
	
	/* 주문 조합정보란 최신화 */
	setTotalInfo();	
	
});
/* 포인트 모두사용 취소 버튼 
 * Y: 모두사용 상태 / N : 모두 취소 상태
 */
$(".order_point_input_btn").on("click", function(){
	const maxPoint = parseInt('${memberInfo.point}');	
	
	let state = $(this).data("state");	
	
	if(state == 'N'){
		/* 모두사용 */
		//값 변경
		$(".order_point_input").val(maxPoint);
		//글 변경
		$(".order_point_input_btn_Y").css("display", "inline-block");
		$(".order_point_input_btn_N").css("display", "none");
	} else if(state == 'Y'){
		/* 취소 */
		//값 변경
		$(".order_point_input").val(0);
		//글 변경
		$(".order_point_input_btn_Y").css("display", "none");
		$(".order_point_input_btn_N").css("display", "inline-block");		
	}	
	
	/* 주문 조합정보란 최신화 */
	setTotalInfo();	
	
});
/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 포인트
	let deliveryPrice = 0;			// 배송비
	let usePoint = 0;				// 사용 포인트(할인가격)
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
	
	$(".goods_table_price_td").each(function(index, element){
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 갯수
		totalCount += parseInt($(element).find(".individual_bookCount_input").val());
		// 총 종류
		totalKind += 1;
		// 총 마일리지
		totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());
	});	
	/* 배송비 결정 */
	if(totalPrice >= 60000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
	finalTotalPrice = totalPrice + deliveryPrice;	
	
	/* 사용 포인트 */
	usePoint = $(".order_point_input").val();
	
	finalTotalPrice = totalPrice - usePoint;	
	
	/* 값 삽입 */
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".goods_kind_div_count").text(totalCount);
	// 총 종류
	$(".goods_kind_div_kind").text(totalKind);
	// 총 포인트
	$(".totalPoint_span").text(totalPoint.toLocaleString());
	// 배송비
	$(".delivery_price_span").text(deliveryPrice.toLocaleString());	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
	// 할인가(사용 포인트)
	$(".usePoint_span").text(usePoint.toLocaleString());	
	
}

/* 주문 요청 */
$(".order_btn").on("click", function(){
	/* 주소 정보 & 받는이*/
	$(".addressInfo_input_div").each(function(i, obj){
		if($(obj).find(".selectAddress").val() === 'T'){
			$("input[name='address']").val($(obj).find(".addressee_input").val());
		}
	});	
	
	/* 사용 포인트 */
	$("input[name='usePoint']").val($(".order_point_input").val());	
	
	/* 상품정보 */
	
	/* 서버 전송 */
	$(".order_form").submit();	
	
});

// 이니시스 결제로 하고 싶었는데 이니시스는 등록 절차를 거쳐야해서 카카오페이로 변경
// 카카오페이 최소 결제금액 = 100원
function payment(){
	var IMP = window.IMP;
	IMP.init('imp18688349'); // 가맹점 식별코드
	
	// 이 부분은 나중에 회원 정보에서 가져오도록 수정할 예정, 현재는 결제API 연동 확인을 위한 임시 데이터입니다.
	IMP.request_pay({
		pg : "kakaopay",
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: '배불리 결제',
		amount: '<%= sumPrice%>',
		buyer_email: '<%= email%>',
		buyer_name: "<%= mName%>",
		m_redirect_url: 'redirect url'
	}), function(rsp){
		if(rsp.success){
			var msg = "결제가 완료되었습니다.";
			alert(msg);
			location.href='./orderComplete.jsp';
		}else{
			var msg = "결제에 실패하였습니다.";
			alert(msg);
		}
	}
}
</script>

</body>
</html>