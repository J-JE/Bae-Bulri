<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <!-- 이 부분 a 태그로 링크 연결해야할지...? 결제하기 때문에 애매함 -->
            <span>장바구니</span> >
            <span id="zenOrder">주문하기</span> >
            <span>결제하기</span>
        </div>

        <div id="accordion">
          <div class="card">
            <div class="card-header">
              <span class="card-link" data-toggle="collapse" href="#collapseOne">
                <table class="table-cart">
                          <tbody>
                              <tr>상품/옵션정보</tr>
                              <tr>수량</tr>
                              <tr>상품금액</tr>
                          </tbody>
                 </table>
              </span>
            </div>
            <div id="collapseOne" class="collapse show" data-parent="#accordion">
              <div class="card-body">
                <table class="product-talbe">
                   상품 정보 들어갈 공간
                </table>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-header">
              <span class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
              배송지 정보
            </span>
            <button type="button">수정</button>
            </div>
            <div id="collapseTwo" class="collapse show" data-parent="#accordion">
              <div class="card-body">
                <span class="delInfo">
                 <h5>배송지 정보</h5>
                  주문자 이름
                  <br>
                  전화번호
                  <br>
                  주소
                  주소2
                </span>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-header">
              <span class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
                주문자 정보
              </span>
              <button type="button">수정</button>
            </div>
            <div id="collapseThree" class="collapse show" data-parent="#accordion">
              <div class="card-body">
                <span class="orderInfo">
                <h5>주문자 정보</h5>
                주문자 이름 <br>
                전화번호 <br>
                이메일 <hr>
                * 주문자 정보로 결제 관련 정보가 제공됩니다. <br>
                * 정확한 정보로 등록되어있는지 확인해주세요.
                </span>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-header">
              <span class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
                결제하기
              </span>
            </div>
            <div id="collapseFour" class="collapse show" data-parent="#accordion">
              <div class="card-body">
                <table class="point-table">
                    <tbody>
                        <tr>
                            <th>포인트 사용</th>
                            <td> 원
                            <a class="point-input-btn usebtn" data-state="N">모두 사용</a>
                            <a class="point-input-btn donotbtn" data-state="Y" style="display: none;">취소</a>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="priceInfo">
                    <ul>
                        <li>
                            <span class="price-label">주문금액</span>
                            <span class="price-label-span"></span>원
                        </li>
                        <li>
                            <span class="del-label">배송비</span>
                            <span class="del-label-span">3000</span>원
                        </li>
                        <li>
                            <span class="point-label">포인트 사용</span>
                            <span class="point-lable-span">0</span>원
                        </li>
                        <li class="totalPrice">
                            <strong>결제금액</strong>
                            <strong>
                                <span class="total-price-label">30000</span>원
                            </strong>
                        </li>
                    </ul>
                </div>
                <div class="paymentArea">
                    <!-- 결제하기 버튼 -->
                    <button onclick="payment()">결제하기</button>
                </div>
              </div>

            </div>
          </div>

        </div>
      </div>

	<script>
		function payment(){
			var IMP = window.IMP;
			IMP.init('imp18688349'); // 가맹점 식별코드
			
			// 이 부분은 나중에 회원 정보에서 가져오도록 수정할 예정, 현재는 결제API 연동 확인을 위한 임시 데이터입니다.
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