<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기 : 배불리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<div class="paymentArea">
		<!-- 결제하기 버튼 -->
		<button onclick="payment()">결제하기</button>
	</div>

	<script>
		function payment(){
			var IMP = window.IMP;
			IMP.init('imp18688349'); // 가맹점 식별코드
			
			IMP.request_pay({
				pg: "inicis",
				pay_method: "card", // 결제수단
			    merchant_uid : 'merchant_'+new Date().getTime(), // 주문번호
			    name : '주문자',
			    amount : 10000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동'
			}, function (rsp){
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
					alert(msg);
					location.href = "" // 결제완료 후 띄워줄 주문완료 페이지 (아직 안 만듦)
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